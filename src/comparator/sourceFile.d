import std.stdio;

class SourceFile {
	this( string filename ) {
		_file = File( filename , "rb");
	}

	void read( ref char[] data ){
		_file.rawRead!(char)( data );
	}

	string _filemane;
	File _file;

	char[] buffer;
}