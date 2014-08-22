import specification.spec;
import specification.formatSpecifications.wav;
import specification.formatSpecifications.bwf;
import specification.formatSpecifications.mxf;

class ListSpecifications {
	this( bool preload = false ){
		if( preload )
			load();
	}

	void load(){
		auto wavSpec = new WavSpecification();
		auto bwfSpec = new BwfSpecification();
		auto mxfSpec = new MxfSpecification();
		add( wavSpec );
		add( bwfSpec );
		add( mxfSpec );
	}

	bool contains( string id ){
		foreach( Specification s; _specList ){
			if( s._id == id )
				return true;
		}
		return false;
	}

	Specification get( string id ){
		foreach( Specification s; _specList ){
			if( s._id == id )
				return s;
		}
		assert(0);
	}

	Specification[] getAllSpecs(){
		return _specList;
	}

private:
	void add( Specification spec ){
		_specList.length = _specList.length + 1;
		_specList[_specList.length - 1] = spec;
	}

	Specification[] _specList;
}
