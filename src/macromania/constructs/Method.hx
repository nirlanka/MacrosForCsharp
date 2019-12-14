package macromania.constructs;

class Method implements IMakroContainer {
	public var name: String;
	public var makros: Array<Makro> = [];

	public function new(name) {
		this.name = name;
	}
}