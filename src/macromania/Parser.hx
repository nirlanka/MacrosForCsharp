package macromania;

class Parser {
  var code: String;
  var ast: Array<Namespace> = [];
  var current = new Context();

  public function new(code) {
  	this.code = code;
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

  public function trace() {
  	for (n in ast) {
  		trace(n.name);

  		for (k in n.klasses) {
  			trace('\t' + k.name);

  			for (m in k.methods) {
  				trace('\t\t' + m.name);
  			}
  		}
  	}

  	return this;
  }
}

class Namespace {
	public var name: String;
	public var klasses: Array<Klass> = [];

	public inline function new(name) {
		this.name = name;
	}
}

class Klass {
	public var name: String;
	public var methods: Array<Method> = [];

	public inline function new(name) {
		this.name = name;
	}
}

class Method {
	public var name: String;

	public inline function new(name) {
		this.name = name;
	}
}

class Context {
	public var namespace = new Namespace('_');
	public var klass: Klass;
	public var method: Method;

	public inline function new() {}
}