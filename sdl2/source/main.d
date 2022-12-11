import std.stdio;
import bindbc.sdl;


int main()
{
    // Init
    init_sdl();

    // Window, Surface
    SDL_Window*  window;
    SDL_Surface* window_surface;
    creatae_window( window, window_surface );

    // Event Loop
    event_loop( window );

    return 0;
}


//
void init_sdl()
{
    SDLSupport ret = loadSDL();

    if ( ret !=sdlSupport ) 
    {
        if ( ret == SDLSupport.noLibrary ) 
        {
            throw new Exception( "The SDL shared library failed to load" );
        }
        else if ( SDLSupport.badLibrary ) 
        {
            throw new Exception( "One or more symbols failed to load. The likely cause is that the shared library is for a lower version than bindbc-sdl was configured to load (via SDL_204, GLFW_2010 etc.)" );
        }
    }

    loadSDL( "sdl2.dll" );
}


//
void creatae_window( ref SDL_Window* window, ref SDL_Surface* window_surface )
{
    // Window
    window = 
        SDL_CreateWindow(
            "SDL2 Window",
            SDL_WINDOWPOS_CENTERED,
            SDL_WINDOWPOS_CENTERED,
            680, 480,
            0
        );

    if( !window )
    {
        writeln( "ERR: ", SDL_GetError() );
        throw new Exception( "Failed to create window" );
    }

    // Surface
    window_surface = SDL_GetWindowSurface( window );

    if( !window_surface )
    {
        writeln( "ERR: ", SDL_GetError() );
        throw new Exception( "Failed to get the surface from the window" );
    }

    // Update
    SDL_UpdateWindowSurface( window );    
}


//
void event_loop( ref SDL_Window* window )
{
    bool game_is_still_running = true;

    while ( game_is_still_running )
    {
        SDL_Event event;

        while ( SDL_PollEvent( &event ) > 0 ) 
        {
            // Process Event
            switch ( event.type )
            {
                case SDL_QUIT:
                    game_is_still_running = false;
                    break;
                default:
            }

            // Update Window
            SDL_UpdateWindowSurface( window );
        }

        // Delay
        SDL_Delay( 100 );
    }        
}
