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
		foreach( Node node; _spec._nodes ){
			node.printProperties();
			node.isValid( _sourceFile );
		}
		writeln( "end compare" );
	}

	Specification _spec;
	SourceFile _sourceFile;
	int _currentNode;
}