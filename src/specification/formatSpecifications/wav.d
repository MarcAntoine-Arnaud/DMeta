import specification.spec;
import specification.nodes.nodeChar;
import specification.nodes.nodeInt;

class WavSpecification : Specification{
	string chunkId = "chunckRIFF";
	string chunkSizeId = "chunckSize";
	string riffTypeId = "riffType";
	
	this() {
		_id = "wav";
		_label = "Waveform Audio File Format";
		_description = "Microsoft and IBM audio file format standard for storing an audio bitstream on PCs.";
		_extensions =  [ "wav", "wave" ];
		
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
		
		add( rChunk );
		add( iChunk );
		add( fChunk );
		add( fChunk );
		add( chunkSize );
		add( wRiffType );
		add( aRiffType );
		add( vRiffType );
		add( eRiffType );

	}
}
