import specification.node;

class Specification {
	this(){
	}

	void add( Node node ) {
		nodes.length= nodes.length + 1;
		nodes[nodes.length - 1] = node;
	}

	Node[] nodes;
}

/// code sample generated
unittest {
	auto s = new Specification();
	auto n = new Node("test", EDataType.eChar);
	assert(s.nodes.length == 0);

	s.add( n );

	assert(s.nodes.length == 1);
	assert(s.nodes[0].id() == "test");
	assert(s.nodes[0].type() == EDataType.eChar);
}
