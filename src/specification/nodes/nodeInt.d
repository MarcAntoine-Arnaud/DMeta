import specification.nodes.nodeNumber;

class NodeInt : NodeNumber!(int) {
	this(ref string id) {
		super( id );
	}
}
