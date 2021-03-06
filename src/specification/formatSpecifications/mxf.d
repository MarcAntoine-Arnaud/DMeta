import specification.spec;
import specification.node;
import specification.nodes.nodeBit;
import specification.nodes.nodeGroup;
import specification.nodes.nodeChar;
import specification.nodes.nodeShort;

class MxfSpecification : Specification{
	string rootId = "root";
	string keyId = "key";
	string lengthId = "length";
	string valueId = "value";
	string objectIdentifierId = "objectIdentifier";
	string labelSizeId = "labelSize";
	string designatorId = "designator";
	string registryCategoryDesignatorId = "registryCategoryDesignator";
	string registryDesignatorId = "registryDesignator";
	string structureDesignatorId = "structureDesignator";
	string versionNumberId = "versionNumber";
	string itemDesignatorId = "itemDesignator";
	string organizationId = "organization";
	string applicationId = "application";
	string structureVersionId = "structureVersion";
	string structureKindId = "structureKind";
	string setPackKindId = "setPackKind";
	string partitionStatusId = "partitionStatus";
	string reservedId = "reserved";

	string berLengthTypeId = "berLengthType";
	string berLengthSize1Id = "berLengthSize1";
	string berLengthSize2Id = "berLengthSize2";
	string berLengthSize3Id = "berLengthSize3";

	this() {
		_id = "mxf";
		_label = "Material Exchange Format";
		_description = "container format for professional digital video and audio media defined by a set of SMPTE standards.";
		_extensions =  [ "mxf" ];
		
		auto root = new NodeGroup( rootId );

		auto key = new NodeGroup( keyId );
		auto length = new NodeGroup( lengthId );
		auto value = new NodeGroup( valueId );

		auto objectIdentifier = new NodeChar( objectIdentifierId );
		auto labelSize = new NodeChar( labelSizeId );
		auto designator = new NodeShort( designatorId );
		auto registryCategoryDesignator = new NodeChar( registryCategoryDesignatorId );
		auto registryDesignator = new NodeChar( registryDesignatorId );
		auto structureDesignator = new NodeChar( structureDesignatorId );
		auto versionNumber = new NodeChar( versionNumberId );
		auto itemDesignator = new NodeChar( itemDesignatorId );
		auto organization = new NodeChar( organizationId );
		auto application = new NodeChar( applicationId );
		auto structureVersion = new NodeChar( structureVersionId );
		auto structureKind = new NodeChar( structureKindId );
		auto setPackKind = new NodeChar( setPackKindId );
		auto partitionStatus = new NodeChar( partitionStatusId );
		auto reserved = new NodeChar( reservedId );

		objectIdentifier.setValue( 0x06 );
		labelSize.setValue( 0x0e );
		designator.setValue( 0x2b34 );
		registryCategoryDesignator.setValue( 0x02 );
		registryDesignator.setValue( 0x05 );
		structureDesignator.setValue( 0x01 );
		versionNumber.setValue( 0x01 );
		itemDesignator.setValue( 0x0d );
		organization.setValue( 0x01 );
		application.setValue( 0x02 );
		structureVersion.setValue( 0x01 );
		structureKind.setValue( 0x01 );
		setPackKind.setValue( 0x02 );
		partitionStatus.setValue( 0x04 );
		reserved.setValue( 0x00 );

		//designator.addMapValue( 0x01, "Metadata Dictionaries Section" );
		//designator.addMapValue( 0x02, "Essence Dictionaries Section" );
		//designator.addMapValue( 0x03, "Control Dictionaries Section" );
		//designator.addMapValue( 0x04, "Types Dictionaries" );

		setPackKind.addMapValue( 0x02, "MXF Header Partition" );
		setPackKind.addMapValue( 0x03, "MXF Body Partition" );
		setPackKind.addMapValue( 0x04, "MXF Footer Partition" );

		partitionStatus.addMapValue( 0x01, "Open and Incomplete" );
		partitionStatus.addMapValue( 0x02, "Closed and Incomplete" );
		partitionStatus.addMapValue( 0x03, "Open and Complete" );
		partitionStatus.addMapValue( 0x04, "Closed and Incomplete" );

		key.addChild( objectIdentifier );
		key.addChild( labelSize );
		key.addChild( designator );
		key.addChild( registryCategoryDesignator );
		key.addChild( registryDesignator );
		key.addChild( structureDesignator );
		key.addChild( versionNumber );
		key.addChild( itemDesignator );
		key.addChild( organization );
		key.addChild( application );
		key.addChild( structureVersion );
		key.addChild( structureKind );
		key.addChild( setPackKind );
		key.addChild( partitionStatus );
		key.addChild( reserved );

		auto berLengthType = new NodeChar( berLengthTypeId );
		berLengthType.setValue( 131 ); // 0x83
		length.addChild( berLengthType );

		auto berLengthSize1 = new NodeChar( berLengthSize1Id );
		auto berLengthSize2 = new NodeChar( berLengthSize2Id );
		auto berLengthSize3 = new NodeChar( berLengthSize3Id );
		berLengthType.addChild( berLengthSize1 );
		berLengthType.addChild( berLengthSize2 );
		berLengthType.addChild( berLengthSize3 );

		root.addChild( key );
		root.addChild( length );

		add( root );
	}
}