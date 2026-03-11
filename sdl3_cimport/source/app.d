import std.stdio;
import std.conv;
import std.format;
import std.stdio;
import importc;


int 
main () {
	init_sdl ();

	// Window, Surface, Renderer
	SDL_Window*   window   = new_window ();
	SDL_Renderer* renderer = new_renderer (window);

	// Event Loop
	foreach (ref evt; Events ()) {
        log_event (&evt);

        with (SDL_EventType)
	    switch (evt.type) {
	        case SDL_EVENT_QUIT:
	            return 0;
	        case SDL_EVENT_MOUSE_BUTTON_DOWN:
	            // ...
	            break;
	        case SDL_EVENT_KEY_DOWN:
	            if (evt.key.scancode == SDL_SCANCODE_ESCAPE)
	            	return 0;
	            break;
            case SDL_EVENT_WINDOW_SHOWN                 : break;  // event.window.windowID
            case SDL_EVENT_WINDOW_HIDDEN                : break;  // event.window.windowID
            case SDL_EVENT_WINDOW_EXPOSED               : draw (renderer); break; // event.window.windowID
            case SDL_EVENT_WINDOW_MOVED                 : break;  // event.window.windowID event.window.data1 event.window.data2 (x y)
            case SDL_EVENT_WINDOW_RESIZED               : break;  // event.window.windowID event.window.data1 event.window.data2 (width height)
            case SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED    : break;  // event.window.windowID event.window.data1 event.window.data2 (width height)
            case SDL_EVENT_WINDOW_METAL_VIEW_RESIZED    : break;  // event.window.windowID event.window.data1 event.window.data2 (width height)
            case SDL_EVENT_WINDOW_MINIMIZED             : break;  // event.window.windowID
            case SDL_EVENT_WINDOW_MAXIMIZED             : break;  // event.window.windowID
            case SDL_EVENT_WINDOW_RESTORED              : break;  // event.window.windowID
            case SDL_EVENT_WINDOW_MOUSE_ENTER           : break;  // event.window.windowID
            case SDL_EVENT_WINDOW_MOUSE_LEAVE           : break;  // event.window.windowID
            case SDL_EVENT_WINDOW_FOCUS_GAINED          : break;  // event.window.windowID
            case SDL_EVENT_WINDOW_FOCUS_LOST            : break;  // event.window.windowID
            case SDL_EVENT_WINDOW_CLOSE_REQUESTED       : break;  // event.window.windowID
            case SDL_EVENT_WINDOW_HIT_TEST              : break;  // event.window.windowID
            case SDL_EVENT_WINDOW_ICCPROF_CHANGED       : break;  // event.window.windowID
            case SDL_EVENT_WINDOW_DISPLAY_CHANGED       : break;  // event.window.windowID
            case SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED : break;  // event.window.windowID
            case SDL_EVENT_WINDOW_SAFE_AREA_CHANGED     : break;  // event.window.windowID
            case SDL_EVENT_WINDOW_OCCLUDED              : break;  // event.window.windowID
            case SDL_EVENT_WINDOW_ENTER_FULLSCREEN      : break;  // event.window.windowID
            case SDL_EVENT_WINDOW_LEAVE_FULLSCREEN      : break;  // event.window.windowID
            case SDL_EVENT_WINDOW_DESTROYED             : break;  // event.window.windowID
            case SDL_EVENT_WINDOW_HDR_STATE_CHANGED     : break;  // event.window.windowID
	        default:
	    }
    }

	return 0;
}

//
void 
init_sdl () {
    SDL_Init (SDL_INIT_VIDEO | SDL_INIT_EVENTS);

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
            640, 480,
            SDL_WINDOW_RESIZABLE
            //| SDL_WINDOW_ALLOW_HIGHDPI
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
    return SDL_CreateRenderer (window,null);
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
    SDL_Event front;
    bool      empty () { return (SDL_WaitEvent (&front) <= 0); }
    void      popFront () {}
}


void
draw (SDL_Renderer* renderer) {
    //SDL_SetRenderDrawColor (renderer, 0x22, 0x22, 0x22, 0xFF);
    //SDL_RenderClear (renderer);
    //SDL_SetRenderDrawColor (renderer, 0xCC, 0xCC, 0xCC, 0xFF);
    //int x,y; x=y=10;
    //SDL_RenderPoint (renderer, x, y);
    //SDL_RenderLine (renderer,0,0,100,100);
    //SDL_FRect rect = SDL_FRect (0,0,50,50);
    //SDL_RenderFillRect (renderer,&rect);
    //SDL_SetRenderDrawColor (renderer, 0xFF, 0xFF, 0xFF, 0xFF);
    //SDL_RenderRect (renderer,&rect);
    // ...

    // Rasterize
    SDL_RenderPresent (renderer);
}

// Тип для флагов окна (64-битное целое)
alias SDL_WindowFlags = ulong;

