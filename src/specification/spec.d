import specification.node;

class Specification {
	this(){
	}

	void add(Node node) {
		_nodes.length = _nodes.length + 1;
		_nodes[_nodes.length - 1] = node;
	}

	string _id;
	string _label;
	string _description;
	Node[] _nodes;
	string[] _extensions;
}

/// code sample generated
unittest {
	auto s = new Specification();
	string nodeId = "test";
	auto n = new Node(nodeId, EDataType.eChar);
	assert(s._nodes.length == 0);

	s.add( n );

	assert(s._nodes.length == 1);
	assert(s._nodes[0].id() == nodeId);
	assert(s._nodes[0].type() == EDataType.eChar);
}
