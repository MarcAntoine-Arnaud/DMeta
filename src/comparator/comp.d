import specification.node;
import specification.spec;
import comparator.sourceFile;
import std.stdio;

class Comparator {
	this( Specification spec, string filename ) {
		this._spec = spec;
		_sourceFile = new SourceFile( filename );
	}

	@property {
		ref Specification spec() { return _spec; }
	}

	void run() {
		writeln( "start compare" );

		_currentNode = 0;
		foreach( Node node; _spec.nodes ){
			writeln( "-> ", node.id() );
			char[] data;
			data.length = node.getDataSize();
			//writeln( data.length );
			_sourceFile.read( data );

			node.isValid( data );
		}
		writeln( "end compare" );
	}

	Specification _spec;
	SourceFile _sourceFile;
	int _currentNode;
}