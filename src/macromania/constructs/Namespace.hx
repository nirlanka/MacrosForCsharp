package macromania.constructs;

class Namespace {
	public var name: String;
	public var klasses: Array<Klass> = [];

	public inline function new(name) {
		this.name = name;
	}
}