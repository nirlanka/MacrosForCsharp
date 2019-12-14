package macromania.constructs;

class Context {
	public var namespace = new Namespace('_');
	public var klass: Klass;
	public var method: Method;
	public var makro: Makro;

	public function new() {}
}