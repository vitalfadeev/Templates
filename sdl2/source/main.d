import std.conv;
import std.format;
import std.stdio;
import bindbc.sdl;


int main()
{
    // Init
    init_sdl();

    // Tree
    Tree tree;
    create_tree( tree );

    // Window, Surface
    SDL_Window*  window;
    create_window( window );

    // Renderer
    SDL_Renderer* renderer;
    create_renderer( window, renderer );

    // Event Loop
    event_loop( tree, window, renderer );

    return 0;
}


//
void init_sdl()
{
    SDLSupport ret = loadSDL();

    if ( ret != sdlSupport ) 
    {
        if ( ret == SDLSupport.noLibrary ) 
            throw new Exception( "The SDL shared library failed to load" );
        else if ( SDLSupport.badLibrary ) 
            throw new Exception( "One or more symbols failed to load. The likely cause is that the shared library is for a lower version than bindbc-sdl was configured to load (via SDL_204, GLFW_2010 etc.)" );
    }

    loadSDL( "sdl2.dll" );
}


//
void create_tree( ref Tree tree )
{
    tree = new Tree;
}


//
void create_window( ref SDL_Window* window )
{
    // Window
    window = 
        SDL_CreateWindow(
            "SDL2 Window",
            SDL_WINDOWPOS_CENTERED,
            SDL_WINDOWPOS_CENTERED,
            640, 480,
            0
        );

    if ( !window )
        throw new SDLException( "Failed to create window" );

    // Update
    SDL_UpdateWindowSurface( window );    
}


//
void create_renderer( SDL_Window* window, ref SDL_Renderer* renderer )
{
    renderer = SDL_CreateRenderer( window, -1, SDL_RENDERER_SOFTWARE );
}


//
void event_loop( Tree tree, ref SDL_Window* window, SDL_Renderer* renderer )
{
    //
    bool game_is_still_running = true;

    //
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

            // Render
            tree.render( renderer );

            // Raxterize
            SDL_RenderPresent( renderer );

            // Update Window
            SDL_UpdateWindowSurface( window );
        }

        // Delay
        SDL_Delay( 100 );
    }        
}


// 
class Tree
{
    void render( SDL_Renderer* renderer )
    {
        //
    }
}


//
class SDLException : Exception
{
    this( string msg )
    {
        super( format!"%s: %s"( SDL_GetError().to!string, msg ) );
    }
}
