import specification.spec;
import specification.node;
import specification.nodes.nodeGroup;
import specification.nodes.nodeString;
import specification.nodes.nodeChar;
import specification.nodes.nodeShort;
import specification.nodes.nodeInt;

class BwfSpecification : Specification{
	string rootId = "root";
	string chunkMagickId = "magickChunck";
	string chunkWaveId = "chunckWAVE";
	string chunkSizeId = "chunckSize";
	string chunkBwfId = "chunckBwf";
	string riffTypeId = "riffType";
	string chunkFmtId = "fmtChunk";
	string fmtTypeId = "fmtType";
	string channelCountId = "channelCount";
	string sampleRateId = "sampleRate";
	string byteRateId = "byteRate";
	string blockAlignmentId = "blockAlignment";
	string bitsPerSampleId = "bitsPerSample";
	string bwfSizeId = "bwfChunkSize";
	string bwfDescId = "description";
	string bwfOriginatorNameId = "originatorName";
	string bwfOriginatorRefId = "originatorRef";
	string bwfOriginatorDateId = "originatorDate";
	string bwfOriginatorTimeId = "originatorTime";
	
	string bwfTimeReferenceLowId = "timeReferenceLow";
	string bwfTimeReferenceHighId = "timeReferenceHigh";
	string bwfVersionId = "version";
	string bwfUmidId = "umid";
	string bwfLoudnessValueId = "loudnessValue";
	string bwfLoudnessRangeId = "loudnessRange";
	string bwfMaxTruePeakLevelId = "maxTruePeakLevel";
	string bwfMaxMomentaryLoudnessId = "maxMomentaryLoudness";
	string bwfMaxShortTermLoudnessId = "maxShortTermLoudness";
	string bwfReservedId = "reserved";
	string bwfCodingHistoryId = "codingHistory";

	this() {
		_id = "bwf";
		_label = "Broadcast Wave Format";
		_description = "Extension of the popular Microsoft WAVE.";
		_extensions =  [ "wav", "wave" ];
		
		auto root = new NodeGroup( rootId );

		auto magickChunk = new NodeString( chunkMagickId );
		magickChunk.setValue( "RIFF" );
		magickChunk.setValue( "RF64" );

		auto waveChunk = new NodeString( chunkWaveId );
		waveChunk.setValue( "WAVE" );
		
		auto chunkSize = new NodeInt( chunkSizeId );
		chunkSize.setEndianness(EndiannessType.eLittle);

		auto fmtChunk = new NodeString( chunkFmtId );
		fmtChunk.setValue( "fmt " );
		auto fmtType = new NodeShort( fmtTypeId );
		auto channelCount = new NodeShort( channelCountId );
		channelCount.setEndianness(EndiannessType.eLittle);
		auto sampleRate = new NodeInt( sampleRateId );
		sampleRate.setEndianness(EndiannessType.eLittle);
		auto byteRate = new NodeInt( byteRateId );
		byteRate.setEndianness(EndiannessType.eLittle);
		auto blockAlignment = new NodeShort( blockAlignmentId );
		blockAlignment.setEndianness(EndiannessType.eLittle);
		auto bitsPerSample = new NodeShort( bitsPerSampleId );
		bitsPerSample.setEndianness(EndiannessType.eLittle);
		
		auto bwfChunk = new NodeString( chunkBwfId );
		bwfChunk.setValue( "bext" );
		auto bwfSize = new NodeInt( bwfSizeId );
		bwfSize.setEndianness(EndiannessType.eLittle);
		auto bwfDesc = new NodeString( bwfDescId );
		bwfDesc.setDataSize(256);
		auto bwfOriginatorName = new NodeString( bwfOriginatorNameId );
		bwfOriginatorName.setDataSize(32);
		auto bwfOriginatorRef = new NodeString( bwfOriginatorRefId );
		bwfOriginatorRef.setDataSize(32);
		auto bwfOriginatorDate = new NodeString( bwfOriginatorDateId );
		bwfOriginatorDate.setDataSize(10);
		auto bwfOriginatorTime = new NodeString( bwfOriginatorTimeId );
		bwfOriginatorTime.setDataSize(8);
		auto bwfTimeReferenceLow = new NodeInt( bwfTimeReferenceLowId );
		bwfTimeReferenceLow.setEndianness(EndiannessType.eLittle);
		auto bwfimeReferenceHigh = new NodeInt( bwfTimeReferenceHighId );
		bwfimeReferenceHigh.setEndianness(EndiannessType.eLittle);
		auto bwfVersion = new NodeShort( bwfVersionId );
		bwfVersion.setEndianness(EndiannessType.eLittle);
		auto bwfUmid = new NodeString( bwfUmidId );
		bwfUmid.setDataSize(64);
		auto bwfLoudnessValue = new NodeShort( bwfLoudnessValueId );
		bwfLoudnessValue.setEndianness(EndiannessType.eLittle);
		auto bwfLoudnessRange = new NodeShort( bwfLoudnessRangeId );
		bwfLoudnessRange.setEndianness(EndiannessType.eLittle);
		auto bwfMaxTruePeakLevel = new NodeShort( bwfMaxTruePeakLevelId );
		bwfMaxTruePeakLevel.setEndianness(EndiannessType.eLittle);
		auto bwfMaxMomentaryLoudness = new NodeShort( bwfMaxMomentaryLoudnessId );
		bwfMaxMomentaryLoudness.setEndianness(EndiannessType.eLittle);
		auto bwfMaxShortTermLoudness = new NodeShort( bwfMaxShortTermLoudnessId );
		bwfMaxShortTermLoudness.setEndianness(EndiannessType.eLittle);
		auto bwfReserved = new NodeString( bwfReservedId );
		bwfReserved.setDataSize(180);
		auto bwfCodingHistory = new NodeString( bwfCodingHistoryId );
		bwfCodingHistory.setDataSize( 0 );
		//bwfCodingHistory.setDataSize( bwfSize.value - 602 );
		
		fmtChunk.addChild( chunkSize );
		fmtChunk.addChild( fmtType );
		fmtChunk.addChild( channelCount );
		fmtChunk.addChild( sampleRate );
		fmtChunk.addChild( byteRate );
		fmtChunk.addChild( blockAlignment );
		fmtChunk.addChild( bitsPerSample );

		bwfChunk.addChild( bwfSize );
		bwfChunk.addChild( bwfDesc );
		bwfChunk.addChild( bwfOriginatorName );
		bwfChunk.addChild( bwfOriginatorRef );
		bwfChunk.addChild( bwfOriginatorDate );
		bwfChunk.addChild( bwfOriginatorTime  );
		bwfChunk.addChild( bwfTimeReferenceLow );
		bwfChunk.addChild( bwfimeReferenceHigh );
		bwfChunk.addChild( bwfVersion );
		bwfChunk.addChild( bwfUmid );
		bwfChunk.addChild( bwfLoudnessValue );
		bwfChunk.addChild( bwfLoudnessRange );
		bwfChunk.addChild( bwfMaxTruePeakLevel );
		bwfChunk.addChild( bwfMaxMomentaryLoudness );
		bwfChunk.addChild( bwfMaxShortTermLoudness );
		bwfChunk.addChild( bwfReserved );
		bwfChunk.addChild( bwfCodingHistory );

		root.addChild( magickChunk );
		root.addChild( chunkSize );
		root.addChild( waveChunk );
		root.addChild( fmtChunk );
		root.addChild( bwfChunk );

		add( root );
	}
}
