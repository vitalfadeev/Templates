import std.stdio; 
import std.format : format;
import core.stdc.string        : strcmp;
import wayland_struct;
import util;

static const uint WIDTH             = 320;
static const uint HEIGHT            = 240;
static const uint PIXEL_FORMAT_ID   = wl_shm.format_.xrgb8888;


struct
Wayland {
    wayland_ctx ctx;

    this (int w, int h) {
        if (!connect ())
            throw new Exception ("Not connected");
        create_surface (w,h);
    }

    ~this () {
        cleanup ();
    }

    auto 
    connect () {
        with (ctx) {
            wl_display  = wl_display_connect (null);
            _init_registry ();
        }
        return check ();
    }
    auto 
    connect (const char* name) {
        with (ctx) {
            wl_display  = wl_display_connect (name);
            _init_registry ();
        }
        return check ();
    }
    auto 
    connect (int fd) { 
        with (ctx) {
            wl_display_connect_to_fd (fd); 
            _init_registry ();
        }
        return check ();
    }
    void 
    _init_registry () {
        with (ctx) {
            wl_registry = wl_display.get_registry ();  // return wl_registry__impl
            wl_registry.add_listener (&wl_registry.listener,&ctx);  // wl_proxy.add_listener
            wl_display.roundtrip ();
        }
    }

    auto
    check () {
        with (ctx) {
            if (xdg_wm_base is null) {
                printf ("Can't find xdg_wm_base\n");
                return false;
            } 

            if (wl_seat is null) {
                printf ("Can't find seat\n");
                return false;
            } 
        } 

        return true;
    }

    void
    create_surface (int w=WIDTH, int h=HEIGHT) {
        with (ctx) {
            width        = w;
            height       = h;
            wl_surface   = wl_compositor.create_surface ();
            xdg_surface  = xdg_wm_base.get_xdg_surface (wl_surface);
            xdg_surface.add_listener (&xdg_surface.listener, &ctx);
            xdg_toplevel = xdg_surface.get_toplevel ();
            xdg_toplevel.set_title ("Example client");
            wl_surface.commit ();
        }
    }

    auto
    events () {
        return Events (&this);
    }

    void
    loop () {
        with (ctx)
        while (!done) {
            if (wl_display.dispatch () < 0) {
                printf ("loop: dispatch 1\n");
                perror ("Main loop error");
                done = true;
            }
        }
    }

    void
    cleanup () {
        with (ctx) {
            wl_registry.destroy ();
            wl_display.disconnect ();        
        }
    }
}

extern (C)
struct 
wayland_ctx {
    int                 width  = WIDTH;
    int                 height = HEIGHT;

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

    Input               input;
    Event               event;

    bool                done;

    //
    struct 
    Input {
        wl_keyboard__impl wl_keyboard;
        wl_pointer__impl  wl_pointer;
        wl_touch__impl    wl_touch;
    }
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

//extern (C)
//alias _wl_registry__impl = 
//    T_impl!(
//        wl_registry, 
//        wl_registry.Listener (
//            // global:
//            (void* ctx, wl_registry* _this, uint name, const(char)* interface_, uint version_) {
//                printf ("%d: %s\n", name, interface_);

//                mixin (BIND!wl_seat);
//                mixin (BIND!wl_compositor);
//                mixin (BIND!xdg_wm_base);
//                mixin (BIND!wl_shm);
//            },

//            // global_remove:
//            (void* ctx, wl_registry* _this, uint name) {
//                //
//            }
//        )
//    );

struct
T_impl (T,alias _listener) {
    T* _super;
    alias _super this;

    void
    opAssign (typeof(_super) b) {
        _super = b;
    }

    T.Listener listener = _listener;
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

        mixin (BIND!wl_seat);
        mixin (BIND!wl_compositor);
        mixin (BIND!xdg_wm_base);
        mixin (BIND!wl_shm);
    }

    extern (C) 
    static
    void 
    global_remove (void* ctx, wl_registry* _this, uint name) {
        //
    }
}

