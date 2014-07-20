import specification.nodes.nodeChar;
import specification.nodes.nodeShort;
import specification.nodes.nodeInt;
import specification.node;
import specification.spec;
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
		writeln( "meta - ", majorVersion, ".", minorVersion );
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

	auto s = new Specification();
	auto c = new Comparator( s, filename );

	string objectIdentifierId = "objectIdentifier";
	string labelSizeId = "labelSize";
	string designatorId = "designator";

	auto objectIdentifier = new NodeChar( objectIdentifierId );
	auto labelSize = new NodeChar( labelSizeId );
	auto designator1 = new NodeChar( designatorId );
	auto designator2 = new NodeChar( designatorId );

	objectIdentifier.setValue( 0x06 );
	labelSize.setValue( 0x0e );
	designator1.setValue( 0x2b );
	designator2.setValue( 0x34 );

	s.add( objectIdentifier );
	s.add( labelSize );
	s.add( designator1 );
	s.add( designator2 );

	c.run();
	
	writeln( "end of meta extraction" );
}
