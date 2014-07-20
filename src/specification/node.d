
enum EDataType {
	eUnknown = 0,
	eBit,
	eChar,
	eShort,
	eHalf,
	eFloat,
	eDouble,
	eString,
	eWord,	
}

class Node{

	this(string id="", EDataType type=EDataType.eUnknown) {
		this._id = id;
		this._type = type;
	}

	@property {
		ref string id() { return _id; }
		ref EDataType type() { return _type; }
	}

	string _id;
	EDataType _type;
}