// wl_compositor
struct
wl_compositor__impl {
    wl_compositor* _super;
    alias _super this;

    void
    opAssign (typeof(_super) b) {
        _super = b;
    }
}

// wl_surface
struct
wl_surface__impl {
    wl_surface* _super;
    alias _super this;

    void
    opAssign (typeof(_super) b) {
        _super = b;
    }

    typeof(_super).Listener listener = {
        &enter,
        &leave,
        &preferred_buffer_scale,
        &preferred_buffer_transform,
    };

    extern (C)
    static
    void
    enter (void* ctx, wl_surface* _this /* args: */ , wl_output* output) {
        // 
    }

    extern (C)
    static
    void
    leave (void* ctx, wl_surface* _this /* args: */ , wl_output* output) {
        // 
    }

    extern (C)
    static
    void
    preferred_buffer_scale (void* ctx, wl_surface* _this /* args: */ , int factor) {
        // 
    }

    extern (C)
    static
    void
    preferred_buffer_transform (void* ctx, wl_surface* _this /* args: */ , uint transform) {
        // 
    }
}

// wl_shm
struct
wl_shm__impl {
    wl_shm* _super;
    alias _super this;

    void
    opAssign (typeof(_super) b) {
        _super = b;
    }

    typeof(_super).Listener listener = {
        &format,
    };

    extern (C)
    static
    void
    format (void* ctx, wl_shm* _this /* args: */ , uint format) {
        // 
    }
}

// wl_shm_pool
struct
wl_shm_pool__impl {
    wl_shm_pool* _super;
    alias _super this;

    void
    opAssign (typeof(_super) b) {
        _super = b;
    }
}

// wl_seat
struct
wl_seat__impl {
    wl_seat* _super;
    alias _super this;

    void
    opAssign (typeof(_super) b) {
        _super = b;
    }

    typeof(_super).Listener listener = {
        &capabilities,
        &name,
    };

    extern (C)
    static
    void
    capabilities (void* ctx, wl_seat* _this /* args: */ , uint capabilities) {
        auto _ctx = cast (wayland_ctx*) ctx;
        with (_ctx) {
            if (capabilities & wl_seat.capability_.keyboard) {
                input.wl_keyboard = wl_seat.get_keyboard ();
                input.wl_keyboard.add_listener (&input.wl_keyboard.listener,ctx);  // wl_proxy.add_listener
            }
            if (capabilities & wl_seat.capability_.pointer) {
                input.wl_pointer = wl_seat.get_pointer ();
                input.wl_pointer.add_listener (&input.wl_pointer.listener,ctx);  // wl_proxy.add_listener
            }
            if (capabilities & wl_seat.capability_.touch) {
                input.wl_touch = wl_seat.get_touch ();
                input.wl_touch.add_listener (&input.wl_touch.listener,ctx);  // wl_proxy.add_listener
            }
        }
    }

    extern (C)
    static
    void
    name (void* ctx, wl_seat* _this /* args: */ , const(char)* name) {
        printf ("seat.name: %s\n", name);
    }
}

// wl_buffer
struct
wl_buffer__impl {
    wl_buffer* _super;
    alias _super this;

    void
    opAssign (typeof(_super) b) {
        _super = b;
    }

    typeof(_super).Listener listener = {
        &release,
    };

    extern (C)
    static
    void
    release (void* ctx, wl_buffer* _this /* args: */ ) {
        _this.destroy ();
    }
}

// xdg_wm_base
struct
xdg_wm_base__impl {
    xdg_wm_base* _super;
    alias _super this;

    void
    opAssign (typeof(_super) b) {
        _super = b;
    }

    typeof(_super).Listener listener = {
        /*ping:*/ &ping,
    };

    extern (C)
    static
    void
    ping (void* ctx, typeof(_super) _this /* args: */ , uint serial) {
        _this.pong (serial);
    }
}

