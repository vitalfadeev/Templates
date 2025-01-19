import std.conv;
import std.format;
import std.stdio;
import bindbc.sdl;


int 
main () {
    // Init
    init_sdl ();

    // Window, Surface
    SDL_Window* window = new_window ();

    // Renderer
    SDL_Renderer* renderer = new_renderer (window);

    // Event Loop
    foreach (Event* ev; Events ())
        if (event (ev, window, renderer) == 1)
            break;

    return 0;
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

    version (Windows)
        loadSDL ("sdl2.dll");

    SDL_Init (SDL_INIT_EVERYTHING);

    // IMG
    version (SDL_Image) {    
        auto sdlimage_ret = loadSDLImage ();
        writeln ("SDL_Image: ", sdlimage_ret);
        if (sdlimage_ret < sdlImageSupport) // 2.6.3
            throw new Exception ("The SDL_Image shared library failed to load");

        auto flags = IMG_INIT_PNG; // | IMG_INIT_JPG;
        if (IMG_Init (flags) != flags)
            throw new Exception ("The SDL_Image init failed");

        // import bindbc.sdl.image;
        // IMG_Load (name);
    }
}


//
SDL_Window* 
new_window () {
    // Window
    SDL_Window* window = 
        SDL_CreateWindow (
            __FILE_FULL_PATH__, // "SDL2 Window",
            SDL_WINDOWPOS_CENTERED,
            SDL_WINDOWPOS_CENTERED,
            640, 480,
            0
        );

    if (!window)
        throw new SDLException ("Failed to create window");

    // Update
    SDL_UpdateWindowSurface (window);

    return window;
}


//
SDL_Renderer* 
new_renderer (SDL_Window* window) {
    return SDL_CreateRenderer (window, -1, SDL_RENDERER_SOFTWARE);
}


//
class 
SDLException : Exception {
    this (string msg) {
        super (format!"%s: %s" (SDL_GetError().to!string, msg));
    }
}


struct
Events {
    bool _go = true;
    Event ev;

    int
    opApply (int delegate (Event* ev) dg) {
        while (_go) {
            while (SDL_WaitEvent (&ev._e) > 0) {
                int result = dg (&ev);
                if (result)
                    return result;
            }
        }        

        return 0;
    }
}

struct
Event {
    SDL_Event _e;
    alias _e this;
}


int
event (Event* ev, SDL_Window* window, SDL_Renderer* renderer) {
    switch (ev.type) {
        case SDL_QUIT:
            return 1;
            break;
        case SDL_MOUSEBUTTONDOWN:
            // ...
            break;
        case SDL_WINDOWEVENT:
            switch (ev.window.event) {
                case SDL_WINDOWEVENT_EXPOSED: draw (renderer); break; // event.window.windowID
                case SDL_WINDOWEVENT_SHOWN: break;        // event.window.windowID
                case SDL_WINDOWEVENT_HIDDEN: break;       // event.window.windowID
                case SDL_WINDOWEVENT_MOVED: break;        // event.window.windowID event.window.data1 event.window.data2 (x y)
                case SDL_WINDOWEVENT_RESIZED: break;      // event.window.windowID event.window.data1 event.window.data2 (width height)
                case SDL_WINDOWEVENT_SIZE_CHANGED: break; // event.window.windowID event.window.data1 event.window.data2 (width height)
                case SDL_WINDOWEVENT_MINIMIZED: break;    // event.window.windowID
                case SDL_WINDOWEVENT_MAXIMIZED: break;    // event.window.windowID
                case SDL_WINDOWEVENT_RESTORED: break;     // event.window.windowID
                case SDL_WINDOWEVENT_ENTER: break;        // event.window.windowID
                case SDL_WINDOWEVENT_LEAVE: break;        // event.window.windowID
                case SDL_WINDOWEVENT_FOCUS_GAINED: break; // event.window.windowID
                case SDL_WINDOWEVENT_FOCUS_LOST: break;   // event.window.windowID
                case SDL_WINDOWEVENT_CLOSE: break;        // event.window.windowID
                case SDL_WINDOWEVENT_TAKE_FOCUS: break;   // event.window.windowID
                case SDL_WINDOWEVENT_HIT_TEST: break;     // event.window.windowID
                default:
                    SDL_Log ("Window %d got unknown event %d",
                        ev.window.windowID, ev.window.event);
            }
            break;
        default:
    }

    return 0;
}


void
draw (SDL_Renderer* renderer) {
    // SDL_SetRenderDrawColor (renderer, 0x00, 0x00, 0x00, 0xFF);
    // SDL_RenderClear (renderer);
    // SDL_SetRenderDrawColor (renderer, 0xFF, 0xFF, 0xFF, 0xFF);
    // SDL_RenderDrawPoint (renderer, x, y);
    // SDL_RenderDrawLine (renderer,0,0,100,100);
    // SDL_RenderFillRect (renderer,&rect);
    // SDL_RenderDrawRect (renderer,&rect);
    // ...

    // Rasterize
    SDL_RenderPresent (renderer);
}
