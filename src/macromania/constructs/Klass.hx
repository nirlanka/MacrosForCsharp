package macromania.constructs;

class Klass implements IMakroContainer {
	public var name: String;
	public var methods: Array<Method> = [];
	public var makros: Array<Makro> = [];

	public function new(name) {
		this.name = name;
	}
}