import specification.nodes.nodeNumber;

class NodeFloat : NodeNumber!(float) {
	this(ref string id) {
		super( id );
	}
}
