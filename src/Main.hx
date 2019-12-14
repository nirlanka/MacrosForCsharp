import macromania.Parser;

import macromania.readers.FileIOFactory;

class Main {

	static function main() {
	  	var fac = new FileIOFactory('/Users/nirmal/Dev/haxe-one/test');
	  	var io = fac.getNextReader();
	  	io.read();
	  	var code = io.getContent();
		(new Parser(code)).parse().trace();
	}
}