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
  		trace('<namespace> ' + n.name);

      for (mm in n.makros) {
        trace('\t# ' + mm.command);
        for (mml in mm.code) {
          trace('\t# ' + StringTools.trim(mml));
        }
      }

  		for (k in n.klasses) {
  			trace('\t' + '<class> ' + k.name);

        for (mm in k.makros) {
          trace('\t\t# ' + mm.command);
          for (mml in mm.code) {
            trace('\t\t# ' + StringTools.trim(mml));
          }
        }

  			for (m in k.methods) {
  				trace('\t\t' + '<method> ' + m.name);

          for (mm in m.makros) {
            trace('\t\t\t# ' + mm.command);
            for (mml in mm.code) {
              trace('\t\t\t# ' + StringTools.trim(mml));
            }
          }
  			}
  		}
  	}

  	return this;
  }

  public function process() {
    // 

    return this;
  }

  public function write() {
    // 

    return this;
  }
}