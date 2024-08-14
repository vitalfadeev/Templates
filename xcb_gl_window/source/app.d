import std.stdio;
alias log = writeln;
import xcb.xcb;
import xau;
public import bindbc.opengl;
import x11.Xlib     : Display,XOpenDisplay,DefaultScreen,True;
import x11.Xlib_xcb : XSetEventQueueOwner,XEventQueueOwner;
import x11.X        : None;
import glx.glx;



void 
main () {
    // INIT
    // Open Xlib Display
    Display* display;
    int default_screen;
    new_display (display,default_screen);

    // CONNECT
    bool auth_flag = true;
    xcb_connection_t* c;
    new_connection (auth_flag,/*display,*/default_screen,c);

    // Get the first screen
    // screen = xcb_setup_roots_iterator( xcb_get_setup( c ) )[prefered_screen].data;
    xcb_screen_t* screen;
    new_screen (c,default_screen,screen);

    // Create GL context
    // WINDOW
    xcb_window_t hwnd;
    GLXDrawable  drawable;
    new_window (c,display,default_screen,screen,hwnd,drawable);

    // Init GUI tree
    auto frame = Frame ();
    frame._init ();

    // EVENT LOOP
    event_loop (c,display,drawable,frame);

    //
    xcb_disconnect (c);
}


void
new_connection (bool auth_flag, /*Display* display, */int default_screen, ref xcb_connection_t* c) {
    //c = XGetXCBConnection (default_screen);
    //XSetEventQueueOwner (display,XEventQueueOwner.XCBOwnsEventQueue);
//version (_0):  
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
new_display (ref Display* display, ref int default_screen) {
    display = XOpenDisplay (null);

    if (!display)
        throw new Exception ("Can't open display");

    default_screen = DefaultScreen (display);
}

void
new_screen (xcb_connection_t* c, int default_screen, ref xcb_screen_t* screen) {
    xcb_screen_iterator_t screen_iter = 
        xcb_setup_roots_iterator (xcb_get_setup (c));

    for (int screen_num = default_screen; screen_iter.rem && screen_num > 0; screen_num--, xcb_screen_next (&screen_iter)) 
        {}
    screen = screen_iter.data;

    //screen = xcb_setup_roots_iterator (xcb_get_setup (c)).data;
    log ( "Screen: width x height (in pixels): ", screen.width_in_pixels, "x", screen.height_in_pixels );    
}



void
new_window (xcb_connection_t* c, Display* display, int default_screen, xcb_screen_t* screen, ref xcb_window_t hwnd, ref GLXDrawable drawable) {
    // 1.
    static int[] 
    visual_attribs = [
        GLX_X_RENDERABLE,     True,
        GLX_DRAWABLE_TYPE,    GLX_WINDOW_BIT,
        GLX_RENDER_TYPE,      GLX_RGBA_BIT,
        GLX_X_VISUAL_TYPE,    GLX_TRUE_COLOR,
        GLX_RED_SIZE,         8,
        GLX_GREEN_SIZE,       8,
        GLX_BLUE_SIZE,        8,
        GLX_ALPHA_SIZE,       8,
        GLX_DEPTH_SIZE,       24,
        GLX_STENCIL_SIZE,     8,
        GLX_DOUBLEBUFFER,     True,
        //GLX_SAMPLE_BUFFERS, 1,
        //GLX_SAMPLES,        4,
        None
    ];

    // Query framebuffer configurations that match visual_attribs
    GLXFBConfig* fb_configs;
    int          num_fb_configs;
    fb_configs = glXChooseFBConfig (display, default_screen, visual_attribs.ptr, &num_fb_configs);
    if (!fb_configs || num_fb_configs == 0)
        throw new Exception ("glXGetFBConfigs failed");

    writefln ("FBConfig: Found %d matching FB configs", num_fb_configs);

    // Select first framebuffer config and query visualID
    int visualID;
    GLXFBConfig fb_config = fb_configs[0];
    glXGetFBConfigAttrib (display,fb_config,GLX_VISUAL_ID,&visualID);

    log ("visualID: ", visualID);

    // Create OpenGL context
    GLXContext context = 
        glXCreateNewContext (display,fb_config,GLX_RGBA_TYPE,null,True);
    if (!context)
        throw new Exception ("glXCreateNewContext failed");


    // 2.
    // Create XID's for colormap and window
    // Create colormap
    xcb_colormap_t colormap = xcb_generate_id (c);
    xcb_create_colormap (
        c,
        XCB_COLORMAP_ALLOC_NONE,
        colormap,
        screen.root,
        visualID
    );

    // Ask for our window's Id
    hwnd = xcb_generate_id (c);

    //
    immutable(uint)   eventmask =
        XCB_EVENT_MASK_EXPOSURE | 
        XCB_EVENT_MASK_KEY_PRESS;
        //XCB_EVENT_MASK_EXPOSURE |
        //XCB_EVENT_MASK_KEY_PRESS |
        //XCB_EVENT_MASK_KEY_RELEASE |
        //XCB_EVENT_MASK_BUTTON_PRESS |
        //XCB_EVENT_MASK_BUTTON_RELEASE |
        //XCB_EVENT_MASK_POINTER_MOTION |
        //XCB_EVENT_MASK_FOCUS_CHANGE |
        //XCB_EVENT_MASK_STRUCTURE_NOTIFY,
    immutable(uint[]) value_list = [
        //screen.white_pixel,
        eventmask,
        colormap,
        0
    ];
    immutable(uint)   value_mask = 
        //XCB_CW_BACK_PIXEL | 
        XCB_CW_EVENT_MASK |
        XCB_CW_COLORMAP;

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
            0,                             // border_width
            XCB_WINDOW_CLASS_INPUT_OUTPUT, // class               
            visualID,                      // visual              
            value_mask,                    // masks
            value_list.ptr                 // not used yet 
        );                                 

    // Map the window on the screen
    xcb_map_window (c,hwnd);

    // Create GLX Window
    GLXWindow glxwindow = glXCreateWindow (display,fb_config,hwnd,null);
    if (!glxwindow)
        throw new Exception ("glxwindow failed");

    // make OpenGL context current
    drawable = glxwindow;
    if (!glXMakeContextCurrent (display, drawable, drawable, context))
        throw new Exception ("glXMakeContextCurrent failed");

    // Make sure commands are sent before we pause, so window is shown
    xcb_flush (c);    
}


alias Event = xcb_generic_event_t;

void
event_loop (xcb_connection_t* c, Display* display, GLXDrawable drawable, ref Frame frame) {
    xcb_generic_event_t* e;

    while ((e = xcb_wait_for_event (c)) != null) {
        log (e);

        //frame.event (e);
        //frame.update ();
        switch (e.response_type & ~0x80) {
            case XCB_KEY_PRESS:
                break;
            case XCB_EXPOSE:
                //frame.draw ();
                glClearColor (0.2, 0.4, 0.9, 1.0);
                glClear (GL_COLOR_BUFFER_BIT);
                glXSwapBuffers (display,drawable);
                break;
            default:
        }

        import core.stdc.stdlib : free;
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
