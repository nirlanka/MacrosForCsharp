package macromania.constructs;

class Makro {
	public var command: String;
	public var code: Array<String> = [];

	public function new(command) {
		this.command = command;
	}
}