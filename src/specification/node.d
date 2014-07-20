import std.stdio;

enum EDataType {
	eUnknown = 0,
	eBit,
	eChar,
	eShort,
	eHalf,
	eInt,
	eFloat,
	eDouble,
	eString,
	eWord,	
}

class Node{

	this(ref string id, EDataType type=EDataType.eUnknown) {
		this._id = id;
		this._type = type;
	}

	@property {
		ref string id() { return _id; }
		ref EDataType type() { return _type; }
	}

	void isValid(ref char[] buffer){
		writeln( "\t- generic check" );
	}

	size_t getDataSize(){
		return 0;
	}

	//void setData(ref char[] buffer){
	//	throw new Exception( "generic set Data error !" );
	//}

	string _id;
	EDataType _type;
}