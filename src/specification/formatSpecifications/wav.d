import specification.spec;
import specification.node;
import specification.nodes.nodeGroup;
import specification.nodes.nodeChar;
import specification.nodes.nodeShort;
import specification.nodes.nodeInt;

class WavSpecification : Specification{
	string rootId = "root";
	string chunkRiffId = "chunckRIFF";
	string chunkWaveId = "chunckWAVE";
	string chunkSubRiffId = "subRIFF";
	string chunkSizeId = "chunckSize";
	string riffTypeId = "riffType";
	string chunkFmtId = "fmtChunck";
	string fmtTypeId = "fmtType";
	string channelCountId = "channelCount";
	string sampleRateId = "sampleRate";
	string byteRateId = "byteRate";
	string blockAlignmentId = "blockAlignment";
	string bitsPerSampleId = "bitsPerSample";

	
	this() {
		_id = "wav";
		_label = "Waveform Audio File Format";
		_description = "Microsoft and IBM audio file format standard for storing an audio bitstream on PCs.";
		_extensions =  [ "wav", "wave" ];
		
		auto root = new NodeGroup( rootId );
		auto riffChunk = new NodeGroup( chunkRiffId );
		auto waveChunk = new NodeGroup( chunkWaveId );
		auto fmtChunk = new NodeGroup( chunkFmtId );

		auto rChunk = new NodeChar( chunkSubRiffId );
		auto iChunk = new NodeChar( chunkSubRiffId );
		auto fChunk = new NodeChar( chunkSubRiffId );
		
		auto chunkSize = new NodeInt( chunkSizeId );

		auto wRiffType = new NodeChar( riffTypeId );
		auto aRiffType = new NodeChar( riffTypeId );
		auto vRiffType = new NodeChar( riffTypeId );
		auto eRiffType = new NodeChar( riffTypeId );

		auto f = new NodeChar( chunkFmtId );
		auto m = new NodeChar( chunkFmtId );
		auto t = new NodeChar( chunkFmtId );
		auto space = new NodeChar( chunkFmtId );

		auto fmtType = new NodeShort( fmtTypeId );
		auto channelCount = new NodeShort( channelCountId );
		auto sampleRate = new NodeInt( sampleRateId );
		auto byteRate = new NodeInt( byteRateId );
		auto blockAlignment = new NodeShort( blockAlignmentId );
		auto bitsPerSample = new NodeShort( bitsPerSampleId );
		

		rChunk.setValue( 'R' );
		iChunk.setValue( 'I' );
		fChunk.setValue( 'F' );

		wRiffType.setValue( 'W' );
		aRiffType.setValue( 'A' );
		vRiffType.setValue( 'V' );
		eRiffType.setValue( 'E' );

		f.setValue( 'f' );
		m.setValue( 'm' );
		t.setValue( 't' );
		space.setValue( ' ' );
		
		riffChunk.addChild( rChunk );
		riffChunk.addChild( iChunk );
		riffChunk.addChild( fChunk );
		riffChunk.addChild( fChunk );

		waveChunk.addChild( wRiffType );
		waveChunk.addChild( aRiffType );
		waveChunk.addChild( vRiffType );
		waveChunk.addChild( eRiffType );

		fmtChunk.addChild( f );
		fmtChunk.addChild( m );
		fmtChunk.addChild( t );
		fmtChunk.addChild( space );

		chunkSize.setEndianness(EndiannessType.eLittle);
		channelCount.setEndianness(EndiannessType.eLittle);
		sampleRate.setEndianness(EndiannessType.eLittle);
		byteRate.setEndianness(EndiannessType.eLittle);
		blockAlignment.setEndianness(EndiannessType.eLittle);
		bitsPerSample.setEndianness(EndiannessType.eLittle);

		fmtChunk.addChild( chunkSize );
		fmtChunk.addChild( fmtType );
		fmtChunk.addChild( channelCount );
		fmtChunk.addChild( sampleRate );
		fmtChunk.addChild( byteRate );
		fmtChunk.addChild( blockAlignment );
		fmtChunk.addChild( bitsPerSample );

		root.addChild( riffChunk );
		root.addChild( chunkSize );
		root.addChild( waveChunk );
		root.addChild( fmtChunk );

		add( root );
	}
}
