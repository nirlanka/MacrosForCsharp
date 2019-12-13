package macromania;

import macromania.strategies.parse.IParseStrategy;
import macromania.strategies.parse.OverviewParseStrategy;
import macromania.constructs.Namespace;
import macromania.constructs.Context;

class Parser {
  var code: String;
  var ast: Array<Namespace> = [];
  var current = new Context();

  public function new(code) {
  	this.code = code;
  }

  public function parse(?strategy: IParseStrategy) {
    if (strategy == null) {
      strategy = new OverviewParseStrategy();
    }
    
  	strategy.setup(code, ast, current).parse();

  	return this;
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