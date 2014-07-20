import specification.spec;
import comparator.comp;
import std.stdio;

void main() {
	writeln( "start extract meta" );
	auto s = new Specification();
	auto c = new Comparator( s );

	c.run();
	
	writeln( "end of meta extraction" );
}