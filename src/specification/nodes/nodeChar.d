import specification.nodes.nodeNumber;

class NodeChar : NodeNumber!(char) {
	this(ref string id) {
		super( id );
	}
}
