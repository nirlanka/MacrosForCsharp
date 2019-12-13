package macromania.strategies.parse;

import macromania.constructs.Namespace;
import macromania.constructs.Context;

interface IParseStrategy {
	function setup(code: String, ast: Array<Namespace>, current: Context): IParseStrategy;
	function parse(): IParseStrategy;
}