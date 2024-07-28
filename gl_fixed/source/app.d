import std.conv;
import std.format;
import std.stdio;
import bindbc.loader;
import bindbc.sdl;
import gl.gles2;
alias log = writeln;


void 
main() {
	// Init
	init_sdl ();

	// Window, Surface
	SDL_Window* window;
	new_window (window);

    // OpenGL context
    SDL_GLContext glc;
    new_gl_context (window,glc);

    //
    init_gl (window,glc);

	// Event Loop
	auto frame = Frame (window);
	event_loop (window,frame);
}


//
void 
init_sdl () {
    SDLSupport ret = loadSDL();

    if (ret != sdlSupport) {
        if (ret == SDLSupport.noLibrary) 
            throw new Exception ("The SDL shared library failed to load");
        else 
        if (ret == SDLSupport.badLibrary) 
            throw new Exception ("One or more symbols failed to load. The likely cause is that the shared library is for a lower version than bindbc-sdl was configured to load (via SDL_204, GLFW_2010 etc.)");
    }

    //loadSDL ("sdl2.dll");
}


//
void 
new_window (ref SDL_Window* window) {
    // Window
    window = 
        SDL_CreateWindow (
            __FILE_FULL_PATH__, // "SDL2 Window",
            SDL_WINDOWPOS_CENTERED,
            SDL_WINDOWPOS_CENTERED,
            window_width, window_height, //1366, 768
            SDL_WINDOW_SHOWN | SDL_WINDOW_OPENGL
        );

    if (!window)
        throw new SDLException ("Failed to create window");

    // Update
    SDL_UpdateWindowSurface (window);
}



auto
new_gl_context (SDL_Window* window, ref SDL_GLContext glc) {
    // Create context for OpenGL window
    glc = SDL_GL_CreateContext (window);
    if (glc is null) {
        throw new SDLException ("[SDL] GL context creation failed!");
        return -1;
    }

    // Set context as current
    auto err = SDL_GL_MakeCurrent (window,glc);
    if (err) 
        throw new SDLException ("SDL_GL_MakeCurrent: ");

    //
    if (SDL_GL_SetSwapInterval (1) < 0) {
        log ("Warning: Unable to set VSync! SDL Error: %s",SDL_GetError ());
    }

    //
    //GLint GLMajorVer, GLMinorVer;
    //glGetIntegerv (GL_MAJOR_VERSION,&GLMajorVer);
    //glGetIntegerv (GL_MINOR_VERSION,&GLMinorVer);
    int GLMajorVer, GLMinorVer;
    SDL_GL_GetAttribute (SDL_GL_CONTEXT_MAJOR_VERSION,&GLMajorVer);
    SDL_GL_GetAttribute (SDL_GL_CONTEXT_MINOR_VERSION,&GLMinorVer);
    log ("OpenGL version: ",GLMajorVer,".",GLMinorVer);

    return 0;
}


void
init_gl (SDL_Window* window,SDL_GLContext glc) {
    SDL_GL_SetAttribute (SDL_GL_CONTEXT_FLAGS, 0);
    SDL_GL_SetAttribute (SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_ES);
    SDL_GL_SetAttribute (SDL_GL_CONTEXT_MAJOR_VERSION, 2);
    SDL_GL_SetAttribute (SDL_GL_CONTEXT_MINOR_VERSION, 0);
    SDL_GL_SetAttribute (SDL_GL_DOUBLEBUFFER, 1);
    SDL_GL_SetAttribute (SDL_GL_DEPTH_SIZE, 24);
    SDL_GL_SetAttribute (SDL_GL_ACCELERATED_VISUAL,1);
    SDL_GL_SetAttribute (SDL_GL_STENCIL_SIZE, 8);

version (Android) {
    import bindbc.gles.gles;

    GLESSupport ret = loadGLES();

    if (ret == GLESSupport.noLibrary) 
        throw new Exception ("The OpenGL shared library failed to load");
    else 
    if (ret == GLESSupport.badLibrary) 
        throw new Exception ("One or more symbols failed to load in OpenGL library");

    log (ret);
}
else 
version (linux) {
    //SDL_GL_LoadLibrary ("libGL.so");
    //SDL_GL_LoadLibrary ("libEGL.so");
    import bindbc.opengl;

    const GLSupport openglLoaded = loadOpenGL ();
    log (glSupport);
    if ( openglLoaded != glSupport) {
        import std.conv : to;
        log ("Error loading OpenGL shared library: ", to!string (openglLoaded));
        throw new Exception ("Error loading OpenGL shared library");
    }
}
else {
    assert (0, "unsupported platform");
}
}


//
void 
event_loop (ref SDL_Window* window, ref Frame frame) {
    bool _go = true;

    while (_go) {
        SDL_Event e;

        while (SDL_WaitEvent (&e) > 0) {
            // Process Event
            switch (e.type) {
                case SDL_QUIT:
                    _go = false;
                    return;
                    break;
                case SDL_MOUSEBUTTONDOWN:
                    frame.event (&e);
                    return;
                    break;
                case SDL_KEYDOWN:
                    frame.event (&e);
                    break;
                case SDL_MOUSEMOTION:
                    frame.event (&e);
                    break;
                default:
            }

            // Draw
            frame.draw (window);
        }

        // Delay
        //SDL_Delay (100);
    }        
}


//
class 
SDLException : Exception {
    this (string msg) {
        super (format!"%s: %s" (SDL_GetError().to!string, msg));
    }
}


