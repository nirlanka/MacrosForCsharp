package macromania.readers;

class FileIOFactory {
	var fileNames: Array<String> = [];
	var currentFileIdx: Int = -1;
	var currentIO: FileIO;

	public function new(folderPath: String) {
		recursiveLoop(folderPath);
	}

	function recursiveLoop(directory:String) {
	  if (sys.FileSystem.exists(directory)) {
	    
		for (file in sys.FileSystem.readDirectory(directory)) {
	      var path = haxe.io.Path.join([directory, file]);
	      if (!sys.FileSystem.isDirectory(path)) {
	        if (isValidCandidateFile(path)) {
	        	fileNames.push(path);
        	}
	      } else {
	        var directory = haxe.io.Path.addTrailingSlash(path);
	        recursiveLoop(directory);
	      }
	    }
	  } else {
	    trace('"$directory" does not exists');
	  }
	}

	function isValidCandidateFile(path: String) {
		var csReg = ~/.+([\.\w]*.cs)/;
		var isCsMatch = csReg.match(path);
		var ext = csReg.matched(1);

		if (isCsMatch && ext != '.i.cs' && ext != '.g.cs') {
			return true;
		} else {
			return false;
		}
	}

	public function getNextReader() {
		currentFileIdx += 1;

		if (fileNames.length >= currentFileIdx + 1) {
			currentIO = new FileIO(fileNames[currentFileIdx]);
			return currentIO;
		} else {
			return null;
		}
	}
}