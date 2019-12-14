package macromania.constructs;

class Method implements IMakroContainer {
	public var name: String;
	public var makros: Array<Makro> = [];

	public inline function new(name) {
		this.name = name;
	}
}