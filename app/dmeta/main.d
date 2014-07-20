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

	//string objectIdentifierId = "objectIdentifier";
	//string labelSizeId = "labelSize";
	//string designatorId = "designator";
	//string registryCategoryDesignatorId = "registryCategoryDesignator";
	//string registryDesignatorId = "registryDesignator";
 

	//auto objectIdentifier = new NodeChar( objectIdentifierId );
	//auto labelSize = new NodeChar( labelSizeId );
	//auto designator = new NodeShort( designatorId );
	//auto registryCategoryDesignator = new NodeShort( registryCategoryDesignatorId );
	//auto registryDesignator = new NodeShort( registryDesignatorId );

	//objectIdentifier.setValue( 0x06 );
	//labelSize.setValue( 0x0e );
	//designator.setValue( 0x2b34 );
	//registryCategoryDesignator.setValue( 0x02 );
	//registryDesignator.setValue( 0x05 );

	//s.add( objectIdentifier );
	//s.add( labelSize );
	//s.add( designator );
	//s.add( registryCategoryDesignator );
	//s.add( registryDesignator );

	//c.run();

	string chunkId = "chunckRIFF";
	string chunkSizeId = "chunckSize";
	string riffTypeId = "riffType";

	auto rChunk = new NodeChar( chunkId );
	auto iChunk = new NodeChar( chunkId );
	auto fChunk = new NodeChar( chunkId );
	auto chunkSize = new NodeInt( chunkSizeId );
	auto wRiffType = new NodeChar( riffTypeId );
	auto aRiffType = new NodeChar( riffTypeId );
	auto vRiffType = new NodeChar( riffTypeId );
	auto eRiffType = new NodeChar( riffTypeId );

	rChunk.setValue( 'R' );
	iChunk.setValue( 'I' );
	fChunk.setValue( 'F' );

	wRiffType.setValue( 'W' );
	aRiffType.setValue( 'A' );
	vRiffType.setValue( 'V' );
	eRiffType.setValue( 'E' );
	
	s.add( rChunk );
	s.add( iChunk );
	s.add( fChunk );
	s.add( fChunk );
	s.add( chunkSize );
	s.add( wRiffType );
	s.add( aRiffType );
	s.add( vRiffType );
	s.add( eRiffType );


	c.run();
	
	writeln( "end of meta extraction" );
}

