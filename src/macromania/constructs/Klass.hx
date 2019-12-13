package macromania.constructs;

class Klass {
	public var name: String;
	public var methods: Array<Method> = [];

	public inline function new(name) {
		this.name = name;
	}
}