import std.stdio;

import gtk.Main;
import gtk.MainWindow;
import gtk.Label;


class 
HelloWorld : MainWindow {
    this () {
        super ("wintitle");
        setBorderWidth (20);
        add (new Label ("hello habr!"));
        showAll ();
    }
}

void 
main (string[] args) {
    Main.init (args);
    new HelloWorld ();
    Main.run ();
}
