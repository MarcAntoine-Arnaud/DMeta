import specification.node;
import std.stdio;

class Specification {
	this(){
	}

	void add( node.Node node ) {
		nodes.length= nodes.length + 1;
		nodes[nodes.length - 1] = node;
	}

	node.Node[] nodes;
}

/// code sample generated
unittest {
	auto s = new Specification();
	auto n = new node.Node("test", EDataType.eChar);
	assert(s.nodes.length == 0);

	s.add( n );

	assert(s.nodes.length == 1);
	assert(s.nodes[0].id() == "test");
}