struct
Frame {
    SDL_Window* window;
    GLES2       gl;

	this (SDL_Window* window) {
        this.window = window;
        this.gl._init ();
	}

	void
	draw (SDL_Window* window) {
		_clear_buffer ();
		_render_scene ();
		_update_window (window);
	}

	void
	_clear_buffer () {
		glViewport (0, 0, window_width, window_height);
		glClearColor (0.2f, 0.2f, 0.2f, 1.0f);
		glClear (GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	}

	void
	_render_scene () {
        Point[] 
        _test_triangle_verts = [
            Point ( 100, 200),
            Point (   0,   0),
            Point ( 200,   0), // 201 x 201
        ]; // 2^15 / 2^9 = 2^6 is Fixed_10_6 is * 64
		draw_triangle (_test_triangle_verts);
        draw_triangle_at (_test_triangle_verts);
	}

	void
	_update_window (SDL_Window* window) {
		SDL_GL_SwapWindow (window);	    
	}

    void
    draw_triangle (Point[] points) {
        auto program = gl.context.user_data.basic_program;
        program.use ();
        program.ray (points);

        glDrawArrays (
            GL_LINE_LOOP, 
            /* first */ 0, 
            /* count */ cast (GLsizei) points.length
        );
    }

    void
    draw_triangle_at (Point[] points) {
        auto program = gl.context.user_data.translate_program;
        program.use ();
        program.ray (points);
        program.translate ([-1.0,-1.0]);

        glDrawArrays (
            GL_LINE_LOOP, 
            /* first */ 0, 
            /* count */ cast (GLsizei) points.length
        );
    }

	void
	event (SDL_Event* e) {
	    switch (e.type) {
	        case SDL_MOUSEBUTTONDOWN:
	            // ...
	            break;
	        case SDL_MOUSEMOTION:
	            on_mouse_motion (&e.motion);
	            break;
	        default:
	    }
	}

	void
	on_mouse_motion (SDL_MouseMotionEvent* e) {
		//
	}
}

// line a -> b
//   n points
//   on each point 
//     new lines to left, to right -> 2 points -> draw line
void
draw_bold_line (Pos a, Pos b) {
    int width_left, width_right;
    width_left = width_right = 50;

    foreach (p1,p2; Bold_Line_Iterator (a,b,width_left,width_right))
        _draw_line (p1,p2);
    //foreach (p1,p2; Bold_Line.open (a,b,width_left,width_right).read ()) {
    //    _draw_line (p1,p2);
    //}
    //foreach (p1,p2; Bold_Line!Pos (a,b,width_left,width_right)) {
    //    _draw_line (p1,p2);
    //}
    //foreach (p1,p2; Bold_Line!Point (a,b,width_left,width_right)) {
    //    _draw_line (p1,p2);
    //}
}

void
_draw_line (Pos a, Pos b) {
    Pos[2] points = [a,b];

    auto program = gl.context.user_data.basic_program;
    program.use ();
    program.ray (points);
    program.draw (GL_LINE_STRIP,points.length);
}

alias Pos = Point;

struct
EPos {
    int x;
    int y;
}

struct
Bold_Line_Iterator {
    Pos a;
    Pos b;
    int width_left;
    int width_right;

    alias DG = int delegate (Pos l, Pos r);

    int 
    opApply (scope DG dg) {
        int result;

        foreach (p; Line_Iterator (a,b)) {
            auto l = pos_90_degres_left (p,width_left);
            auto r = pos_90_degres_right (p,width_right);

            result = dg (l,r);
            if (result)
                return result;
        }

        return 0;
    }

    Pos
    pos_90_degres_left (Pos p, int w) {
        return Pos ();
    }

    Pos
    pos_90_degres_right (Pos p, int w) {
        return Pos ();
    }
}

struct
Line_Iterator {
    Pos a;
    Pos b;

    alias DG = int delegate (Pos point);

    int 
    opApply (scope DG dg) {
        import std.math : abs;

        int result;
        Pos p;

        // always A -> B 
        struct
        D {
            Pos  a;
            Pos  b;
            uint dx;
            uint dy;
            int  ex;
            int  ey;
            bool by_x;

            this (Pos a, Pos b) {
                if (a.x < b.x) {
                    if (a.y < b.y) {
                        dx = b.x - a.x;
                        dy = b.y - a.y;
                        ex =  1;
                        ey =  1;
                    }
                    else {
                        dx = b.x - a.x;
                        dy = a.y - b.y;
                        ex =  1;
                        ey = -1;
                    }
                }
                else {
                    if (a.y < b.y) {
                        dx = a.x - b.x;
                        dy = b.y - a.y;
                        ex = -1;
                        ey =  1;
                    }
                    else {
                        dx = a.x - b.x;
                        dy = a.y - b.y;
                        ex = -1;
                        ey = -1;
                    }
                }

                by_x = dx < dy ? true : false;
                if (by_x)
                    ey = dy;
                else
                    ex = dx;
            }
        }

        auto d = D (a,b);
        auto e = EPos (d.ex, d.ey);

        for (Pos p = a; p != b; p += e) {
            result = dg (p);
            if (result)
                return result;
        }

        return 0;
    }    
}

// A-B
// B-C 
//
// B
// |\
// | \
// A  C
// 
// ab-bc = rotation between angles
//   left go fast
//   right go slow
//   new lines
//     around center
//     center <- calculated
//   
//   triangles
