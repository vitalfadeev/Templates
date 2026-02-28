import std.stdio;
import std.conv;
import std.format;
import std.stdio;
import importc;


int 
main () {
	init_sdl ();

	// Window, Surface
	SDL_Window* window = new_window ();

	// Renderer
	SDL_Renderer* renderer = new_renderer (window);

	// Event Loop
	foreach (ref evt; Events ()) {
        log_event (&evt);

        with (SDL_EventType)
	    switch (evt.type) {
	        case SDL_QUIT:
	            return 0;
	        case SDL_MOUSEBUTTONDOWN:
	            // ...
	            break;
	        case SDL_KEYDOWN:
	            if (evt.key.keysym.sym == SDLK_ESCAPE)
	            	return 0;
	            break;
	        case SDL_WINDOWEVENT:
	            switch (evt.window.event) {
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
	                        evt.window.windowID, evt.window.event);
	            }
	            break;
	        default:
	    }
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
        auto flags = IMG_INIT_PNG | IMG_INIT_JPG;
        if (IMG_Init (flags) != flags)
            throw new IMGException ("The SDL_Image init failed");
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
            SDL_WINDOWPOS_CENTERED_DISPLAY (0),
            SDL_WINDOWPOS_CENTERED_DISPLAY (0),
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

struct
Events {
    Event front;
    bool  empty () { return (SDL_WaitEvent (&front) <= 0); }
    void  popFront () {}
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

void
log_event (Event* evt) {
    with (SDL_EventType)
    if (evt.type == SDL_MOUSEMOTION)
        {}
    else
    if (evt.type == SDL_MOUSEWHEEL)
        writefln ("%s %s", cast (SDL_EventType)evt.type, cast (SDL_MouseWheelDirection) evt.wheel.direction);
    else
    if (evt.type == SDL_WINDOWEVENT)
        writefln ("%s %d %s ", cast (SDL_EventType)evt.type, evt.window.windowID, cast (SDL_WindowEventID) evt.window.event);
    else
    if (evt.type == SDL_KEYDOWN)
        writefln ("%s %s", cast (SDL_EventType)evt.type, evt.key.keysym.scancode);
    else
    if (evt.type == SDL_KEYUP)
        writefln ("%s %s", cast (SDL_EventType)evt.type, evt.key.keysym.scancode);
    else
    if (evt.type < SDL_USEREVENT)
        writefln ("%s", cast (SDL_EventType) evt.type);    
    else
        writefln ("%s", cast (SDL_EventType) evt.type);
}
