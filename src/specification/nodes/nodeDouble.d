import specification.nodes.nodeNumber;

class NodeDouble : NodeNumber!(double) {
	this(ref string id) {
		super( id );
	}
}
