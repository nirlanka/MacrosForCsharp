package macromania.readers;

import sys.io.File;

class FileIO implements IReader implements IWriter {
	var fileName: String;
	var content: String;

	public function new(fileName: String) {
		this.fileName = fileName;
	}

	public function read() {
	    try {
	        content = File.getContent(fileName);
	    } catch (e: Dynamic) {
	    	trace('Error: reading file failed. (File: ' + fileName + ')');
	    }
	}

	public function getContent() {
		return content;
	}

	public function setContent(content: String) {
		this.content = content;
	}

	public function write() {
		File.saveContent(fileName, content);
	}
}