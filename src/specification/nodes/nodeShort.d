import specification.nodes.nodeNumber;

class NodeShort : NodeNumber!(short) {
	this(ref string id) {
		super( id );
	}
}
