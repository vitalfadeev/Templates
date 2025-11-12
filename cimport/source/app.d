import std.stdio;
import includes;

void 
main () {
    writeln ("Calling external C function from D...");
    external_function (); // Call the function defined in the external library
}
