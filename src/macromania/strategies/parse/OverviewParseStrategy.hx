package macromania.strategies.parse;

import macromania.constructs.Namespace;
import macromania.constructs.Klass;
import macromania.constructs.Method;
import macromania.constructs.Context;

class OverviewParseStrategy implements IParseStrategy {
	var code: String;
	var ast: Array<Namespace>; 
	var current: Context;

	public inline function new() {}

	public function setup(code: String, ast: Array<Namespace>, current: Context) {
		this.code = code;
		this.ast = ast;
		this.current = current;

		return this;
	}

	public function parse() {
		var lines = code.split('\n');
  	
	  	for (l in lines) {
	  		l += '\n';

			var eregNamespace = ~/\s*namespace\s+(.+)\s*\n/;
	  		var isNamespace = eregNamespace.match(l);

	  		if (isNamespace) {
	  			current.namespace = new Namespace(StringTools.trim(eregNamespace.matched(1)));
	  			ast.push(current.namespace);
	  		} else {
	  			var eregKlass = ~/\s*class\s+(.+)\s*\n/;
	  			var isKlass = eregKlass.match(l);

	  			if (isKlass) {
	  				current.klass = new Klass(StringTools.trim(eregKlass.matched(1)));
	  				createNamespaceIfNone();
	  				current.namespace.klasses.push(current.klass);
	  			} else {
	  				var eregMethod = ~/([\w\s\.<>]+\([\w\s\.<>,:\[\]=]*\))\s*\n/;
	  				var isMethod = eregMethod.match(l);

	  				if (isMethod) {
	  					current.method = new Method(StringTools.trim(eregMethod.matched(1)));
	  					createNamespaceIfNone();
	  					if (current.klass == null) {
	  						throw 'No class for method';
	  					}
	  					current.klass.methods.push(current.method);
	  				}
	  			}
	  		}
	  	}

	  	return this;
	}

	function createNamespaceIfNone() {
		if (current.namespace == null) {
			current.namespace = new Namespace('_');
			ast.push(current.namespace);
		}
	}
}