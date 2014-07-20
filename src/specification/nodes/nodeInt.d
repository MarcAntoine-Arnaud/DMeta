import specification.node;
import std.stdio;

class NodeInt : Node {

	this(ref string id) {
		super( id, EDataType.eInt );
	}

	override {
		void isValid(ref char[] buffer) {
			writeln( "   check int" );
		}
	}

	int _data;
}
