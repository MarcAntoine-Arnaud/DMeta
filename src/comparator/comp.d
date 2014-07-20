import specification.spec;
import std.stdio;

class Comparator {
	this( Specification spec ) {
		this._spec = spec;
	}

	@property {
		ref Specification spec() { return _spec; }
	}

	void run() {
		writeln( "start compare" );
		writeln( "end compare" );
	}

	Specification _spec;
}