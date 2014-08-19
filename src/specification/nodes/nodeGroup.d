import specification.node;
import comparator.sourceFile;

class NodeGroup : Node {

	this(ref string id) {
		super( id, EDataType.eGroup );
	}

	override {
		void isValid(ref SourceFile file) {
			// every time true
			isValidChilds( file );
		}

		size_t getDataSize() {
			return 0;
		}
	}
}
