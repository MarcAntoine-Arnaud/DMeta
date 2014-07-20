import specification.node;
import std.stdio;

class NodeShort : Node {

	this(ref string id) {
		super( id, EDataType.eShort );
	}

	override {
		void isValid(ref char[] buffer) {
			writeln( "   check short" );
		}
	}

	short _data;
}