// xdg_surface
struct
xdg_surface__impl {
    xdg_surface* _super;
    alias _super this;

    void
    opAssign (typeof(_super) b) {
        _super = b;
    }

    typeof(_super).Listener listener = {
        configure: &configure,
    };

    extern (C)
    static
    void
    configure (void* ctx, xdg_surface* _this /* args: */ , uint serial) {
        auto _ctx = cast (wayland_ctx*) ctx;
        _this.ack_configure (serial);

        with (_ctx) {
            auto buffer = draw_frame (_ctx);
            if (buffer !is null) {
                wl_surface.attach (buffer, 0, 0);
                wl_surface.commit ();
            }
        }
    }
}


// xdg_toplevel
struct
xdg_toplevel__impl {
    xdg_toplevel* _super;
    alias _super this;

    void
    opAssign (typeof(_super) b) {
        _super = b;
    }
}


// wl_pointer
struct
wl_pointer__impl {
    wl_pointer* _super;
    alias _super this;

    void
    opAssign (typeof(_super) b) {
        _super = b;
    }

    typeof(_super).Listener listener = {
        &enter,
        &leave,
        &motion,
        &button,
        &axis,
        &frame,
        &axis_source,
        &axis_stop,
        &axis_discrete,
        &axis_value120,
        &axis_relative_direction,
    };

    extern (C)
    static
    void
    enter (void* ctx, wl_pointer* _this /* args: */ , uint serial, wl_surface* surface, wl_fixed_t surface_x, wl_fixed_t surface_y) {
        with (cast (wayland_ctx*) ctx) {
            // event.type = Event.Type.POINTER_*;
            event.pointer.surface = surface;
            event.pointer.x = surface_x.to_int;
            event.pointer.y = surface_y.to_int;
        }
    }

    extern (C)
    static
    void
    leave (void* ctx, wl_pointer* _this /* args: */ , uint serial, wl_surface* surface) {
        with (cast (wayland_ctx*) ctx) {
            // event.type = Event.Type.POINTER_*;
            event.pointer.surface = null;
        }
    }

    extern (C)
    static
    void
    motion (void* ctx, wl_pointer* _this /* args: */ , uint time, wl_fixed_t surface_x, wl_fixed_t surface_y) {
        with (cast (wayland_ctx*) ctx) {
            event.type = Event.Type.POINTER_MOTION;
            event.pointer.x = surface_x.to_int;
            event.pointer.y = surface_y.to_int;
        }
    }

    extern (C)
    static
    void
    button (void* ctx, wl_pointer* _this /* args: */ , uint serial, uint time, uint button, uint state) {
        with (cast (wayland_ctx*) ctx) {
            event.type = Event.Type.POINTER_BUTTON;
            event.pointer.button = button;
            event.pointer.state  = state;
        }
    }

    extern (C)
    static
    void
    axis (void* ctx, wl_pointer* _this /* args: */ , uint time, uint axis, wl_fixed_t value) {
        with (cast (wayland_ctx*) ctx) {
            event.type = Event.Type.POINTER_AXIS;
            event.pointer.axis       = axis;
            event.pointer.axis_value = value.to_int;
        }
    }

    extern (C)
    static
    void
    frame (void* ctx, wl_pointer* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    axis_source (void* ctx, wl_pointer* _this /* args: */ , uint axis_source) {
        with (cast (wayland_ctx*) ctx) {
            event.type = Event.Type.POINTER_AXIS;
            event.pointer.axis_source = axis_source;
        }
    }

    extern (C)
    static
    void
    axis_stop (void* ctx, wl_pointer* _this /* args: */ , uint time, uint axis) {
        with (cast (wayland_ctx*) ctx) {
            event.type = Event.Type.POINTER_AXIS;
            event.pointer.axis_stop = axis;
        }
    }

    extern (C)
    static
    void
    axis_discrete (void* ctx, wl_pointer* _this /* args: */ , uint axis, int discrete) {
        with (cast (wayland_ctx*) ctx) {
            event.type = Event.Type.POINTER_AXIS;
            event.pointer.axis_stop     = axis;
            event.pointer.axis_discrete = discrete;
        }
    }

    extern (C)
    static
    void
    axis_value120 (void* ctx, wl_pointer* _this /* args: */ , uint axis, int value120) {
        // 
    }

    extern (C)
    static
    void
    axis_relative_direction (void* ctx, wl_pointer* _this /* args: */ , uint axis, uint direction) {
        with (cast (wayland_ctx*) ctx) {
            event.type = Event.Type.POINTER_AXIS;
            event.pointer.axis           = axis;
            event.pointer.axis_direction = direction;
        }
    }
}

// wl_keyboard
struct
wl_keyboard__impl {
    wl_keyboard* _super;
    alias _super this;

    void
    opAssign (typeof(_super) b) {
        _super = b;
    }

    typeof(_super).Listener listener = {
        &keymap,
        &enter,
        &leave,
        &key,
        &modifiers,
        &repeat_info,
    };

    extern (C)
    static
    void
    keymap (void* ctx, wl_keyboard* _this /* args: */ , uint format, int fd, uint size) {
        // 
    }

    extern (C)
    static
    void
    enter (void* ctx, wl_keyboard* _this /* args: */ , uint serial, wl_surface* surface, wl_array* keys) {
        with (cast (wayland_ctx*) ctx) {
            // event.type = Event.Type.KEYBOARD_KEY*;
            event.keyboard.surface = surface;
        }
    }

    extern (C)
    static
    void
    leave (void* ctx, wl_keyboard* _this /* args: */ , uint serial, wl_surface* surface) {
        with (cast (wayland_ctx*) ctx) {
            // event.type = Event.Type.KEYBOARD_KEY*;
            event.keyboard.surface = null;
        }
    }

    extern (C)
    static
    void
    key (void* ctx, wl_keyboard* _this /* args: */ , uint serial, uint time, uint key, uint state) {
        with (cast (wayland_ctx*) ctx) {
            event.type = Event.Type.KEYBOARD_KEY;
            event.keyboard.key   = key;
            event.keyboard.state = state;
        }
    }

    extern (C)
    static
    void
    modifiers (void* ctx, wl_keyboard* _this /* args: */ , uint serial, uint mods_depressed, uint mods_latched, uint mods_locked, uint group) {
        // 
    }

    extern (C)
    static
    void
    repeat_info (void* ctx, wl_keyboard* _this /* args: */ , int rate, int delay) {
        // 
    }
}

// wl_touch
struct
wl_touch__impl {
    wl_touch* _super;
    alias _super this;

    void
    opAssign (typeof(_super) b) {
        _super = b;
    }

    typeof(_super).Listener listener = {
        &down,
        &up,
        &motion,
        &frame,
        &cancel,
        &shape,
        &orientation,
    };

        extern (C)
    static
    void
    down (void* ctx, wl_touch* _this /* args: */ , uint serial, uint time, wl_surface* surface, int id, wl_fixed_t x, wl_fixed_t y) {
        // 
    }

    extern (C)
    static
    void
    up (void* ctx, wl_touch* _this /* args: */ , uint serial, uint time, int id) {
        // 
    }

    extern (C)
    static
    void
    motion (void* ctx, wl_touch* _this /* args: */ , uint time, int id, wl_fixed_t x, wl_fixed_t y) {
        // 
    }

    extern (C)
    static
    void
    frame (void* ctx, wl_touch* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    cancel (void* ctx, wl_touch* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    shape (void* ctx, wl_touch* _this /* args: */ , int id, wl_fixed_t major, wl_fixed_t minor) {
        // 
    }

    extern (C)
    static
    void
    orientation (void* ctx, wl_touch* _this /* args: */ , int id, wl_fixed_t orientation) {
        // 
    }
}

struct
Events {
    Wayland* wayland;
    Event*   front;

    this (Wayland* wayland) {
        this.wayland   = wayland;
        this.front     = &wayland.ctx.event;
        this.front.ctx = &wayland.ctx;
    }

    bool  
    empty () {
        front.type = Event.type.NONE;

        with (wayland.ctx)
        if (wl_display.dispatch () < 0) {
            printf ("loop: dispatch 1\n");
            perror ("Main loop error");
            done = true;
            return done;
        }
        else {
            return done;
        }
    }

    void 
    popFront () {
        //
    }
}

struct
Event {
    Type         type;
    wayland_ctx* ctx;
    union {
        Device_Event   device;
        Keyboard_Event keyboard;
        Pointer_Event  pointer;
        Touch_Event    touch;
    }

    struct
    Device_Event {
        //
    }

    struct
    Keyboard_Event {
        wl_surface* surface;
        uint key;
        uint state;
    }

    struct
    Pointer_Event {
        wl_surface* surface;
        int  x;
        int  y;
        uint button;
        uint state;
        uint axis;
        uint axis_source;
        int  axis_value;
        uint axis_stop;
        int  axis_discrete;
        uint axis_direction;
    }

    struct
    Touch_Event {
        //
    }

    import libinput_d : libinput_event_type;

    string
    toString () {
        import std.format : format;
        import std.conv   : to;

        switch (type) {
            //case Type.DEVICE_ADDED:
            //case Type.DEVICE_REMOVED:
            //    return format!"%s: %s" (
            //        type, 
            //        device.name.to!string);
            case Type.KEYBOARD_KEY:
                return format!"%s: %d: %s: %s" ( 
                    type, 
                    keyboard.key,  // KEY_1,KEY_ESC,KEY_BACKSPACE
                    keyboard.key.decode_key,
                    cast (wl_keyboard.key_state_) keyboard.state);
            case Type.POINTER_MOTION:
                return format!"%s: x,y: %d,%d" (
                    type, 
                    pointer.x, 
                    pointer.y); 
            //case Type.POINTER_MOTION_ABSOLUTE:
            //    return format!"%s: abs_x,abx_y: %f,%f" (
            //        type, 
            //        pointer.absolute_x, 
            //        pointer.absolute_y);
            case Type.POINTER_BUTTON:
                return format!"%s: %d %s: %s" (
                    type, 
                    pointer.button,  // BTN_LEFT,BTN_RIGHT,BTN_MIDDLE
                    decode_btn (pointer.button),
                    cast (wl_pointer.button_state_) pointer.state);
            case Type.POINTER_AXIS:
                return format!"%s: %s: %s: %d" (
                    type, 
                    cast (wl_pointer.axis_source_) pointer.axis_source,
                    cast (wl_pointer.axis_) pointer.axis,
                    // cast (wl_pointer.axis_relative_direction_) axis_direction,
                    pointer.axis_value);
            case Type.TOUCH_DOWN:
            case Type.TOUCH_UP:
            case Type.TOUCH_MOTION:
            case Type.TOUCH_CANCEL:
            case Type.TOUCH_FRAME:
                return format!"%s" (type);
            case Type.TABLET_TOOL_AXIS:
            case Type.TABLET_TOOL_PROXIMITY:
            case Type.TABLET_TOOL_TIP:
            case Type.TABLET_TOOL_BUTTON:
                return format!"%s" (type);
            case Type.GESTURE_SWIPE_BEGIN:
            case Type.GESTURE_SWIPE_UPDATE:
            case Type.GESTURE_SWIPE_END:
            case Type.GESTURE_PINCH_BEGIN:
            case Type.GESTURE_PINCH_UPDATE:
            case Type.GESTURE_PINCH_END:
                return format!"%s" (type);
            default:
                return format!"%s" (type);
        }
    }

    enum
    Type : ushort {
        NONE                    = libinput_event_type.LIBINPUT_EVENT_NONE,
        DEVICE_ADDED            = libinput_event_type.LIBINPUT_EVENT_DEVICE_ADDED,
        DEVICE_REMOVED          = libinput_event_type.LIBINPUT_EVENT_DEVICE_REMOVED,
        KEYBOARD_KEY            = libinput_event_type.LIBINPUT_EVENT_KEYBOARD_KEY,
        POINTER_MOTION          = libinput_event_type.LIBINPUT_EVENT_POINTER_MOTION,
        POINTER_MOTION_ABSOLUTE = libinput_event_type.LIBINPUT_EVENT_POINTER_MOTION_ABSOLUTE,
        POINTER_BUTTON          = libinput_event_type.LIBINPUT_EVENT_POINTER_BUTTON,
        POINTER_AXIS            = libinput_event_type.LIBINPUT_EVENT_POINTER_AXIS,
        POINTER_AXIS_           = 404,
        TOUCH_DOWN              = libinput_event_type.LIBINPUT_EVENT_TOUCH_DOWN,
        TOUCH_UP                = libinput_event_type.LIBINPUT_EVENT_TOUCH_UP,
        TOUCH_MOTION            = libinput_event_type.LIBINPUT_EVENT_TOUCH_MOTION,
        TOUCH_CANCEL            = libinput_event_type.LIBINPUT_EVENT_TOUCH_CANCEL,
        TOUCH_FRAME             = libinput_event_type.LIBINPUT_EVENT_TOUCH_FRAME,
        TABLET_TOOL_AXIS        = libinput_event_type.LIBINPUT_EVENT_TABLET_TOOL_AXIS,
        TABLET_TOOL_PROXIMITY   = libinput_event_type.LIBINPUT_EVENT_TABLET_TOOL_PROXIMITY,
        TABLET_TOOL_TIP         = libinput_event_type.LIBINPUT_EVENT_TABLET_TOOL_TIP,
        TABLET_TOOL_BUTTON      = libinput_event_type.LIBINPUT_EVENT_TABLET_TOOL_BUTTON,
        GESTURE_SWIPE_BEGIN     = libinput_event_type.LIBINPUT_EVENT_GESTURE_SWIPE_BEGIN,
        GESTURE_SWIPE_UPDATE    = libinput_event_type.LIBINPUT_EVENT_GESTURE_SWIPE_UPDATE,
        GESTURE_SWIPE_END       = libinput_event_type.LIBINPUT_EVENT_GESTURE_SWIPE_END,
        GESTURE_PINCH_BEGIN     = libinput_event_type.LIBINPUT_EVENT_GESTURE_PINCH_BEGIN,
        GESTURE_PINCH_UPDATE    = libinput_event_type.LIBINPUT_EVENT_GESTURE_PINCH_UPDATE,
        GESTURE_PINCH_END       = libinput_event_type.LIBINPUT_EVENT_GESTURE_PINCH_END,
    }
}

template 
BIND (T) {
    enum BIND = format!
    "
    {
        auto dest = &(cast (wayland_ctx*) ctx).%s;

        if (strcmp (dest.IFACE.name, interface_) == 0) {
            *dest = cast (%s*) _this.bind (name, &dest.IFACE, version_); 

            static if (__traits (hasMember, dest, \"listener\")) {
                dest.add_listener (&dest.listener,ctx);
            }
        }
    }"
    (T.stringof, T.stringof);
}

auto
to_float (wl_fixed_t a) {
    return 1.0f * (a / 2^^8) + (1.0f * (a & 0xFF) / 0xFF);
}auto
to_int (wl_fixed_t a) {
    return (a / 2^^8) + (a & 0xFF) / 0xFF;
}