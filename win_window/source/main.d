import core.runtime;
import core.sys.windows.windows;
import std.string;
import std.conv;
import std.utf;


extern( Windows ) nothrow 
LRESULT WndProc( HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam ) 
{
    HDC hdc;
    PAINTSTRUCT ps; 
    RECT rect;

    switch( message ) 
    {
        case WM_CREATE: return 0;
        case WM_PAINT:
            InvalidateRect( hwnd, null, true );
            hdc = BeginPaint( hwnd, &ps );
            GetClientRect( hwnd, &rect ); 
            DrawText( hdc, "Hello!", -1, &rect, DT_SINGLELINE | DT_CENTER | DT_VCENTER );
            EndPaint( hwnd, &ps ) ;
            return 0;
        case WM_DESTROY: PostQuitMessage( 0 ); return 0;
        case WM_LBUTTONUP: return 0;
        case WM_LBUTTONDOWN:
            InvalidateRect( hwnd, null, true );
            hdc = BeginPaint( hwnd, &ps );
            GetClientRect( hwnd, &rect );
            DrawText( hdc, "WM_LBUTTONDOWN", -1, &rect, DT_SINGLELINE | DT_CENTER | DT_VCENTER );
            EndPaint( hwnd, &ps );
            return 0;      
        default:
            break;
    }

    return DefWindowProc( hwnd, message, wParam, lParam );
}



extern (Windows)
LRESULT WinMain( HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int iCmdShow )
{
    LRESULT result;
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


auto my_win_main( HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int iCmdShow )
{
    auto className = toUTF16z( "My First M'ofocking Window" );
    WNDCLASS wndClass;

    // Window
    wndClass.style = CS_HREDRAW | CS_VREDRAW;
    wndClass.lpfnWndProc   = &WndProc;
    wndClass.cbClsExtra    = 0;
    wndClass.cbWndExtra    = 0;
    wndClass.hInstance     = hInstance;
    wndClass.hIcon         = LoadIcon( null, IDI_EXCLAMATION );
    wndClass.hCursor       = LoadCursor( null, IDC_CROSS );
    wndClass.hbrBackground = GetStockObject( DKGRAY_BRUSH );
    wndClass.lpszMenuName  = null;
    wndClass.lpszClassName = className;

    // Register
    if ( !RegisterClass( &wndClass ) ) 
        throw new Exception( "Unable to register class" );

    // Create
    HWND hWnd;
    hWnd = CreateWindow(
        className,                        //Window class used.
        "The program".toUTF16z,           //Window caption.
        WS_OVERLAPPEDWINDOW,              //Window style.
        CW_USEDEFAULT,                    //Initial x position.
        CW_USEDEFAULT,                    //Initial y position.
        CW_USEDEFAULT,                    //Initial x size.
        CW_USEDEFAULT,                    //Initial y size.
        null,                             //Parent window handle.
        null,                             //Window menu handle.
        hInstance,                        //Program instance handle.
        null                              //Creation parameters.
    );                           

    // Show
    ShowWindow( hWnd, SW_SHOWMAXIMIZED );
    UpdateWindow( hWnd ); 

    // Main loop
    MSG msg;
    while ( GetMessageA( &msg, null, 0, 0 ) ) 
    {
        TranslateMessage( &msg );
        DispatchMessageA( &msg );
    }

    return msg.wParam; 
}

