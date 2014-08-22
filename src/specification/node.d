import comparator.sourceFile;
import std.stdio;

enum EDataType {
	eUnknown = 0,
	eGroup,
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

enum EndiannessType {
	eBig = 0,
	eLittle,
}

string getString( EDataType type ) {
	switch( type ) {
		default:
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
		this._endianess = EndiannessType.eBig;
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

	void isValid(ref SourceFile file){
		writeln( "\t- generic check" );
		auto pos = file.getPosition();
		try{
			isValidChilds( file );
		}
		catch( Exception e ){
			if( ! _optional ){
				throw e;
			}
			writeln( "child of optional node is not valid: ", e.msg );
			file.setPosition( pos - getDataSize() );
		}
	}

	void isValidChilds(ref SourceFile file){
		writeln( "-> childs check" );
		foreach( Node child; _childNodes ){
			child.printProperties();
			child.isValid( file );
		}
		writeln( "-> end childs check" );
	}

	size_t getDataSize(){
		return 0;
	}

	void addChild( Node node ){
		_childNodes.length = _childNodes.length + 1;
		_childNodes[_childNodes.length - 1] = node;
	}

	void setEndianness( EndiannessType endianess ) {
		_endianess = endianess;
	}

	void setOptional( bool optional = true ) {
		_optional = optional;
	}

	auto ref updateEndianess(char[] data, EndiannessType _endianess) {
		if( _endianess == EndiannessType.eBig )
			data.reverse;
		return data;
	}

	string _id;
	EDataType _type;
	EndiannessType _endianess;
	Node[] _childNodes;
	bool _optional;
}
