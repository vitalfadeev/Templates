import std.stdio;
import std.conv;
import std.format;
import std.stdio;
import includes;

int 
main () {
	init_sdl ();

	// Window, Surface
	SDL_Window* window = new_window ();

	// Renderer
	SDL_Renderer* renderer = new_renderer (window);

	// Event Loop
	foreach (Event* ev; events ())
	    switch (ev.type) {
	        case SDL_QUIT:
	            return 0;
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
	            writeln (ev);
	    }

	return 0;
}

//
void 
init_sdl () {
	// SDL_Init (SDL_INIT_AUDIO | SDL_INIT_VIDEO | SDL_INIT_EVENTS);
    SDL_Init (SDL_INIT_EVERYTHING);

    // IMG
    version (SDLImage) {
        auto flags = IMG_INIT_PNG; // | IMG_INIT_JPG;
        if (IMG_Init (flags) != flags)
            throw new IMGException ("The SDL_Image init failed");

        // import bindbc.sdl;
        // IMG_Load (name);
    }

    // TTF
    version (SDLTTF) {
        if (TTF_Init () == -1)
            throw new TTFException ("Failed to initialise SDL_TTF");
    }
}

//
SDL_Window* 
new_window () {
    // Window
    SDL_Window* window = 
        SDL_CreateWindow (
            __FILE_FULL_PATH__, // "SDL2 Window",
            SDL_WINDOWPOS_CENTERED_DISPLAY(0),
            SDL_WINDOWPOS_CENTERED_DISPLAY(0),
            640, 480,
            SDL_WINDOW_VULKAN | 
            SDL_WINDOW_RESIZABLE | 
            SDL_WINDOW_ALLOW_HIGHDPI
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

version (SDLTTF)
class 
TTFException : Exception{
    this (string s) {
        import std.string : fromStringz;
        super (
            format!"%s: %s"(s, fromStringz(TTF_GetError()))
        );
    }
}

version (SDLImage)
class 
IMGException : Exception{
    this (string s) {
        import std.string : fromStringz;
        super (
            format!"%s: %s"(s, fromStringz(IMG_GetError()))
        );
    }
}

auto
events () {
    return Events (null);
}

struct
Events {
    Event  _ev;
    Event* front;

    @disable this ();

    this (void* _) {
        front = &_ev;
    }

    bool 
    empty () {
        return (SDL_WaitEvent (front) <= 0);
    }

    void
    popFront () {
        //
    }
}

alias Event = SDL_Event;


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
