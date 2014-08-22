import specification.node;
import comparator.sourceFile;

import std.stdio;
import std.range;
import std.digest.digest;

class NodeString : Node {

	this(ref string id) {
		_dataSize = -1;
		super( id, EDataType.eString );
	}

	override {
		void isValid(ref SourceFile file) {
			char[] data;
			data.length = getDataSize();
			file.read( data );

			if( _values.length ){
				bool matchFound = false;
				foreach( string value; _values ){
					if( value == data ){
						matchFound = true;
						break;
					}
				}
				if( ! matchFound ) {
					string msg = "incorrect string";
					throw new Exception( msg );
				}
			}

			super.isValid( file );
		}

		size_t getDataSize() {
			return _dataSize;
		}
	}

	void setDataSize(size_t dataSize) {
		_dataSize = dataSize;
	}

	void setValue(string value) {
		if( _dataSize == -1 ){
			_dataSize = value.length;
		} else {
			if( _dataSize != value.length ){
				string msg = "values have different size.";
				throw new Exception( msg );
			}
		}
		_values.length = _values.length + 1;
		_values[_values.length - 1] = value;
	}

	size_t _dataSize;
	string[] _values;
}
