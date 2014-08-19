import specification.spec;
import specification.nodes.nodeGroup;
import specification.nodes.nodeChar;
import specification.nodes.nodeShort;

class MxfSpecification : Specification{
	string rootId = "root";
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
		
		auto root = new NodeGroup( rootId );

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

		root.addChild( objectIdentifier );
		root.addChild( labelSize );
		root.addChild( designator );
		root.addChild( registryCategoryDesignator );
		root.addChild( registryDesignator );

		add( root );
	}
}