import std.stdio;

class SourceFile {
	this( string filename ) {
		_file = File( filename , "rb");
	}

	void read( ref char[] data ){
		_file.rawRead!(char)( data );
	}

	ulong getPosition(){
		return _file.tell();
	}
	void setPosition( ulong pos ){
		_file.seek( pos, SEEK_SET );
	}

	string _filemane;
	File _file;

	char[] buffer;
}