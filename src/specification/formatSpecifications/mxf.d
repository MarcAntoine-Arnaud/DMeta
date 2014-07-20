import specification.spec;
import specification.nodes.nodeChar;
import specification.nodes.nodeShort;

class MxfSpecification : Specification{
	string objectIdentifierId = "objectIdentifier";
	string labelSizeId = "labelSize";
	string designatorId = "designator";
	string registryCategoryDesignatorId = "registryCategoryDesignator";
	string registryDesignatorId = "registryDesignator";
	
	this() {
		_id = "mxf";
		_label = "Material Exchange Format";
		_description = "container format for professional digital video and audio media defined by a set of SMPTE standards.";
		_extensions =  [ "mxf" ];
		
		auto objectIdentifier = new NodeChar( objectIdentifierId );
		auto labelSize = new NodeChar( labelSizeId );
		auto designator = new NodeShort( designatorId );
		auto registryCategoryDesignator = new NodeShort( registryCategoryDesignatorId );
		auto registryDesignator = new NodeShort( registryDesignatorId );

		objectIdentifier.setValue( 0x06 );
		labelSize.setValue( 0x0e );
		designator.setValue( 0x2b34 );
		registryCategoryDesignator.setValue( 0x02 );
		registryDesignator.setValue( 0x05 );

		add( objectIdentifier );
		add( labelSize );
		add( designator );
		add( registryCategoryDesignator );
		add( registryDesignator );
	}
}