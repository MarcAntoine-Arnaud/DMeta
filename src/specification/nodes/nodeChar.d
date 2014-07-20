import specification.node;
import std.stdio;
import std.range;
import std.digest.digest;

class NodeChar : Node {

	this(ref string id) {
		super( id, EDataType.eChar );
	}

	override {
		void isValid(ref char[] buffer) {
			foreach( min, max ; _min, _max )
			{
				if( buffer[0] < min || buffer[0] > max )
				{
					string msg = "char out of range";
					throw new Exception( msg );
				}
			}
		}

		size_t getDataSize() {
			return char.sizeof; // 1 byte
		}
	}

	void setValue(char value) {
		setRange(value, value);
	}

	void setRange( char min, char max ) {
		_min.length += 1;
		_max.length += 1;
		_min[_min.length - 1] = min;
		_max[_max.length - 1] = max;
	}

	char[] _min;
	char[] _max;
}