// Константы флагов окна (из SDL3)
enum SDL_WINDOW_FULLSCREEN          = 0x0000000000000001UL;
enum SDL_WINDOW_OPENGL              = 0x0000000000000002UL;
enum SDL_WINDOW_OCCLUDED            = 0x0000000000000004UL;
enum SDL_WINDOW_HIDDEN              = 0x0000000000000008UL;
enum SDL_WINDOW_BORDERLESS          = 0x0000000000000010UL;
enum SDL_WINDOW_RESIZABLE           = 0x0000000000000020UL;  // <-- то, что вам нужно
enum SDL_WINDOW_MINIMIZED           = 0x0000000000000040UL;
enum SDL_WINDOW_MAXIMIZED           = 0x0000000000000080UL;
enum SDL_WINDOW_MOUSE_GRABBED       = 0x0000000000000100UL;
enum SDL_WINDOW_INPUT_FOCUS         = 0x0000000000000200UL;
enum SDL_WINDOW_MOUSE_FOCUS         = 0x0000000000000400UL;
enum SDL_WINDOW_EXTERNAL            = 0x0000000000000800UL;
enum SDL_WINDOW_MODAL               = 0x0000000000001000UL;
enum SDL_WINDOW_HIGH_PIXEL_DENSITY  = 0x0000000000002000UL;
enum SDL_WINDOW_MOUSE_CAPTURE       = 0x0000000000004000UL;
enum SDL_WINDOW_MOUSE_RELATIVE_MODE = 0x0000000000008000UL;
enum SDL_WINDOW_ALWAYS_ON_TOP       = 0x0000000000010000UL;
enum SDL_WINDOW_UTILITY             = 0x0000000000020000UL;
enum SDL_WINDOW_TOOLTIP             = 0x0000000000040000UL;
enum SDL_WINDOW_POPUP_MENU          = 0x0000000000080000UL;
enum SDL_WINDOW_KEYBOARD_GRABBED    = 0x0000000000100000UL;
enum SDL_WINDOW_VULKAN              = 0x0000000010000000UL;
enum SDL_WINDOW_METAL               = 0x0000000020000000UL;
enum SDL_WINDOW_TRANSPARENT         = 0x0000000040000000UL;
enum SDL_WINDOW_NOT_FOCUSABLE       = 0x0000000080000000UL;


void
log_event (SDL_Event* evt) {
    with (SDL_EventType)
    switch (evt.type) {
        case SDL_EVENT_MOUSE_MOTION: 
            break;
        case SDL_EVENT_MOUSE_WHEEL:
            writefln ("%s %s %+f", cast (SDL_EventType)evt.type, cast (SDL_MouseWheelDirection) evt.wheel.direction, evt.wheel.y); break;
        case SDL_EVENT_WINDOW_SHOWN                 :
        case SDL_EVENT_WINDOW_HIDDEN                :
        case SDL_EVENT_WINDOW_EXPOSED               :
        case SDL_EVENT_WINDOW_MOVED                 :
        case SDL_EVENT_WINDOW_RESIZED               :
        case SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED    :
        case SDL_EVENT_WINDOW_METAL_VIEW_RESIZED    :
        case SDL_EVENT_WINDOW_MINIMIZED             :
        case SDL_EVENT_WINDOW_MAXIMIZED             :
        case SDL_EVENT_WINDOW_RESTORED              :
        case SDL_EVENT_WINDOW_MOUSE_ENTER           :
        case SDL_EVENT_WINDOW_MOUSE_LEAVE           :
        case SDL_EVENT_WINDOW_FOCUS_GAINED          :
        case SDL_EVENT_WINDOW_FOCUS_LOST            :
        case SDL_EVENT_WINDOW_CLOSE_REQUESTED       :
        case SDL_EVENT_WINDOW_HIT_TEST              :
        case SDL_EVENT_WINDOW_ICCPROF_CHANGED       :
        case SDL_EVENT_WINDOW_DISPLAY_CHANGED       :
        case SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED :
        case SDL_EVENT_WINDOW_SAFE_AREA_CHANGED     :
        case SDL_EVENT_WINDOW_OCCLUDED              :
        case SDL_EVENT_WINDOW_ENTER_FULLSCREEN      :
        case SDL_EVENT_WINDOW_LEAVE_FULLSCREEN      :
        case SDL_EVENT_WINDOW_DESTROYED             :
        case SDL_EVENT_WINDOW_HDR_STATE_CHANGED     :
            writefln ("%s %d", cast (SDL_EventType)evt.type, evt.window.windowID); break;
        case SDL_EVENT_KEY_DOWN:
        case SDL_EVENT_KEY_UP:
            writefln ("%s %s", cast (SDL_EventType)evt.type, evt.key.scancode); break;
        case SDL_EVENT_USER:
            writefln ("%s", cast (SDL_EventType) evt.type); break;
        default:
            writefln ("%s", cast (SDL_EventType) evt.type);
    }
}

