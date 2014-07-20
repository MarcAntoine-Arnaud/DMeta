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
	eRaw,
}

string getString( EDataType type ) {
	switch( type ) {
		case EDataType.eUnknown: return "unknown";
		case EDataType.eBit: return "bit";
		case EDataType.eChar: return "char";
		case EDataType.eShort: return "short";
		case EDataType.eHalf: return "half";
		case EDataType.eInt: return "int";
		case EDataType.eFloat: return "float";
		case EDataType.eDouble: return "double";
		case EDataType.eString: return "string";
		case EDataType.eWord: return "word";
		case EDataType.eRaw: return "raw";
	}
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

	void printProperties(){
		writeln( "----------" );
		writeln( "id        ", _id );
		writeln( "type      ", getString( _type ) );
	}

	void isValid(ref char[] buffer){
		writeln( "\t- generic check" );
	}

	size_t getDataSize(){
		return 0;
	}

	string _id;
	EDataType _type;
	Node[] childNodes;
}
