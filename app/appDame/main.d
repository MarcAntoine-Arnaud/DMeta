import specification.nodes.nodeChar;
import specification.nodes.nodeShort;
import specification.nodes.nodeInt;
import specification.node;
import specification.spec;
import specification.formatSpecifications.wav;
import specification.formatSpecifications.mxf;
import comparator.comp;
import std.stdio;
import std.getopt;

int majorVersion = 0;
int minorVersion = 0;

void main(string[] args) {

	enum Color { no, yes };

	string filename = "";
	Color color;
	bool verbose = false;
	bool help = false;

	getopt(
		args,
		"file|f", &filename,
		"verbose|v", &verbose,
		"color|c", &color,
		"help|h", &help,
		);


	if( help ) {
		writeln( "dame - ", majorVersion, ".", minorVersion );
		writeln( "" );
		writeln( " file: input filename" );
		writeln( " verbose: enable verbosity" );
		writeln( "" );
		writeln( "Author:" );
		writeln( "Marc-Antoine ARNAUD - arnaud.marcantoine@gmail.com" );
		return;
	}

	if( filename.length == 0 )
	{
		writeln( "meta require an input filename." );
		return;
	}

	writeln( "start extract meta" );

	//auto s = new Specification();
	WavSpecification s = new WavSpecification();;
	auto c = new Comparator( s, filename );

	c.run();
	
	writeln( "end of meta extraction" );
}

