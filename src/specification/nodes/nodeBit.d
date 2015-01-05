import specification.node;
import comparator.sourceFile;

import std.stdio;

class NodeBit : Node {

	this(ref string id) {
		super( id, EDataType.eBit );
		_bitcount = 1;
	}

	override {
		void isValid(ref SourceFile file) {
			// valid if childs are fine
			bool[] data;
			data.length = _bitcount;
			file.read( data );

			foreach(bool dataBit; data){
				writeln( "value     ", dataBit );
			}

			super.isValid( file );
		}

		size_t getDataSize() {
			return 0;
		}
	}

	void setValue(bool[] values) {
		_values.length = values.length;
		_values = values;
	}

	int _bitcount;
	bool[] _values;
}
