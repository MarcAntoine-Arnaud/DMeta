import specification.spec;
import specification.listSpecifications;
import comparator.comp;
import std.stdio;
import std.getopt;

int majorVersion = 0;
int minorVersion = 0;
int releaseVersion = 1;

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
		"f|file", &filename,
		"s|spec", &spec,
		"specs", &specs,
		"v|verbose", &verbose,
		"c|color", &color,
		"h|help", &help,
		);


	if( help ) {
		writeln( "dame - ", majorVersion, ".", minorVersion, ".", releaseVersion );
		writeln( "" );
		writeln( " -f, --file: \tinput filename" );
		writeln( " -s, --spec: \tspecification id" );
		writeln( " --specs:   \tlist specification id" );
		writeln( " -v, --verbose:\tenable verbosity" );
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

