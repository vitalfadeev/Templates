## Example

```
import wayland_struct;


void 
go () {
    wayland_ctx ctx;
    with (ctx) {
        wl_display  = wl_display_connect (null);
        wl_registry = wl_display.get_registry ();
        wl_registry.add_listener (&wl_registry.listener,&ctx);  // wl_proxy.add_listener
        wl_display.roundtrip ();
    }
}


struct 
wayland_ctx {
    wl_display__impl    wl_display;
    wl_registry__impl   wl_registry;
    wl_seat__impl       wl_seat;
    wl_compositor__impl wl_compositor;
    wl_surface__impl    wl_surface;
    wl_shm__impl        wl_shm;
    wl_shm_pool__impl   wl_shm_pool;
    wl_buffer__impl     wl_buffer;

    xdg_wm_base__impl   xdg_wm_base;
    xdg_surface__impl   xdg_surface;
    xdg_toplevel__impl  xdg_toplevel;
}


// wl_display
struct
wl_display__impl {
    wl_display* _super;
    alias _super this;

    void
    opAssign (typeof(_super) b) {
        _super = b;
    }

    auto
    get_registry () {
        import wayland_struct.protocol.wayland : wl_registry,wl_registry_interface;
        return 
            cast (wl_registry*)
            wl_proxy_marshal_flags (
                cast (wl_proxy*) _super, 
                display_opcode_get_registry, 
                &wl_registry_interface, 
                wl_proxy_get_version (cast (wl_proxy *) _super),
                0,
                null
            );
    }
}


// wl_registry
struct
wl_registry__impl {
    wl_registry* _super;
    alias _super this;

    void
    opAssign (typeof(_super) b) {
        _super = b;
    }

    typeof(_super).Listener listener = {
        &global,
        &global_remove,
    };

    extern (C)
    static
    void 
    global (void* ctx, wl_registry* _this, uint name, const(char)* interface_, uint version_) {
        printf ("%d: %s\n", name, interface_);
        auto _ctx =  cast (wayland_ctx*) ctx;

        mixin (BIND!xdg_wm_base);
        mixin (BIND!wl_seat);
        mixin (BIND!wl_compositor);
        mixin (BIND!wl_shm);
    }

    extern (C) 
    static
    void 
    global_remove (void* ctx, wl_registry* _this, uint name) {
        //
    }
}


...
more in https://github.com/vitalfadeev/wayland_test
```

