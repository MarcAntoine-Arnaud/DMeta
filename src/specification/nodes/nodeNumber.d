import specification.node;
import std.stdio;
import std.range;
import std.digest.digest;

class NodeNumber(NumberType) : Node {

	this(ref string id) {
		EDataType type = EDataType.eUnknown;
		if( is(NumberType == char) ) {
			type = EDataType.eChar;
		} else if( is(NumberType == short) ) {
			type = EDataType.eShort;
		} else if( is(NumberType == int) ) {
			type = EDataType.eInt;
		} else if( is(NumberType == float) ) {
			type = EDataType.eFloat;
		} else if( is(NumberType == double) ) {
			type = EDataType.eDouble;
		}
		super( id, type );
	}

	override {
		void isValid(ref char[] buffer) {
			foreach( min, max ; _min, _max )
			{
				if( buffer[0] < min || buffer[0] > max )
				{
					string msg = "number out of range";
					throw new Exception( msg );
				}
			}
		}

		size_t getDataSize() {
			return NumberType.sizeof; // 1 byte
		}
	}

	void setValue(NumberType value) {
		setRange(value, value);
	}

	void setRange(NumberType min, NumberType max) {
		_min.length += 1;
		_max.length += 1;
		_min[_min.length - 1] = min;
		_max[_max.length - 1] = max;
	}

	NumberType[] _min;
	NumberType[] _max;
}
