import core.runtime;
import std.utf;
import core.sys.windows.windows;


extern (Windows)
int WinMain( HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int iCmdShow )
{
    int result;
    void exceptionHandler( Throwable e ) { throw e; }

    try
    {
        Runtime.initialize();
        result = my_win_main( hInstance, hPrevInstance, lpCmdLine, iCmdShow );
        Runtime.terminate();
    }
    catch (Throwable o)
    {
        MessageBox( NULL, o.toString().toUTF16z, "Error", MB_OK | MB_ICONEXCLAMATION );
        result = 0;
    }

    return result;
}


int my_win_main( HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int iCmdShow )
{
    MessageBox(NULL, "Hello, Windows!", "Your Application", 0);
    return 0;
}

