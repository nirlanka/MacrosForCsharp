package macromania.readers;

class FileIOFactory {
	var fileNames: Array<String> = [];
	var currentFileIdx: Int = -1;
	var currentIO: FileIO;

	public function new(folderPath: String) {
		recursiveLoop(folderPath);

		// trace('Files: $fileNames');
	}

	function recursiveLoop(directory:String) {
	  if (sys.FileSystem.exists(directory)) {
	    // trace("Directory found: " + directory);
	    for (file in sys.FileSystem.readDirectory(directory)) {
	      var path = haxe.io.Path.join([directory, file]);
	      if (!sys.FileSystem.isDirectory(path)) {
	        // trace("File found: " + path);
	        if (isValidCandidateFile(path)) {
	        	fileNames.push(path);
        	}
	      } else {
	        var directory = haxe.io.Path.addTrailingSlash(path);
	        // trace("Directory found: " + directory);
	        recursiveLoop(directory);
	      }
	    }
	  } else {
	    trace('"$directory" does not exists');
	  }
	}

	function isValidCandidateFile(path: String) {
		var _reversedArray = path.split('');
		_reversedArray.reverse();
		var reversed = _reversedArray.join('');

		// trace('Reversed: ' + reversed);

		if (reversed.substr(0, 3) == 'sc.') {
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