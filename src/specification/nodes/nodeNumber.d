import specification.node;
import comparator.sourceFile;

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
		void isValid(ref SourceFile file) {
			char[] data;
			data.length = getDataSize();
			file.read( data );

			auto number = cast(NumberType[])data;

			foreach( i; 0 .. _min.length )
			{
				NumberType min = _min[ i ];
				NumberType max = _max[ i ];

				if(number[0] < min || number[0] > max)
				{
					string msg = "number out of range";
					throw new Exception( msg );
				}
			}
			if( is(NumberType == char) ) {
				writeln( "value     ", cast(int)number[0] );
			} else {
				writeln( "value     ", number[0] );
			}

			super.isValid( file );
		}

		size_t getDataSize() {
			return NumberType.sizeof;
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
