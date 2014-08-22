import specification.spec;
import specification.listSpecifications;
import comparator.comp;
import std.stdio;
import std.getopt;

int majorVersion = 0;
int minorVersion = 0;
int releaseVersion = 0;

void main(string[] args) {

	enum Color { no, yes };

	string filename = "";
	string spec = "";
	Color color;
	bool specs = false;
	bool verbose = false;
	bool help = false;

	getopt(
		args,
		"file|f", &filename,
		"spec|s", &spec,
		"specs", &specs,
		"verbose|v", &verbose,
		"color|c", &color,
		"help|h", &help,
		);


	if( help ) {
		writeln( "dame - ", majorVersion, ".", minorVersion, ".", releaseVersion );
		writeln( "" );
		writeln( " --file -f: \tinput filename" );
		writeln( " --spec -s: \tspecification id" );
		writeln( " --specs:   \tlist specification id" );
		writeln( " --verbose -v:\tenable verbosity" );
		writeln( "" );
		writeln( "Author:" );
		writeln( " Marc-Antoine ARNAUD - arnaud.marcantoine@gmail.com" );
		return;
	}

	if( specs ){
		ListSpecifications l = new ListSpecifications(true);
		foreach( Specification s; l.getAllSpecs() ){
			writeln( s._id, "\t", s._label );
		}
		return;
	}

	if( filename.length == 0 ){
		writeln( "meta require an input filename." );
		return;
	}

	ListSpecifications l = new ListSpecifications();
	l.load();

	if( ! l.contains( spec ) ){
		writeln( "specification was not recognize." );
		return;
	}

	auto s = l.get( spec );

	writeln( "start extract meta" );

	auto c = new Comparator( s, filename );

	c.run();
	
	writeln( "end of meta extraction" );
}

