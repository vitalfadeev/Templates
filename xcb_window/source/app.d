import std.stdio;
alias log = writeln;
import xcb.xcb;
import xau;


void 
main () {
    // INIT
    // CONNECT
    bool auth_flag = true;
    xcb_connection_t* c;
    new_connection (auth_flag, c);

    // Get the first screen
    // screen = xcb_setup_roots_iterator( xcb_get_setup( c ) )[prefered_screen].data;
    xcb_screen_t* screen;
    new_screen (c,screen);

    // WINDOW
    xcb_window_t hwnd;
    new_window (c,screen,hwnd);

    // Init GUI tree
    auto frame = Frame ();
    frame._init ();

    // EVENT LOOP
    event_loop (c,frame);

    //
    xcb_disconnect (c);
}


void
new_connection (bool auth_flag, ref xcb_connection_t* c) {
    if (auth_flag) {
        const char* display;
        int         prefered_screen;

        // AUTH
        XAuth auth;
        get_auth (auth);
        c = xcb_connect_to_display_with_auth_info (display, &auth.xcb_auth, &prefered_screen);
        if (xcb_connection_has_error (c))
            throw new XCBException ("Cannot open display", c);
    }
    else {
        // Open the connection to the X server     
        //c = xcb_connect( getenv( "DISPLAY" ), null );
        c = xcb_connect (null, null);
        if (xcb_connection_has_error (c))
            throw new XCBException ("Cannot open display", c);
    }
    
}

void
new_screen (xcb_connection_t* c, ref xcb_screen_t* screen) {
    screen = xcb_setup_roots_iterator (xcb_get_setup (c)).data;
    log ( "width x height (in pixels): ", screen.width_in_pixels, "x", screen.height_in_pixels );    
}


void
new_window (xcb_connection_t* c, xcb_screen_t* screen, ref xcb_window_t hwnd) {
    // Ask for our window's Id
    hwnd = xcb_generate_id (c);

    //
    immutable(uint)   value_mask = 
        XCB_CW_BACK_PIXEL | 
        XCB_CW_EVENT_MASK;
    immutable(uint[]) value_list = [
        screen.white_pixel,
        XCB_EVENT_MASK_EXPOSURE |
        XCB_EVENT_MASK_KEY_PRESS |
        XCB_EVENT_MASK_KEY_RELEASE |
        XCB_EVENT_MASK_BUTTON_PRESS |
        XCB_EVENT_MASK_BUTTON_RELEASE |
        XCB_EVENT_MASK_POINTER_MOTION |
        XCB_EVENT_MASK_FOCUS_CHANGE |
        XCB_EVENT_MASK_STRUCTURE_NOTIFY,
        0
    ];

    short h = 64;
    short y = cast (short) (screen.width_in_pixels - h);

    // Create the window
    auto cookie =  // xcb_void_cookie_t 
        xcb_create_window( 
            c,                             // Connection          
            XCB_COPY_FROM_PARENT,          // depth (same as root)
            hwnd,                          // window Id           
            screen.root,                   // parent window       
            0, y,                          // x, y                
            screen.width_in_pixels, h,     // width, height       
            2,                             // border_width        
            XCB_WINDOW_CLASS_INPUT_OUTPUT, // class               
            screen.root_visual,            // visual              
            value_mask,                    // masks
            value_list.ptr                 // not used yet 
        );                                 

    // Map the window on the screen
    xcb_map_window (c, hwnd);

    // Make sure commands are sent before we pause, so window is shown
    xcb_flush (c);    
}

alias Event = xcb_generic_event_t;

void
event_loop (xcb_connection_t* c, ref Frame frame) {
    xcb_generic_event_t* e;

    while ((e = xcb_wait_for_event (c)) != null) {
        import core.stdc.stdlib : free;
        log (e);

        //frame.event (e);
        //frame.update ();
        //frame.draw ();

        free (e);
    }
}

struct
Frame {
    void
    _init () {
        //
    }

    void
    event (Event e) {
        //
    }

    void
    update () {
        //
    }

    void
    draw () {
        //
    }
}

class 
XCBException : Exception {
    import xcb.xcb;

    this (string s, xcb_connection_t* c) {
        auto err = xcb_connection_has_error (c);
        super (xcb_error_to_string (err));
    }
}

string 
xcb_error_to_string (int err) {
    switch (err) {
        case XCB_CONN_ERROR: 
            return ": [XCB_CONN_ERROR]: because of socket errors, pipe errors or other stream errors";
        case XCB_CONN_CLOSED_EXT_NOTSUPPORTED:
            return ": [XCB_CONN_CLOSED_EXT_NOTSUPPORTED]: when extension not supported";
        case XCB_CONN_CLOSED_MEM_INSUFFICIENT:
            return ": [XCB_CONN_CLOSED_MEM_INSUFFICIENT]: when memory not available";
        case XCB_CONN_CLOSED_REQ_LEN_EXCEED:
            return ": [XCB_CONN_CLOSED_REQ_LEN_EXCEED]: exceeding request length that server accepts";
        case XCB_CONN_CLOSED_PARSE_ERR:
            return ": [XCB_CONN_CLOSED_PARSE_ERR]: error during parsing display string";
        case XCB_CONN_CLOSED_INVALID_SCREEN:
            return ": [XCB_CONN_CLOSED_INVALID_SCREEN]: because the server does not have a screen matching the display";
        default:
            return "";
    }    
}


auto 
get_auth (out XAuth xauth) {
    ushort family  = xau.FamilyLocal;
    string address = "ASUS-K53SD";
    string number  = "0";
    string name    = "";
    xau.Xauth xau_auth;
    if (xau.GetAuthByAddr (family, address, number, name, xau_auth)) {
        xauth.from_Xauth (xau_auth);
        return true;
    }

    return false;
}

struct 
XAuth {
    xcb_auth_info_t xcb_auth;
    string         _name;
    ubyte[]        _data;

    void 
    from_Xauth (in xau.Xauth _auth) {
        import std.conv : to;

        _name            = _auth.name.dup;
        xcb_auth.namelen = _name.length.to!(typeof (xcb_auth_info_t.namelen));
        xcb_auth.name    = cast (char*) _name.ptr;
        _data            = _auth.data.dup;
        xcb_auth.datalen = _data.length.to!(typeof (xcb_auth_info_t.namelen));
        xcb_auth.data    = cast (char*) _data.ptr;
    }
}
