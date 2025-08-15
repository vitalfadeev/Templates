import std.stdio;
import core.stdc.stdlib : EXIT_SUCCESS,EXIT_FAILURE;
import wayland_struct;
import impl;


//extern (C)
int
main () {
    //version (Dynamic) loadWaylandClient ();

    // init, connect, surface, window
    auto wayland = Wayland (640,480,&draw);

    // event loop
    foreach (Event* event; wayland.events) {
        writeln (*event);
        switch (event.type) {
            case Event.Type.POINTER_BUTTON: 
                if (event.pointer.button == BTN_LEFT)
                    wayland.ctx.done = true;
                break;
            case Event.Type.KEYBOARD_KEY: 
                if (event.keyboard.key == KEY_ESC)
                    wayland.ctx.done = true;
                break;
            default:
        }
    }

    return EXIT_SUCCESS;
}

void
draw (wayland_ctx* ctx, uint* pixels /* xrgb8888 */) {
    // Draw checkerboxed background
    with (ctx) {
        for (int y = 0; y < height; ++y) {
            for (int x = 0; x < width; ++x) {
                if ((x + y / 32 * 32) % 64 < 32)
                    pixels[y * width + x] = 0xFF666666;
                else
                    pixels[y * width + x] = 0xFFEEEEEE;
            }
        }
    }
}
