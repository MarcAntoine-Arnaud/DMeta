import specification.spec;
import specification.node;
import specification.nodes.nodeGroup;
import specification.nodes.nodeString;
import specification.nodes.nodeChar;
import specification.nodes.nodeShort;
import specification.nodes.nodeInt;

class WavSpecification : Specification{
	string rootId = "root";
	string chunkMagickId = "magickChunck";
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
		auto magickChunk = new NodeString( chunkMagickId );
		auto waveChunk = new NodeString( chunkWaveId );
		auto fmtChunk = new NodeString( chunkFmtId );
		
		auto chunkSize = new NodeInt( chunkSizeId );

		auto fmtType = new NodeShort( fmtTypeId );
		auto channelCount = new NodeShort( channelCountId );
		auto sampleRate = new NodeInt( sampleRateId );
		auto byteRate = new NodeInt( byteRateId );
		auto blockAlignment = new NodeShort( blockAlignmentId );
		auto bitsPerSample = new NodeShort( bitsPerSampleId );
		
		magickChunk.setValue( "RIFF" );
		waveChunk.setValue( "WAVE" );
		fmtChunk.setValue( "fmt " );

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

		root.addChild( magickChunk );
		root.addChild( chunkSize );
		root.addChild( waveChunk );
		root.addChild( fmtChunk );

		add( root );
	}
}
