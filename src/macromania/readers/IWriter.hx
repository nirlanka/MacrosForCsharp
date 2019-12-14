package macromania.readers;

interface IWriter {
	function write(): Void;
	function setContent(content: String): Void;
}