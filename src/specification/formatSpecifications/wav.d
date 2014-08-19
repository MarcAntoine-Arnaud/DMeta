import specification.spec;
import specification.nodes.nodeGroup;
import specification.nodes.nodeChar;
import specification.nodes.nodeInt;

class WavSpecification : Specification{
	string rootId = "root";
	string chunkRiffId = "chunckRIFF";
	string chunkWaveId = "chunckWAVE";
	string chunkSubRiffId = "subRIFF";
	string chunkSizeId = "chunckSize";
	string riffTypeId = "riffType";
	
	this() {
		_id = "wav";
		_label = "Waveform Audio File Format";
		_description = "Microsoft and IBM audio file format standard for storing an audio bitstream on PCs.";
		_extensions =  [ "wav", "wave" ];
		
		auto root = new NodeGroup( rootId );
		auto riffChunk = new NodeGroup( chunkRiffId );
		auto waveChunk = new NodeGroup( chunkWaveId );

		auto rChunk = new NodeChar( chunkSubRiffId );
		auto iChunk = new NodeChar( chunkSubRiffId );
		auto fChunk = new NodeChar( chunkSubRiffId );
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
		
		riffChunk.addChild( rChunk );
		riffChunk.addChild( iChunk );
		riffChunk.addChild( fChunk );
		riffChunk.addChild( fChunk );

		waveChunk.addChild( wRiffType );
		waveChunk.addChild( aRiffType );
		waveChunk.addChild( vRiffType );
		waveChunk.addChild( eRiffType );

		root.addChild( riffChunk );
		root.addChild( chunkSize );
		root.addChild( waveChunk );

		add( root );
	}
}
