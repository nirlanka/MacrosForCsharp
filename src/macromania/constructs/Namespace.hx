package macromania.constructs;

class Namespace implements IMakroContainer {
	public var name: String;
	public var klasses: Array<Klass> = [];
	public var makros: Array<Makro> = [];

	public function new(name) {
		this.name = name;
	}
}