package macromania.readers;

interface IReader {
	function read(): Void;
	function getContent(): String;
}