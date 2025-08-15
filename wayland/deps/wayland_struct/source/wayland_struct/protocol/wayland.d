// Generated with wayland-scanner-d
// protocol wayland
module wayland_struct.protocol.wayland;

import wayland_struct.proxy : wl_proxy;
import wayland_struct.proxy : wl_proxy_marshal;
import wayland_struct.proxy : wl_proxy_marshal_constructor;
import wayland_struct.proxy : wl_proxy_marshal_constructor_versioned;
import wayland_struct.proxy : wl_proxy_marshal_flags;
import wayland_struct.proxy : wl_proxy_get_version;
import wayland_struct.proxy : wl_proxy_add_listener;
import wayland_struct.proxy : WL_MARSHAL_FLAG_DESTROY;
import wayland_struct.util  : wl_proxy_callback;;
import wayland_struct.util  : wl_message;
import wayland_struct.util  : wl_interface;
import wayland_struct.util  : wl_fixed_t;
import wayland_struct.util  : wl_array;
import wayland_struct.protocol.wayland;

// module wayland.wl_registry;

struct
wl_registry {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_registry);
  @disable this(ref wl_registry);
  }

  // Requests
  pragma (inline,true):
  void*
  bind (uint name, const wl_interface* interface_, uint version_ ) {
  	return cast (void*) 
  		wl_proxy_marshal_flags (
  			cast (wl_proxy*) &this,
  	        Opcode.bind, 
  	        interface_, 
  	        version_, 
  	        0, 
  	        name, 
  	        interface_.name, 
  	        version_, 
  	    	null
  		);
  }

  // Events
  struct
  Listener {
    Global_cb        global        = &_global_impl_default;
    Global_remove_cb global_remove = &_global_remove_impl_default;

    alias Global_cb        = extern (C) void function (void* ctx, wl_registry* _this /* args: */ , uint name, const(char)* interface_, uint version_);
    alias Global_remove_cb = extern (C) void function (void* ctx, wl_registry* _this /* args: */ , uint name);

    extern (C)
    static
    void
    _global_impl_default (void* ctx, wl_registry* _this /* args: */ , uint name, const(char)* interface_, uint version_) {
        // 
    }

    extern (C)
    static
    void
    _global_remove_impl_default (void* ctx, wl_registry* _this /* args: */ , uint name) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Opcodes
  enum
  Opcode : uint {
    bind = 0,
  }

  alias IFACE = wl_registry_interface;
}

static const wl_interface*[2] wl_registry_bind_requiest_interfaces = [null,null];
static const wl_message[1] wl_registry_requests = [
  wl_message ("bind", "usun", wl_registry_bind_requiest_interfaces.ptr),
];
static const wl_interface*[3] wl_registry_global_event_interfaces = [null,null,null];
static const wl_interface*[1] wl_registry_global_remove_event_interfaces = [null];
static const wl_message[2] wl_registry_events = [
  wl_message ("global", "usu", wl_registry_global_event_interfaces.ptr),
  wl_message ("global_remove", "u", wl_registry_global_remove_event_interfaces.ptr),
];
extern (C) static const wl_interface wl_registry_interface = {
  "wl_registry", 1,
  wl_registry_requests.length, wl_registry_requests.ptr,
  wl_registry_events.length,   wl_registry_events.ptr,
};
// module wayland.wl_callback;

struct
wl_callback {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_callback);
  @disable this(ref wl_callback);
  }

  // Events
  struct
  Listener {
    Done_cb done = &_done_impl_default;

    alias Done_cb = extern (C) void function (void* ctx, wl_callback* _this /* args: */ , uint callback_data);

    extern (C)
    static
    void
    _done_impl_default (void* ctx, wl_callback* _this /* args: */ , uint callback_data) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  alias IFACE = wl_callback_interface;
}

static const wl_message[0] wl_callback_requests = [
];
static const wl_interface*[1] wl_callback_done_event_interfaces = [null];
static const wl_message[1] wl_callback_events = [
  wl_message ("done", "u", wl_callback_done_event_interfaces.ptr),
];
extern (C) static const wl_interface wl_callback_interface = {
  "wl_callback", 1,
  wl_callback_requests.length, wl_callback_requests.ptr,
  wl_callback_events.length,   wl_callback_events.ptr,
};
// module wayland.wl_compositor;

struct
wl_compositor {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_compositor);
  @disable this(ref wl_compositor);
  }

  // Requests
  pragma (inline,true):
  auto create_surface () { return cast (wl_surface*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.create_surface, /* ret interface: */ &wl_surface_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null); }
  auto create_region () { return cast (wl_region*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.create_region, /* ret interface: */ &wl_region_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null); }

  // Opcodes
  enum
  Opcode : uint {
    create_surface = 0,
    create_region = 1,
  }

  alias IFACE = wl_compositor_interface;
}

static const wl_interface*[1] wl_compositor_create_surface_requiest_interfaces = [&wl_surface_interface];
static const wl_interface*[1] wl_compositor_create_region_requiest_interfaces = [&wl_region_interface];
static const wl_message[2] wl_compositor_requests = [
  wl_message ("create_surface", "n", wl_compositor_create_surface_requiest_interfaces.ptr),
  wl_message ("create_region", "n", wl_compositor_create_region_requiest_interfaces.ptr),
];
static const wl_message[0] wl_compositor_events = [
];
extern (C) static const wl_interface wl_compositor_interface = {
  "wl_compositor", 6,
  wl_compositor_requests.length, wl_compositor_requests.ptr,
  wl_compositor_events.length,   wl_compositor_events.ptr,
};
// module wayland.wl_shm_pool;

struct
wl_shm_pool {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_shm_pool);
  @disable this(ref wl_shm_pool);
  }

  // Requests
  pragma (inline,true):
  auto create_buffer (int offset, int width, int height, int stride, uint format) { return cast (wl_buffer*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.create_buffer, /* ret interface: */ &wl_buffer_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null,offset,width,height,stride,format); }
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }
  auto resize (int size) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.resize, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , size); }

  // Opcodes
  enum
  Opcode : uint {
    create_buffer = 0,
    destroy = 1,
    resize = 2,
  }

  alias IFACE = wl_shm_pool_interface;
}

static const wl_interface*[6] wl_shm_pool_create_buffer_requiest_interfaces = [&wl_buffer_interface,null,null,null,null,null];
static const wl_interface*[0] wl_shm_pool_destroy_requiest_interfaces = [];
static const wl_interface*[1] wl_shm_pool_resize_requiest_interfaces = [null];
static const wl_message[3] wl_shm_pool_requests = [
  wl_message ("create_buffer", "niiiiu", wl_shm_pool_create_buffer_requiest_interfaces.ptr),
  wl_message ("destroy", "", wl_shm_pool_destroy_requiest_interfaces.ptr),
  wl_message ("resize", "i", wl_shm_pool_resize_requiest_interfaces.ptr),
];
static const wl_message[0] wl_shm_pool_events = [
];
extern (C) static const wl_interface wl_shm_pool_interface = {
  "wl_shm_pool", 2,
  wl_shm_pool_requests.length, wl_shm_pool_requests.ptr,
  wl_shm_pool_events.length,   wl_shm_pool_events.ptr,
};
// module wayland.wl_shm;

struct
wl_shm {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_shm);
  @disable this(ref wl_shm);
  }

  // Requests
  pragma (inline,true):
  auto create_pool (int fd, int size) { return cast (wl_shm_pool*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.create_pool, /* ret interface: */ &wl_shm_pool_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null,fd,size); }
  auto release () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.release, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }

  // Events
  struct
  Listener {
    Format_cb format = &_format_impl_default;

    alias Format_cb = extern (C) void function (void* ctx, wl_shm* _this /* args: */ , uint format);

    extern (C)
    static
    void
    _format_impl_default (void* ctx, wl_shm* _this /* args: */ , uint format) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Error {
    invalid_format = 0,
    invalid_stride = 1,
    invalid_fd = 2,
  }
  enum
  Format {
    argb8888 = 0,
    xrgb8888 = 1,
    c8 = 0x20203843,
    rgb332 = 0x38424752,
    bgr233 = 0x38524742,
    xrgb4444 = 0x32315258,
    xbgr4444 = 0x32314258,
    rgbx4444 = 0x32315852,
    bgrx4444 = 0x32315842,
    argb4444 = 0x32315241,
    abgr4444 = 0x32314241,
    rgba4444 = 0x32314152,
    bgra4444 = 0x32314142,
    xrgb1555 = 0x35315258,
    xbgr1555 = 0x35314258,
    rgbx5551 = 0x35315852,
    bgrx5551 = 0x35315842,
    argb1555 = 0x35315241,
    abgr1555 = 0x35314241,
    rgba5551 = 0x35314152,
    bgra5551 = 0x35314142,
    rgb565 = 0x36314752,
    bgr565 = 0x36314742,
    rgb888 = 0x34324752,
    bgr888 = 0x34324742,
    xbgr8888 = 0x34324258,
    rgbx8888 = 0x34325852,
    bgrx8888 = 0x34325842,
    abgr8888 = 0x34324241,
    rgba8888 = 0x34324152,
    bgra8888 = 0x34324142,
    xrgb2101010 = 0x30335258,
    xbgr2101010 = 0x30334258,
    rgbx1010102 = 0x30335852,
    bgrx1010102 = 0x30335842,
    argb2101010 = 0x30335241,
    abgr2101010 = 0x30334241,
    rgba1010102 = 0x30334152,
    bgra1010102 = 0x30334142,
    yuyv = 0x56595559,
    yvyu = 0x55595659,
    uyvy = 0x59565955,
    vyuy = 0x59555956,
    ayuv = 0x56555941,
    nv12 = 0x3231564e,
    nv21 = 0x3132564e,
    nv16 = 0x3631564e,
    nv61 = 0x3136564e,
    yuv410 = 0x39565559,
    yvu410 = 0x39555659,
    yuv411 = 0x31315559,
    yvu411 = 0x31315659,
    yuv420 = 0x32315559,
    yvu420 = 0x32315659,
    yuv422 = 0x36315559,
    yvu422 = 0x36315659,
    yuv444 = 0x34325559,
    yvu444 = 0x34325659,
    r8 = 0x20203852,
    r16 = 0x20363152,
    rg88 = 0x38384752,
    gr88 = 0x38385247,
    rg1616 = 0x32334752,
    gr1616 = 0x32335247,
    xrgb16161616f = 0x48345258,
    xbgr16161616f = 0x48344258,
    argb16161616f = 0x48345241,
    abgr16161616f = 0x48344241,
    xyuv8888 = 0x56555958,
    vuy888 = 0x34325556,
    vuy101010 = 0x30335556,
    y210 = 0x30313259,
    y212 = 0x32313259,
    y216 = 0x36313259,
    y410 = 0x30313459,
    y412 = 0x32313459,
    y416 = 0x36313459,
    xvyu2101010 = 0x30335658,
    xvyu12_16161616 = 0x36335658,
    xvyu16161616 = 0x38345658,
    y0l0 = 0x304c3059,
    x0l0 = 0x304c3058,
    y0l2 = 0x324c3059,
    x0l2 = 0x324c3058,
    yuv420_8bit = 0x38305559,
    yuv420_10bit = 0x30315559,
    xrgb8888_a8 = 0x38415258,
    xbgr8888_a8 = 0x38414258,
    rgbx8888_a8 = 0x38415852,
    bgrx8888_a8 = 0x38415842,
    rgb888_a8 = 0x38413852,
    bgr888_a8 = 0x38413842,
    rgb565_a8 = 0x38413552,
    bgr565_a8 = 0x38413542,
    nv24 = 0x3432564e,
    nv42 = 0x3234564e,
    p210 = 0x30313250,
    p010 = 0x30313050,
    p012 = 0x32313050,
    p016 = 0x36313050,
    axbxgxrx106106106106 = 0x30314241,
    nv15 = 0x3531564e,
    q410 = 0x30313451,
    q401 = 0x31303451,
    xrgb16161616 = 0x38345258,
    xbgr16161616 = 0x38344258,
    argb16161616 = 0x38345241,
    abgr16161616 = 0x38344241,
    c1 = 0x20203143,
    c2 = 0x20203243,
    c4 = 0x20203443,
    d1 = 0x20203144,
    d2 = 0x20203244,
    d4 = 0x20203444,
    d8 = 0x20203844,
    r1 = 0x20203152,
    r2 = 0x20203252,
    r4 = 0x20203452,
    r10 = 0x20303152,
    r12 = 0x20323152,
    avuy8888 = 0x59555641,
    xvuy8888 = 0x59555658,
    p030 = 0x30333050,
  }

  // Opcodes
  enum
  Opcode : uint {
    create_pool = 0,
    release = 1,
  }

  alias IFACE = wl_shm_interface;
}

static const wl_interface*[3] wl_shm_create_pool_requiest_interfaces = [&wl_shm_pool_interface,null,null];
static const wl_interface*[0] wl_shm_release_requiest_interfaces = [];
static const wl_message[2] wl_shm_requests = [
  wl_message ("create_pool", "nhi", wl_shm_create_pool_requiest_interfaces.ptr),
  wl_message ("release", "2", wl_shm_release_requiest_interfaces.ptr),
];
static const wl_interface*[1] wl_shm_format_event_interfaces = [null];
static const wl_message[1] wl_shm_events = [
  wl_message ("format", "u", wl_shm_format_event_interfaces.ptr),
];
extern (C) static const wl_interface wl_shm_interface = {
  "wl_shm", 2,
  wl_shm_requests.length, wl_shm_requests.ptr,
  wl_shm_events.length,   wl_shm_events.ptr,
};
// module wayland.wl_buffer;

struct
wl_buffer {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_buffer);
  @disable this(ref wl_buffer);
  }

  // Requests
  pragma (inline,true):
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }

  // Events
  struct
  Listener {
    Release_cb release = &_release_impl_default;

    alias Release_cb = extern (C) void function (void* ctx, wl_buffer* _this /* args: */ );

    extern (C)
    static
    void
    _release_impl_default (void* ctx, wl_buffer* _this /* args: */ ) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Opcodes
  enum
  Opcode : uint {
    destroy = 0,
  }

  alias IFACE = wl_buffer_interface;
}

static const wl_interface*[0] wl_buffer_destroy_requiest_interfaces = [];
static const wl_message[1] wl_buffer_requests = [
  wl_message ("destroy", "", wl_buffer_destroy_requiest_interfaces.ptr),
];
static const wl_interface*[0] wl_buffer_release_event_interfaces = [];
static const wl_message[1] wl_buffer_events = [
  wl_message ("release", "", wl_buffer_release_event_interfaces.ptr),
];
extern (C) static const wl_interface wl_buffer_interface = {
  "wl_buffer", 1,
  wl_buffer_requests.length, wl_buffer_requests.ptr,
  wl_buffer_events.length,   wl_buffer_events.ptr,
};
// module wayland.wl_data_offer;

struct
wl_data_offer {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_data_offer);
  @disable this(ref wl_data_offer);
  }

  // Requests
  pragma (inline,true):
  auto accept (uint serial, const(char)* mime_type) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.accept, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , serial,mime_type); }
  auto receive (const(char)* mime_type, int fd) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.receive, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , mime_type,fd); }
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }
  auto finish () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.finish, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ ); }
  auto set_actions (uint dnd_actions, uint preferred_action) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_actions, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , dnd_actions,preferred_action); }

  // Events
  struct
  Listener {
    Offer_cb          offer          = &_offer_impl_default;
    Source_actions_cb source_actions = &_source_actions_impl_default;
    Action_cb         action         = &_action_impl_default;

    alias Offer_cb          = extern (C) void function (void* ctx, wl_data_offer* _this /* args: */ , const(char)* mime_type);
    alias Source_actions_cb = extern (C) void function (void* ctx, wl_data_offer* _this /* args: */ , uint source_actions);
    alias Action_cb         = extern (C) void function (void* ctx, wl_data_offer* _this /* args: */ , uint dnd_action);

    extern (C)
    static
    void
    _offer_impl_default (void* ctx, wl_data_offer* _this /* args: */ , const(char)* mime_type) {
        // 
    }

    extern (C)
    static
    void
    _source_actions_impl_default (void* ctx, wl_data_offer* _this /* args: */ , uint source_actions) {
        // 
    }

    extern (C)
    static
    void
    _action_impl_default (void* ctx, wl_data_offer* _this /* args: */ , uint dnd_action) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Error {
    invalid_finish = 0,
    invalid_action_mask = 1,
    invalid_action = 2,
    invalid_offer = 3,
  }

  // Opcodes
  enum
  Opcode : uint {
    accept = 0,
    receive = 1,
    destroy = 2,
    finish = 3,
    set_actions = 4,
  }

  alias IFACE = wl_data_offer_interface;
}

static const wl_interface*[2] wl_data_offer_accept_requiest_interfaces = [null,null];
static const wl_interface*[2] wl_data_offer_receive_requiest_interfaces = [null,null];
static const wl_interface*[0] wl_data_offer_destroy_requiest_interfaces = [];
static const wl_interface*[0] wl_data_offer_finish_requiest_interfaces = [];
static const wl_interface*[2] wl_data_offer_set_actions_requiest_interfaces = [null,null];
static const wl_message[5] wl_data_offer_requests = [
  wl_message ("accept", "u?s", wl_data_offer_accept_requiest_interfaces.ptr),
  wl_message ("receive", "sh", wl_data_offer_receive_requiest_interfaces.ptr),
  wl_message ("destroy", "", wl_data_offer_destroy_requiest_interfaces.ptr),
  wl_message ("finish", "3", wl_data_offer_finish_requiest_interfaces.ptr),
  wl_message ("set_actions", "3uu", wl_data_offer_set_actions_requiest_interfaces.ptr),
];
static const wl_interface*[1] wl_data_offer_offer_event_interfaces = [null];
static const wl_interface*[1] wl_data_offer_source_actions_event_interfaces = [null];
static const wl_interface*[1] wl_data_offer_action_event_interfaces = [null];
static const wl_message[3] wl_data_offer_events = [
  wl_message ("offer", "s", wl_data_offer_offer_event_interfaces.ptr),
  wl_message ("source_actions", "3u", wl_data_offer_source_actions_event_interfaces.ptr),
  wl_message ("action", "3u", wl_data_offer_action_event_interfaces.ptr),
];
extern (C) static const wl_interface wl_data_offer_interface = {
  "wl_data_offer", 3,
  wl_data_offer_requests.length, wl_data_offer_requests.ptr,
  wl_data_offer_events.length,   wl_data_offer_events.ptr,
};
// module wayland.wl_data_source;

struct
wl_data_source {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_data_source);
  @disable this(ref wl_data_source);
  }

  // Requests
  pragma (inline,true):
  auto offer (const(char)* mime_type) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.offer, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , mime_type); }
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }
  auto set_actions (uint dnd_actions) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_actions, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , dnd_actions); }

  // Events
  struct
  Listener {
    Target_cb             target             = &_target_impl_default;
    Send_cb               send               = &_send_impl_default;
    Cancelled_cb          cancelled          = &_cancelled_impl_default;
    Dnd_drop_performed_cb dnd_drop_performed = &_dnd_drop_performed_impl_default;
    Dnd_finished_cb       dnd_finished       = &_dnd_finished_impl_default;
    Action_cb             action             = &_action_impl_default;

    alias Target_cb             = extern (C) void function (void* ctx, wl_data_source* _this /* args: */ , const(char)* mime_type);
    alias Send_cb               = extern (C) void function (void* ctx, wl_data_source* _this /* args: */ , const(char)* mime_type, int fd);
    alias Cancelled_cb          = extern (C) void function (void* ctx, wl_data_source* _this /* args: */ );
    alias Dnd_drop_performed_cb = extern (C) void function (void* ctx, wl_data_source* _this /* args: */ );
    alias Dnd_finished_cb       = extern (C) void function (void* ctx, wl_data_source* _this /* args: */ );
    alias Action_cb             = extern (C) void function (void* ctx, wl_data_source* _this /* args: */ , uint dnd_action);

    extern (C)
    static
    void
    _target_impl_default (void* ctx, wl_data_source* _this /* args: */ , const(char)* mime_type) {
        // 
    }

    extern (C)
    static
    void
    _send_impl_default (void* ctx, wl_data_source* _this /* args: */ , const(char)* mime_type, int fd) {
        // 
    }

    extern (C)
    static
    void
    _cancelled_impl_default (void* ctx, wl_data_source* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _dnd_drop_performed_impl_default (void* ctx, wl_data_source* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _dnd_finished_impl_default (void* ctx, wl_data_source* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _action_impl_default (void* ctx, wl_data_source* _this /* args: */ , uint dnd_action) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Error {
    invalid_action_mask = 0,
    invalid_source = 1,
  }

  // Opcodes
  enum
  Opcode : uint {
    offer = 0,
    destroy = 1,
    set_actions = 2,
  }

  alias IFACE = wl_data_source_interface;
}

static const wl_interface*[1] wl_data_source_offer_requiest_interfaces = [null];
static const wl_interface*[0] wl_data_source_destroy_requiest_interfaces = [];
static const wl_interface*[1] wl_data_source_set_actions_requiest_interfaces = [null];
static const wl_message[3] wl_data_source_requests = [
  wl_message ("offer", "s", wl_data_source_offer_requiest_interfaces.ptr),
  wl_message ("destroy", "", wl_data_source_destroy_requiest_interfaces.ptr),
  wl_message ("set_actions", "3u", wl_data_source_set_actions_requiest_interfaces.ptr),
];
static const wl_interface*[1] wl_data_source_target_event_interfaces = [null];
static const wl_interface*[2] wl_data_source_send_event_interfaces = [null,null];
static const wl_interface*[0] wl_data_source_cancelled_event_interfaces = [];
static const wl_interface*[0] wl_data_source_dnd_drop_performed_event_interfaces = [];
static const wl_interface*[0] wl_data_source_dnd_finished_event_interfaces = [];
static const wl_interface*[1] wl_data_source_action_event_interfaces = [null];
static const wl_message[6] wl_data_source_events = [
  wl_message ("target", "?s", wl_data_source_target_event_interfaces.ptr),
  wl_message ("send", "sh", wl_data_source_send_event_interfaces.ptr),
  wl_message ("cancelled", "", wl_data_source_cancelled_event_interfaces.ptr),
  wl_message ("dnd_drop_performed", "3", wl_data_source_dnd_drop_performed_event_interfaces.ptr),
  wl_message ("dnd_finished", "3", wl_data_source_dnd_finished_event_interfaces.ptr),
  wl_message ("action", "3u", wl_data_source_action_event_interfaces.ptr),
];
extern (C) static const wl_interface wl_data_source_interface = {
  "wl_data_source", 3,
  wl_data_source_requests.length, wl_data_source_requests.ptr,
  wl_data_source_events.length,   wl_data_source_events.ptr,
};
// module wayland.wl_data_device;

struct
wl_data_device {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_data_device);
  @disable this(ref wl_data_device);
  }

  // Requests
  pragma (inline,true):
  auto start_drag (wl_data_source* source, wl_surface* origin, wl_surface* icon, uint serial) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.start_drag, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , source,origin,icon,serial); }
  auto set_selection (wl_data_source* source, uint serial) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_selection, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , source,serial); }
  auto release () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.release, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }

  // Events
  struct
  Listener {
    Data_offer_cb data_offer = &_data_offer_impl_default;
    Enter_cb      enter      = &_enter_impl_default;
    Leave_cb      leave      = &_leave_impl_default;
    Motion_cb     motion     = &_motion_impl_default;
    Drop_cb       drop       = &_drop_impl_default;
    Selection_cb  selection  = &_selection_impl_default;

    alias Data_offer_cb = extern (C) void function (void* ctx, wl_data_device* _this /* args: */ , wl_data_offer id);
    alias Enter_cb      = extern (C) void function (void* ctx, wl_data_device* _this /* args: */ , uint serial, wl_surface* surface, wl_fixed_t x, wl_fixed_t y, wl_data_offer* id);
    alias Leave_cb      = extern (C) void function (void* ctx, wl_data_device* _this /* args: */ );
    alias Motion_cb     = extern (C) void function (void* ctx, wl_data_device* _this /* args: */ , uint time, wl_fixed_t x, wl_fixed_t y);
    alias Drop_cb       = extern (C) void function (void* ctx, wl_data_device* _this /* args: */ );
    alias Selection_cb  = extern (C) void function (void* ctx, wl_data_device* _this /* args: */ , wl_data_offer* id);

    extern (C)
    static
    void
    _data_offer_impl_default (void* ctx, wl_data_device* _this /* args: */ , wl_data_offer id) {
        // 
    }

    extern (C)
    static
    void
    _enter_impl_default (void* ctx, wl_data_device* _this /* args: */ , uint serial, wl_surface* surface, wl_fixed_t x, wl_fixed_t y, wl_data_offer* id) {
        // 
    }

    extern (C)
    static
    void
    _leave_impl_default (void* ctx, wl_data_device* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _motion_impl_default (void* ctx, wl_data_device* _this /* args: */ , uint time, wl_fixed_t x, wl_fixed_t y) {
        // 
    }

    extern (C)
    static
    void
    _drop_impl_default (void* ctx, wl_data_device* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _selection_impl_default (void* ctx, wl_data_device* _this /* args: */ , wl_data_offer* id) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Error {
    role = 0,
    used_source = 1,
  }

  // Opcodes
  enum
  Opcode : uint {
    start_drag = 0,
    set_selection = 1,
    release = 2,
  }

  alias IFACE = wl_data_device_interface;
}

static const wl_interface*[4] wl_data_device_start_drag_requiest_interfaces = [&wl_data_source_interface,&wl_surface_interface,&wl_surface_interface,null];
static const wl_interface*[2] wl_data_device_set_selection_requiest_interfaces = [&wl_data_source_interface,null];
static const wl_interface*[0] wl_data_device_release_requiest_interfaces = [];
static const wl_message[3] wl_data_device_requests = [
  wl_message ("start_drag", "?oo?ou", wl_data_device_start_drag_requiest_interfaces.ptr),
  wl_message ("set_selection", "?ou", wl_data_device_set_selection_requiest_interfaces.ptr),
  wl_message ("release", "2", wl_data_device_release_requiest_interfaces.ptr),
];
static const wl_interface*[1] wl_data_device_data_offer_event_interfaces = [&wl_data_offer_interface];
static const wl_interface*[5] wl_data_device_enter_event_interfaces = [null,&wl_surface_interface,null,null,&wl_data_offer_interface];
static const wl_interface*[0] wl_data_device_leave_event_interfaces = [];
static const wl_interface*[3] wl_data_device_motion_event_interfaces = [null,null,null];
static const wl_interface*[0] wl_data_device_drop_event_interfaces = [];
static const wl_interface*[1] wl_data_device_selection_event_interfaces = [&wl_data_offer_interface];
static const wl_message[6] wl_data_device_events = [
  wl_message ("data_offer", "n", wl_data_device_data_offer_event_interfaces.ptr),
  wl_message ("enter", "uoff?o", wl_data_device_enter_event_interfaces.ptr),
  wl_message ("leave", "", wl_data_device_leave_event_interfaces.ptr),
  wl_message ("motion", "uff", wl_data_device_motion_event_interfaces.ptr),
  wl_message ("drop", "", wl_data_device_drop_event_interfaces.ptr),
  wl_message ("selection", "?o", wl_data_device_selection_event_interfaces.ptr),
];
extern (C) static const wl_interface wl_data_device_interface = {
  "wl_data_device", 3,
  wl_data_device_requests.length, wl_data_device_requests.ptr,
  wl_data_device_events.length,   wl_data_device_events.ptr,
};
// module wayland.wl_data_device_manager;

struct
wl_data_device_manager {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_data_device_manager);
  @disable this(ref wl_data_device_manager);
  }

  // Requests
  pragma (inline,true):
  auto create_data_source () { return cast (wl_data_source*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.create_data_source, /* ret interface: */ &wl_data_source_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null); }
  auto get_data_device (wl_seat* seat) { return cast (wl_data_device*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.get_data_device, /* ret interface: */ &wl_data_device_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null,seat); }

  // Enums
  enum
  Dnd_action {
    none = 0,
    copy = 1,
    move = 2,
    ask = 4,
  }

  // Opcodes
  enum
  Opcode : uint {
    create_data_source = 0,
    get_data_device = 1,
  }

  alias IFACE = wl_data_device_manager_interface;
}

static const wl_interface*[1] wl_data_device_manager_create_data_source_requiest_interfaces = [&wl_data_source_interface];
static const wl_interface*[2] wl_data_device_manager_get_data_device_requiest_interfaces = [&wl_data_device_interface,&wl_seat_interface];
static const wl_message[2] wl_data_device_manager_requests = [
  wl_message ("create_data_source", "n", wl_data_device_manager_create_data_source_requiest_interfaces.ptr),
  wl_message ("get_data_device", "no", wl_data_device_manager_get_data_device_requiest_interfaces.ptr),
];
static const wl_message[0] wl_data_device_manager_events = [
];
extern (C) static const wl_interface wl_data_device_manager_interface = {
  "wl_data_device_manager", 3,
  wl_data_device_manager_requests.length, wl_data_device_manager_requests.ptr,
  wl_data_device_manager_events.length,   wl_data_device_manager_events.ptr,
};
// module wayland.wl_shell;

struct
wl_shell {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_shell);
  @disable this(ref wl_shell);
  }

  // Requests
  pragma (inline,true):
  auto get_shell_surface (wl_surface* surface) { return cast (wl_shell_surface*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.get_shell_surface, /* ret interface: */ &wl_shell_surface_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null,surface); }

  // Enums
  enum
  Error {
    role = 0,
  }

  // Opcodes
  enum
  Opcode : uint {
    get_shell_surface = 0,
  }

  alias IFACE = wl_shell_interface;
}

static const wl_interface*[2] wl_shell_get_shell_surface_requiest_interfaces = [&wl_shell_surface_interface,&wl_surface_interface];
static const wl_message[1] wl_shell_requests = [
  wl_message ("get_shell_surface", "no", wl_shell_get_shell_surface_requiest_interfaces.ptr),
];
static const wl_message[0] wl_shell_events = [
];
extern (C) static const wl_interface wl_shell_interface = {
  "wl_shell", 1,
  wl_shell_requests.length, wl_shell_requests.ptr,
  wl_shell_events.length,   wl_shell_events.ptr,
};
// module wayland.wl_shell_surface;

struct
wl_shell_surface {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_shell_surface);
  @disable this(ref wl_shell_surface);
  }

  // Requests
  pragma (inline,true):
  auto pong (uint serial) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.pong, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , serial); }
  auto move (wl_seat* seat, uint serial) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.move, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , seat,serial); }
  auto resize (wl_seat* seat, uint serial, uint edges) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.resize, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , seat,serial,edges); }
  auto set_toplevel () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_toplevel, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ ); }
  auto set_transient (wl_surface* parent, int x, int y, uint flags) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_transient, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , parent,x,y,flags); }
  auto set_fullscreen (uint method, uint framerate, wl_output* output) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_fullscreen, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , method,framerate,output); }
  auto set_popup (wl_seat* seat, uint serial, wl_surface* parent, int x, int y, uint flags) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_popup, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , seat,serial,parent,x,y,flags); }
  auto set_maximized (wl_output* output) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_maximized, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , output); }
  auto set_title (const(char)* title) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_title, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , title); }
  auto set_class (const(char)* class_) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_class, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , class_); }

  // Events
  struct
  Listener {
    Ping_cb       ping       = &_ping_impl_default;
    Configure_cb  configure  = &_configure_impl_default;
    Popup_done_cb popup_done = &_popup_done_impl_default;

    alias Ping_cb       = extern (C) void function (void* ctx, wl_shell_surface* _this /* args: */ , uint serial);
    alias Configure_cb  = extern (C) void function (void* ctx, wl_shell_surface* _this /* args: */ , uint edges, int width, int height);
    alias Popup_done_cb = extern (C) void function (void* ctx, wl_shell_surface* _this /* args: */ );

    extern (C)
    static
    void
    _ping_impl_default (void* ctx, wl_shell_surface* _this /* args: */ , uint serial) {
        // 
    }

    extern (C)
    static
    void
    _configure_impl_default (void* ctx, wl_shell_surface* _this /* args: */ , uint edges, int width, int height) {
        // 
    }

    extern (C)
    static
    void
    _popup_done_impl_default (void* ctx, wl_shell_surface* _this /* args: */ ) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Resize {
    none = 0,
    top = 1,
    bottom = 2,
    left = 4,
    top_left = 5,
    bottom_left = 6,
    right = 8,
    top_right = 9,
    bottom_right = 10,
  }
  enum
  Transient {
    inactive = 0x1,
  }
  enum
  Fullscreen_method {
    default_ = 0,
    scale = 1,
    driver = 2,
    fill = 3,
  }

  // Opcodes
  enum
  Opcode : uint {
    pong = 0,
    move = 1,
    resize = 2,
    set_toplevel = 3,
    set_transient = 4,
    set_fullscreen = 5,
    set_popup = 6,
    set_maximized = 7,
    set_title = 8,
    set_class = 9,
  }

  alias IFACE = wl_shell_surface_interface;
}

static const wl_interface*[1] wl_shell_surface_pong_requiest_interfaces = [null];
static const wl_interface*[2] wl_shell_surface_move_requiest_interfaces = [&wl_seat_interface,null];
static const wl_interface*[3] wl_shell_surface_resize_requiest_interfaces = [&wl_seat_interface,null,null];
static const wl_interface*[0] wl_shell_surface_set_toplevel_requiest_interfaces = [];
static const wl_interface*[4] wl_shell_surface_set_transient_requiest_interfaces = [&wl_surface_interface,null,null,null];
static const wl_interface*[3] wl_shell_surface_set_fullscreen_requiest_interfaces = [null,null,&wl_output_interface];
static const wl_interface*[6] wl_shell_surface_set_popup_requiest_interfaces = [&wl_seat_interface,null,&wl_surface_interface,null,null,null];
static const wl_interface*[1] wl_shell_surface_set_maximized_requiest_interfaces = [&wl_output_interface];
static const wl_interface*[1] wl_shell_surface_set_title_requiest_interfaces = [null];
static const wl_interface*[1] wl_shell_surface_set_class_requiest_interfaces = [null];
static const wl_message[10] wl_shell_surface_requests = [
  wl_message ("pong", "u", wl_shell_surface_pong_requiest_interfaces.ptr),
  wl_message ("move", "ou", wl_shell_surface_move_requiest_interfaces.ptr),
  wl_message ("resize", "ouu", wl_shell_surface_resize_requiest_interfaces.ptr),
  wl_message ("set_toplevel", "", wl_shell_surface_set_toplevel_requiest_interfaces.ptr),
  wl_message ("set_transient", "oiiu", wl_shell_surface_set_transient_requiest_interfaces.ptr),
  wl_message ("set_fullscreen", "uu?o", wl_shell_surface_set_fullscreen_requiest_interfaces.ptr),
  wl_message ("set_popup", "ouoiiu", wl_shell_surface_set_popup_requiest_interfaces.ptr),
  wl_message ("set_maximized", "?o", wl_shell_surface_set_maximized_requiest_interfaces.ptr),
  wl_message ("set_title", "s", wl_shell_surface_set_title_requiest_interfaces.ptr),
  wl_message ("set_class", "s", wl_shell_surface_set_class_requiest_interfaces.ptr),
];
static const wl_interface*[1] wl_shell_surface_ping_event_interfaces = [null];
static const wl_interface*[3] wl_shell_surface_configure_event_interfaces = [null,null,null];
static const wl_interface*[0] wl_shell_surface_popup_done_event_interfaces = [];
static const wl_message[3] wl_shell_surface_events = [
  wl_message ("ping", "u", wl_shell_surface_ping_event_interfaces.ptr),
  wl_message ("configure", "uii", wl_shell_surface_configure_event_interfaces.ptr),
  wl_message ("popup_done", "", wl_shell_surface_popup_done_event_interfaces.ptr),
];
extern (C) static const wl_interface wl_shell_surface_interface = {
  "wl_shell_surface", 1,
  wl_shell_surface_requests.length, wl_shell_surface_requests.ptr,
  wl_shell_surface_events.length,   wl_shell_surface_events.ptr,
};
// module wayland.wl_surface;

struct
wl_surface {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_surface);
  @disable this(ref wl_surface);
  }

  // Requests
  pragma (inline,true):
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }
  auto attach (wl_buffer* buffer, int x, int y) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.attach, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , buffer,x,y); }
  auto damage (int x, int y, int width, int height) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.damage, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , x,y,width,height); }
  auto frame () { return cast (wl_callback*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.frame, /* ret interface: */ &wl_callback_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null); }
  auto set_opaque_region (wl_region* region) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_opaque_region, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , region); }
  auto set_input_region (wl_region* region) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_input_region, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , region); }
  auto commit () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.commit, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ ); }
  auto set_buffer_transform (int transform) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_buffer_transform, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , transform); }
  auto set_buffer_scale (int scale) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_buffer_scale, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , scale); }
  auto damage_buffer (int x, int y, int width, int height) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.damage_buffer, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , x,y,width,height); }
  auto offset (int x, int y) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.offset, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , x,y); }

  // Events
  struct
  Listener {
    Enter_cb                      enter                      = &_enter_impl_default;
    Leave_cb                      leave                      = &_leave_impl_default;
    Preferred_buffer_scale_cb     preferred_buffer_scale     = &_preferred_buffer_scale_impl_default;
    Preferred_buffer_transform_cb preferred_buffer_transform = &_preferred_buffer_transform_impl_default;

    alias Enter_cb                      = extern (C) void function (void* ctx, wl_surface* _this /* args: */ , wl_output* output);
    alias Leave_cb                      = extern (C) void function (void* ctx, wl_surface* _this /* args: */ , wl_output* output);
    alias Preferred_buffer_scale_cb     = extern (C) void function (void* ctx, wl_surface* _this /* args: */ , int factor);
    alias Preferred_buffer_transform_cb = extern (C) void function (void* ctx, wl_surface* _this /* args: */ , uint transform);

    extern (C)
    static
    void
    _enter_impl_default (void* ctx, wl_surface* _this /* args: */ , wl_output* output) {
        // 
    }

    extern (C)
    static
    void
    _leave_impl_default (void* ctx, wl_surface* _this /* args: */ , wl_output* output) {
        // 
    }

    extern (C)
    static
    void
    _preferred_buffer_scale_impl_default (void* ctx, wl_surface* _this /* args: */ , int factor) {
        // 
    }

    extern (C)
    static
    void
    _preferred_buffer_transform_impl_default (void* ctx, wl_surface* _this /* args: */ , uint transform) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Error {
    invalid_scale = 0,
    invalid_transform = 1,
    invalid_size = 2,
    invalid_offset = 3,
    defunct_role_object = 4,
  }

  // Opcodes
  enum
  Opcode : uint {
    destroy = 0,
    attach = 1,
    damage = 2,
    frame = 3,
    set_opaque_region = 4,
    set_input_region = 5,
    commit = 6,
    set_buffer_transform = 7,
    set_buffer_scale = 8,
    damage_buffer = 9,
    offset = 10,
  }

  alias IFACE = wl_surface_interface;
}

static const wl_interface*[0] wl_surface_destroy_requiest_interfaces = [];
static const wl_interface*[3] wl_surface_attach_requiest_interfaces = [&wl_buffer_interface,null,null];
static const wl_interface*[4] wl_surface_damage_requiest_interfaces = [null,null,null,null];
static const wl_interface*[1] wl_surface_frame_requiest_interfaces = [&wl_callback_interface];
static const wl_interface*[1] wl_surface_set_opaque_region_requiest_interfaces = [&wl_region_interface];
static const wl_interface*[1] wl_surface_set_input_region_requiest_interfaces = [&wl_region_interface];
static const wl_interface*[0] wl_surface_commit_requiest_interfaces = [];
static const wl_interface*[1] wl_surface_set_buffer_transform_requiest_interfaces = [null];
static const wl_interface*[1] wl_surface_set_buffer_scale_requiest_interfaces = [null];
static const wl_interface*[4] wl_surface_damage_buffer_requiest_interfaces = [null,null,null,null];
static const wl_interface*[2] wl_surface_offset_requiest_interfaces = [null,null];
static const wl_message[11] wl_surface_requests = [
  wl_message ("destroy", "", wl_surface_destroy_requiest_interfaces.ptr),
  wl_message ("attach", "?oii", wl_surface_attach_requiest_interfaces.ptr),
  wl_message ("damage", "iiii", wl_surface_damage_requiest_interfaces.ptr),
  wl_message ("frame", "n", wl_surface_frame_requiest_interfaces.ptr),
  wl_message ("set_opaque_region", "?o", wl_surface_set_opaque_region_requiest_interfaces.ptr),
  wl_message ("set_input_region", "?o", wl_surface_set_input_region_requiest_interfaces.ptr),
  wl_message ("commit", "", wl_surface_commit_requiest_interfaces.ptr),
  wl_message ("set_buffer_transform", "2i", wl_surface_set_buffer_transform_requiest_interfaces.ptr),
  wl_message ("set_buffer_scale", "3i", wl_surface_set_buffer_scale_requiest_interfaces.ptr),
  wl_message ("damage_buffer", "4iiii", wl_surface_damage_buffer_requiest_interfaces.ptr),
  wl_message ("offset", "5ii", wl_surface_offset_requiest_interfaces.ptr),
];
static const wl_interface*[1] wl_surface_enter_event_interfaces = [&wl_output_interface];
static const wl_interface*[1] wl_surface_leave_event_interfaces = [&wl_output_interface];
static const wl_interface*[1] wl_surface_preferred_buffer_scale_event_interfaces = [null];
static const wl_interface*[1] wl_surface_preferred_buffer_transform_event_interfaces = [null];
static const wl_message[4] wl_surface_events = [
  wl_message ("enter", "o", wl_surface_enter_event_interfaces.ptr),
  wl_message ("leave", "o", wl_surface_leave_event_interfaces.ptr),
  wl_message ("preferred_buffer_scale", "6i", wl_surface_preferred_buffer_scale_event_interfaces.ptr),
  wl_message ("preferred_buffer_transform", "6u", wl_surface_preferred_buffer_transform_event_interfaces.ptr),
];
extern (C) static const wl_interface wl_surface_interface = {
  "wl_surface", 6,
  wl_surface_requests.length, wl_surface_requests.ptr,
  wl_surface_events.length,   wl_surface_events.ptr,
};
// module wayland.wl_seat;

struct
wl_seat {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_seat);
  @disable this(ref wl_seat);
  }

  // Requests
  pragma (inline,true):
  auto get_pointer () { return cast (wl_pointer*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.get_pointer, /* ret interface: */ &wl_pointer_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null); }
  auto get_keyboard () { return cast (wl_keyboard*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.get_keyboard, /* ret interface: */ &wl_keyboard_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null); }
  auto get_touch () { return cast (wl_touch*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.get_touch, /* ret interface: */ &wl_touch_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null); }
  auto release () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.release, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }

  // Events
  struct
  Listener {
    Capabilities_cb capabilities = &_capabilities_impl_default;
    Name_cb         name         = &_name_impl_default;

    alias Capabilities_cb = extern (C) void function (void* ctx, wl_seat* _this /* args: */ , uint capabilities);
    alias Name_cb         = extern (C) void function (void* ctx, wl_seat* _this /* args: */ , const(char)* name);

    extern (C)
    static
    void
    _capabilities_impl_default (void* ctx, wl_seat* _this /* args: */ , uint capabilities) {
        // 
    }

    extern (C)
    static
    void
    _name_impl_default (void* ctx, wl_seat* _this /* args: */ , const(char)* name) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Capability {
    pointer = 1,
    keyboard = 2,
    touch = 4,
  }
  enum
  Error {
    missing_capability = 0,
  }

  // Opcodes
  enum
  Opcode : uint {
    get_pointer = 0,
    get_keyboard = 1,
    get_touch = 2,
    release = 3,
  }

  alias IFACE = wl_seat_interface;
}

static const wl_interface*[1] wl_seat_get_pointer_requiest_interfaces = [&wl_pointer_interface];
static const wl_interface*[1] wl_seat_get_keyboard_requiest_interfaces = [&wl_keyboard_interface];
static const wl_interface*[1] wl_seat_get_touch_requiest_interfaces = [&wl_touch_interface];
static const wl_interface*[0] wl_seat_release_requiest_interfaces = [];
static const wl_message[4] wl_seat_requests = [
  wl_message ("get_pointer", "n", wl_seat_get_pointer_requiest_interfaces.ptr),
  wl_message ("get_keyboard", "n", wl_seat_get_keyboard_requiest_interfaces.ptr),
  wl_message ("get_touch", "n", wl_seat_get_touch_requiest_interfaces.ptr),
  wl_message ("release", "5", wl_seat_release_requiest_interfaces.ptr),
];
static const wl_interface*[1] wl_seat_capabilities_event_interfaces = [null];
static const wl_interface*[1] wl_seat_name_event_interfaces = [null];
static const wl_message[2] wl_seat_events = [
  wl_message ("capabilities", "u", wl_seat_capabilities_event_interfaces.ptr),
  wl_message ("name", "2s", wl_seat_name_event_interfaces.ptr),
];
extern (C) static const wl_interface wl_seat_interface = {
  "wl_seat", 9,
  wl_seat_requests.length, wl_seat_requests.ptr,
  wl_seat_events.length,   wl_seat_events.ptr,
};
// module wayland.wl_pointer;

struct
wl_pointer {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_pointer);
  @disable this(ref wl_pointer);
  }

  // Requests
  pragma (inline,true):
  auto set_cursor (uint serial, wl_surface* surface, int hotspot_x, int hotspot_y) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_cursor, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , serial,surface,hotspot_x,hotspot_y); }
  auto release () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.release, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }

  // Events
  struct
  Listener {
    Enter_cb                   enter                   = &_enter_impl_default;
    Leave_cb                   leave                   = &_leave_impl_default;
    Motion_cb                  motion                  = &_motion_impl_default;
    Button_cb                  button                  = &_button_impl_default;
    Axis_cb                    axis                    = &_axis_impl_default;
    Frame_cb                   frame                   = &_frame_impl_default;
    Axis_source_cb             axis_source             = &_axis_source_impl_default;
    Axis_stop_cb               axis_stop               = &_axis_stop_impl_default;
    Axis_discrete_cb           axis_discrete           = &_axis_discrete_impl_default;
    Axis_value120_cb           axis_value120           = &_axis_value120_impl_default;
    Axis_relative_direction_cb axis_relative_direction = &_axis_relative_direction_impl_default;

    alias Enter_cb                   = extern (C) void function (void* ctx, wl_pointer* _this /* args: */ , uint serial, wl_surface* surface, wl_fixed_t surface_x, wl_fixed_t surface_y);
    alias Leave_cb                   = extern (C) void function (void* ctx, wl_pointer* _this /* args: */ , uint serial, wl_surface* surface);
    alias Motion_cb                  = extern (C) void function (void* ctx, wl_pointer* _this /* args: */ , uint time, wl_fixed_t surface_x, wl_fixed_t surface_y);
    alias Button_cb                  = extern (C) void function (void* ctx, wl_pointer* _this /* args: */ , uint serial, uint time, uint button, uint state);
    alias Axis_cb                    = extern (C) void function (void* ctx, wl_pointer* _this /* args: */ , uint time, uint axis, wl_fixed_t value);
    alias Frame_cb                   = extern (C) void function (void* ctx, wl_pointer* _this /* args: */ );
    alias Axis_source_cb             = extern (C) void function (void* ctx, wl_pointer* _this /* args: */ , uint axis_source);
    alias Axis_stop_cb               = extern (C) void function (void* ctx, wl_pointer* _this /* args: */ , uint time, uint axis);
    alias Axis_discrete_cb           = extern (C) void function (void* ctx, wl_pointer* _this /* args: */ , uint axis, int discrete);
    alias Axis_value120_cb           = extern (C) void function (void* ctx, wl_pointer* _this /* args: */ , uint axis, int value120);
    alias Axis_relative_direction_cb = extern (C) void function (void* ctx, wl_pointer* _this /* args: */ , uint axis, uint direction);

    extern (C)
    static
    void
    _enter_impl_default (void* ctx, wl_pointer* _this /* args: */ , uint serial, wl_surface* surface, wl_fixed_t surface_x, wl_fixed_t surface_y) {
        // 
    }

    extern (C)
    static
    void
    _leave_impl_default (void* ctx, wl_pointer* _this /* args: */ , uint serial, wl_surface* surface) {
        // 
    }

    extern (C)
    static
    void
    _motion_impl_default (void* ctx, wl_pointer* _this /* args: */ , uint time, wl_fixed_t surface_x, wl_fixed_t surface_y) {
        // 
    }

    extern (C)
    static
    void
    _button_impl_default (void* ctx, wl_pointer* _this /* args: */ , uint serial, uint time, uint button, uint state) {
        // 
    }

    extern (C)
    static
    void
    _axis_impl_default (void* ctx, wl_pointer* _this /* args: */ , uint time, uint axis, wl_fixed_t value) {
        // 
    }

    extern (C)
    static
    void
    _frame_impl_default (void* ctx, wl_pointer* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _axis_source_impl_default (void* ctx, wl_pointer* _this /* args: */ , uint axis_source) {
        // 
    }

    extern (C)
    static
    void
    _axis_stop_impl_default (void* ctx, wl_pointer* _this /* args: */ , uint time, uint axis) {
        // 
    }

    extern (C)
    static
    void
    _axis_discrete_impl_default (void* ctx, wl_pointer* _this /* args: */ , uint axis, int discrete) {
        // 
    }

    extern (C)
    static
    void
    _axis_value120_impl_default (void* ctx, wl_pointer* _this /* args: */ , uint axis, int value120) {
        // 
    }

    extern (C)
    static
    void
    _axis_relative_direction_impl_default (void* ctx, wl_pointer* _this /* args: */ , uint axis, uint direction) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Error {
    role = 0,
  }
  enum
  Button_state {
    released = 0,
    pressed = 1,
  }
  enum
  Axis {
    vertical_scroll = 0,
    horizontal_scroll = 1,
  }
  enum
  Axis_source {
    wheel = 0,
    finger = 1,
    continuous = 2,
    wheel_tilt = 3,
  }
  enum
  Axis_relative_direction {
    identical = 0,
    inverted = 1,
  }

  // Opcodes
  enum
  Opcode : uint {
    set_cursor = 0,
    release = 1,
  }

  alias IFACE = wl_pointer_interface;
}

static const wl_interface*[4] wl_pointer_set_cursor_requiest_interfaces = [null,&wl_surface_interface,null,null];
static const wl_interface*[0] wl_pointer_release_requiest_interfaces = [];
static const wl_message[2] wl_pointer_requests = [
  wl_message ("set_cursor", "u?oii", wl_pointer_set_cursor_requiest_interfaces.ptr),
  wl_message ("release", "3", wl_pointer_release_requiest_interfaces.ptr),
];
static const wl_interface*[4] wl_pointer_enter_event_interfaces = [null,&wl_surface_interface,null,null];
static const wl_interface*[2] wl_pointer_leave_event_interfaces = [null,&wl_surface_interface];
static const wl_interface*[3] wl_pointer_motion_event_interfaces = [null,null,null];
static const wl_interface*[4] wl_pointer_button_event_interfaces = [null,null,null,null];
static const wl_interface*[3] wl_pointer_axis_event_interfaces = [null,null,null];
static const wl_interface*[0] wl_pointer_frame_event_interfaces = [];
static const wl_interface*[1] wl_pointer_axis_source_event_interfaces = [null];
static const wl_interface*[2] wl_pointer_axis_stop_event_interfaces = [null,null];
static const wl_interface*[2] wl_pointer_axis_discrete_event_interfaces = [null,null];
static const wl_interface*[2] wl_pointer_axis_value120_event_interfaces = [null,null];
static const wl_interface*[2] wl_pointer_axis_relative_direction_event_interfaces = [null,null];
static const wl_message[11] wl_pointer_events = [
  wl_message ("enter", "uoff", wl_pointer_enter_event_interfaces.ptr),
  wl_message ("leave", "uo", wl_pointer_leave_event_interfaces.ptr),
  wl_message ("motion", "uff", wl_pointer_motion_event_interfaces.ptr),
  wl_message ("button", "uuuu", wl_pointer_button_event_interfaces.ptr),
  wl_message ("axis", "uuf", wl_pointer_axis_event_interfaces.ptr),
  wl_message ("frame", "5", wl_pointer_frame_event_interfaces.ptr),
  wl_message ("axis_source", "5u", wl_pointer_axis_source_event_interfaces.ptr),
  wl_message ("axis_stop", "5uu", wl_pointer_axis_stop_event_interfaces.ptr),
  wl_message ("axis_discrete", "5ui", wl_pointer_axis_discrete_event_interfaces.ptr),
  wl_message ("axis_value120", "8ui", wl_pointer_axis_value120_event_interfaces.ptr),
  wl_message ("axis_relative_direction", "9uu", wl_pointer_axis_relative_direction_event_interfaces.ptr),
];
extern (C) static const wl_interface wl_pointer_interface = {
  "wl_pointer", 9,
  wl_pointer_requests.length, wl_pointer_requests.ptr,
  wl_pointer_events.length,   wl_pointer_events.ptr,
};
// module wayland.wl_keyboard;

struct
wl_keyboard {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_keyboard);
  @disable this(ref wl_keyboard);
  }

  // Requests
  pragma (inline,true):
  auto release () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.release, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }

  // Events
  struct
  Listener {
    Keymap_cb      keymap      = &_keymap_impl_default;
    Enter_cb       enter       = &_enter_impl_default;
    Leave_cb       leave       = &_leave_impl_default;
    Key_cb         key         = &_key_impl_default;
    Modifiers_cb   modifiers   = &_modifiers_impl_default;
    Repeat_info_cb repeat_info = &_repeat_info_impl_default;

    alias Keymap_cb      = extern (C) void function (void* ctx, wl_keyboard* _this /* args: */ , uint format, int fd, uint size);
    alias Enter_cb       = extern (C) void function (void* ctx, wl_keyboard* _this /* args: */ , uint serial, wl_surface* surface, wl_array* keys);
    alias Leave_cb       = extern (C) void function (void* ctx, wl_keyboard* _this /* args: */ , uint serial, wl_surface* surface);
    alias Key_cb         = extern (C) void function (void* ctx, wl_keyboard* _this /* args: */ , uint serial, uint time, uint key, uint state);
    alias Modifiers_cb   = extern (C) void function (void* ctx, wl_keyboard* _this /* args: */ , uint serial, uint mods_depressed, uint mods_latched, uint mods_locked, uint group);
    alias Repeat_info_cb = extern (C) void function (void* ctx, wl_keyboard* _this /* args: */ , int rate, int delay);

    extern (C)
    static
    void
    _keymap_impl_default (void* ctx, wl_keyboard* _this /* args: */ , uint format, int fd, uint size) {
        // 
    }

    extern (C)
    static
    void
    _enter_impl_default (void* ctx, wl_keyboard* _this /* args: */ , uint serial, wl_surface* surface, wl_array* keys) {
        // 
    }

    extern (C)
    static
    void
    _leave_impl_default (void* ctx, wl_keyboard* _this /* args: */ , uint serial, wl_surface* surface) {
        // 
    }

    extern (C)
    static
    void
    _key_impl_default (void* ctx, wl_keyboard* _this /* args: */ , uint serial, uint time, uint key, uint state) {
        // 
    }

    extern (C)
    static
    void
    _modifiers_impl_default (void* ctx, wl_keyboard* _this /* args: */ , uint serial, uint mods_depressed, uint mods_latched, uint mods_locked, uint group) {
        // 
    }

    extern (C)
    static
    void
    _repeat_info_impl_default (void* ctx, wl_keyboard* _this /* args: */ , int rate, int delay) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Keymap_format {
    no_keymap = 0,
    xkb_v1 = 1,
  }
  enum
  Key_state {
    released = 0,
    pressed = 1,
  }

  // Opcodes
  enum
  Opcode : uint {
    release = 0,
  }

  alias IFACE = wl_keyboard_interface;
}

static const wl_interface*[0] wl_keyboard_release_requiest_interfaces = [];
static const wl_message[1] wl_keyboard_requests = [
  wl_message ("release", "3", wl_keyboard_release_requiest_interfaces.ptr),
];
static const wl_interface*[3] wl_keyboard_keymap_event_interfaces = [null,null,null];
static const wl_interface*[3] wl_keyboard_enter_event_interfaces = [null,&wl_surface_interface,null];
static const wl_interface*[2] wl_keyboard_leave_event_interfaces = [null,&wl_surface_interface];
static const wl_interface*[4] wl_keyboard_key_event_interfaces = [null,null,null,null];
static const wl_interface*[5] wl_keyboard_modifiers_event_interfaces = [null,null,null,null,null];
static const wl_interface*[2] wl_keyboard_repeat_info_event_interfaces = [null,null];
static const wl_message[6] wl_keyboard_events = [
  wl_message ("keymap", "uhu", wl_keyboard_keymap_event_interfaces.ptr),
  wl_message ("enter", "uoa", wl_keyboard_enter_event_interfaces.ptr),
  wl_message ("leave", "uo", wl_keyboard_leave_event_interfaces.ptr),
  wl_message ("key", "uuuu", wl_keyboard_key_event_interfaces.ptr),
  wl_message ("modifiers", "uuuuu", wl_keyboard_modifiers_event_interfaces.ptr),
  wl_message ("repeat_info", "4ii", wl_keyboard_repeat_info_event_interfaces.ptr),
];
extern (C) static const wl_interface wl_keyboard_interface = {
  "wl_keyboard", 9,
  wl_keyboard_requests.length, wl_keyboard_requests.ptr,
  wl_keyboard_events.length,   wl_keyboard_events.ptr,
};
// module wayland.wl_touch;

struct
wl_touch {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_touch);
  @disable this(ref wl_touch);
  }

  // Requests
  pragma (inline,true):
  auto release () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.release, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }

  // Events
  struct
  Listener {
    Down_cb        down        = &_down_impl_default;
    Up_cb          up          = &_up_impl_default;
    Motion_cb      motion      = &_motion_impl_default;
    Frame_cb       frame       = &_frame_impl_default;
    Cancel_cb      cancel      = &_cancel_impl_default;
    Shape_cb       shape       = &_shape_impl_default;
    Orientation_cb orientation = &_orientation_impl_default;

    alias Down_cb        = extern (C) void function (void* ctx, wl_touch* _this /* args: */ , uint serial, uint time, wl_surface* surface, int id, wl_fixed_t x, wl_fixed_t y);
    alias Up_cb          = extern (C) void function (void* ctx, wl_touch* _this /* args: */ , uint serial, uint time, int id);
    alias Motion_cb      = extern (C) void function (void* ctx, wl_touch* _this /* args: */ , uint time, int id, wl_fixed_t x, wl_fixed_t y);
    alias Frame_cb       = extern (C) void function (void* ctx, wl_touch* _this /* args: */ );
    alias Cancel_cb      = extern (C) void function (void* ctx, wl_touch* _this /* args: */ );
    alias Shape_cb       = extern (C) void function (void* ctx, wl_touch* _this /* args: */ , int id, wl_fixed_t major, wl_fixed_t minor);
    alias Orientation_cb = extern (C) void function (void* ctx, wl_touch* _this /* args: */ , int id, wl_fixed_t orientation);

    extern (C)
    static
    void
    _down_impl_default (void* ctx, wl_touch* _this /* args: */ , uint serial, uint time, wl_surface* surface, int id, wl_fixed_t x, wl_fixed_t y) {
        // 
    }

    extern (C)
    static
    void
    _up_impl_default (void* ctx, wl_touch* _this /* args: */ , uint serial, uint time, int id) {
        // 
    }

    extern (C)
    static
    void
    _motion_impl_default (void* ctx, wl_touch* _this /* args: */ , uint time, int id, wl_fixed_t x, wl_fixed_t y) {
        // 
    }

    extern (C)
    static
    void
    _frame_impl_default (void* ctx, wl_touch* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _cancel_impl_default (void* ctx, wl_touch* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _shape_impl_default (void* ctx, wl_touch* _this /* args: */ , int id, wl_fixed_t major, wl_fixed_t minor) {
        // 
    }

    extern (C)
    static
    void
    _orientation_impl_default (void* ctx, wl_touch* _this /* args: */ , int id, wl_fixed_t orientation) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Opcodes
  enum
  Opcode : uint {
    release = 0,
  }

  alias IFACE = wl_touch_interface;
}

static const wl_interface*[0] wl_touch_release_requiest_interfaces = [];
static const wl_message[1] wl_touch_requests = [
  wl_message ("release", "3", wl_touch_release_requiest_interfaces.ptr),
];
static const wl_interface*[6] wl_touch_down_event_interfaces = [null,null,&wl_surface_interface,null,null,null];
static const wl_interface*[3] wl_touch_up_event_interfaces = [null,null,null];
static const wl_interface*[4] wl_touch_motion_event_interfaces = [null,null,null,null];
static const wl_interface*[0] wl_touch_frame_event_interfaces = [];
static const wl_interface*[0] wl_touch_cancel_event_interfaces = [];
static const wl_interface*[3] wl_touch_shape_event_interfaces = [null,null,null];
static const wl_interface*[2] wl_touch_orientation_event_interfaces = [null,null];
static const wl_message[7] wl_touch_events = [
  wl_message ("down", "uuoiff", wl_touch_down_event_interfaces.ptr),
  wl_message ("up", "uui", wl_touch_up_event_interfaces.ptr),
  wl_message ("motion", "uiff", wl_touch_motion_event_interfaces.ptr),
  wl_message ("frame", "", wl_touch_frame_event_interfaces.ptr),
  wl_message ("cancel", "", wl_touch_cancel_event_interfaces.ptr),
  wl_message ("shape", "6iff", wl_touch_shape_event_interfaces.ptr),
  wl_message ("orientation", "6if", wl_touch_orientation_event_interfaces.ptr),
];
extern (C) static const wl_interface wl_touch_interface = {
  "wl_touch", 9,
  wl_touch_requests.length, wl_touch_requests.ptr,
  wl_touch_events.length,   wl_touch_events.ptr,
};
// module wayland.wl_output;

struct
wl_output {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_output);
  @disable this(ref wl_output);
  }

  // Requests
  pragma (inline,true):
  auto release () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.release, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }

  // Events
  struct
  Listener {
    Geometry_cb    geometry    = &_geometry_impl_default;
    Mode_cb        mode        = &_mode_impl_default;
    Done_cb        done        = &_done_impl_default;
    Scale_cb       scale       = &_scale_impl_default;
    Name_cb        name        = &_name_impl_default;
    Description_cb description = &_description_impl_default;

    alias Geometry_cb    = extern (C) void function (void* ctx, wl_output* _this /* args: */ , int x, int y, int physical_width, int physical_height, int subpixel, const(char)* make, const(char)* model, int transform);
    alias Mode_cb        = extern (C) void function (void* ctx, wl_output* _this /* args: */ , uint flags, int width, int height, int refresh);
    alias Done_cb        = extern (C) void function (void* ctx, wl_output* _this /* args: */ );
    alias Scale_cb       = extern (C) void function (void* ctx, wl_output* _this /* args: */ , int factor);
    alias Name_cb        = extern (C) void function (void* ctx, wl_output* _this /* args: */ , const(char)* name);
    alias Description_cb = extern (C) void function (void* ctx, wl_output* _this /* args: */ , const(char)* description);

    extern (C)
    static
    void
    _geometry_impl_default (void* ctx, wl_output* _this /* args: */ , int x, int y, int physical_width, int physical_height, int subpixel, const(char)* make, const(char)* model, int transform) {
        // 
    }

    extern (C)
    static
    void
    _mode_impl_default (void* ctx, wl_output* _this /* args: */ , uint flags, int width, int height, int refresh) {
        // 
    }

    extern (C)
    static
    void
    _done_impl_default (void* ctx, wl_output* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _scale_impl_default (void* ctx, wl_output* _this /* args: */ , int factor) {
        // 
    }

    extern (C)
    static
    void
    _name_impl_default (void* ctx, wl_output* _this /* args: */ , const(char)* name) {
        // 
    }

    extern (C)
    static
    void
    _description_impl_default (void* ctx, wl_output* _this /* args: */ , const(char)* description) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Subpixel {
    unknown = 0,
    none = 1,
    horizontal_rgb = 2,
    horizontal_bgr = 3,
    vertical_rgb = 4,
    vertical_bgr = 5,
  }
  enum
  Transform {
    normal = 0,
    _90 = 1,
    _180 = 2,
    _270 = 3,
    flipped = 4,
    flipped_90 = 5,
    flipped_180 = 6,
    flipped_270 = 7,
  }
  enum
  Mode {
    current = 0x1,
    preferred = 0x2,
  }

  // Opcodes
  enum
  Opcode : uint {
    release = 0,
  }

  alias IFACE = wl_output_interface;
}

static const wl_interface*[0] wl_output_release_requiest_interfaces = [];
static const wl_message[1] wl_output_requests = [
  wl_message ("release", "3", wl_output_release_requiest_interfaces.ptr),
];
static const wl_interface*[8] wl_output_geometry_event_interfaces = [null,null,null,null,null,null,null,null];
static const wl_interface*[4] wl_output_mode_event_interfaces = [null,null,null,null];
static const wl_interface*[0] wl_output_done_event_interfaces = [];
static const wl_interface*[1] wl_output_scale_event_interfaces = [null];
static const wl_interface*[1] wl_output_name_event_interfaces = [null];
static const wl_interface*[1] wl_output_description_event_interfaces = [null];
static const wl_message[6] wl_output_events = [
  wl_message ("geometry", "iiiiissi", wl_output_geometry_event_interfaces.ptr),
  wl_message ("mode", "uiii", wl_output_mode_event_interfaces.ptr),
  wl_message ("done", "2", wl_output_done_event_interfaces.ptr),
  wl_message ("scale", "2i", wl_output_scale_event_interfaces.ptr),
  wl_message ("name", "4s", wl_output_name_event_interfaces.ptr),
  wl_message ("description", "4s", wl_output_description_event_interfaces.ptr),
];
extern (C) static const wl_interface wl_output_interface = {
  "wl_output", 4,
  wl_output_requests.length, wl_output_requests.ptr,
  wl_output_events.length,   wl_output_events.ptr,
};
// module wayland.wl_region;

struct
wl_region {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_region);
  @disable this(ref wl_region);
  }

  // Requests
  pragma (inline,true):
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }
  auto add (int x, int y, int width, int height) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.add, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , x,y,width,height); }
  auto subtract (int x, int y, int width, int height) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.subtract, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , x,y,width,height); }

  // Opcodes
  enum
  Opcode : uint {
    destroy = 0,
    add = 1,
    subtract = 2,
  }

  alias IFACE = wl_region_interface;
}

static const wl_interface*[0] wl_region_destroy_requiest_interfaces = [];
static const wl_interface*[4] wl_region_add_requiest_interfaces = [null,null,null,null];
static const wl_interface*[4] wl_region_subtract_requiest_interfaces = [null,null,null,null];
static const wl_message[3] wl_region_requests = [
  wl_message ("destroy", "", wl_region_destroy_requiest_interfaces.ptr),
  wl_message ("add", "iiii", wl_region_add_requiest_interfaces.ptr),
  wl_message ("subtract", "iiii", wl_region_subtract_requiest_interfaces.ptr),
];
static const wl_message[0] wl_region_events = [
];
extern (C) static const wl_interface wl_region_interface = {
  "wl_region", 1,
  wl_region_requests.length, wl_region_requests.ptr,
  wl_region_events.length,   wl_region_events.ptr,
};
// module wayland.wl_subcompositor;

struct
wl_subcompositor {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_subcompositor);
  @disable this(ref wl_subcompositor);
  }

  // Requests
  pragma (inline,true):
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }
  auto get_subsurface (wl_surface* surface, wl_surface* parent) { return cast (wl_subsurface*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.get_subsurface, /* ret interface: */ &wl_subsurface_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null,surface,parent); }

  // Enums
  enum
  Error {
    bad_surface = 0,
    bad_parent = 1,
  }

  // Opcodes
  enum
  Opcode : uint {
    destroy = 0,
    get_subsurface = 1,
  }

  alias IFACE = wl_subcompositor_interface;
}

static const wl_interface*[0] wl_subcompositor_destroy_requiest_interfaces = [];
static const wl_interface*[3] wl_subcompositor_get_subsurface_requiest_interfaces = [&wl_subsurface_interface,&wl_surface_interface,&wl_surface_interface];
static const wl_message[2] wl_subcompositor_requests = [
  wl_message ("destroy", "", wl_subcompositor_destroy_requiest_interfaces.ptr),
  wl_message ("get_subsurface", "noo", wl_subcompositor_get_subsurface_requiest_interfaces.ptr),
];
static const wl_message[0] wl_subcompositor_events = [
];
extern (C) static const wl_interface wl_subcompositor_interface = {
  "wl_subcompositor", 1,
  wl_subcompositor_requests.length, wl_subcompositor_requests.ptr,
  wl_subcompositor_events.length,   wl_subcompositor_events.ptr,
};
// module wayland.wl_subsurface;

struct
wl_subsurface {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wl_subsurface);
  @disable this(ref wl_subsurface);
  }

  // Requests
  pragma (inline,true):
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }
  auto set_position (int x, int y) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_position, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , x,y); }
  auto place_above (wl_surface* sibling) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.place_above, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , sibling); }
  auto place_below (wl_surface* sibling) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.place_below, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , sibling); }
  auto set_sync () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_sync, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ ); }
  auto set_desync () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_desync, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ ); }

  // Enums
  enum
  Error {
    bad_surface = 0,
  }

  // Opcodes
  enum
  Opcode : uint {
    destroy = 0,
    set_position = 1,
    place_above = 2,
    place_below = 3,
    set_sync = 4,
    set_desync = 5,
  }

  alias IFACE = wl_subsurface_interface;
}

static const wl_interface*[0] wl_subsurface_destroy_requiest_interfaces = [];
static const wl_interface*[2] wl_subsurface_set_position_requiest_interfaces = [null,null];
static const wl_interface*[1] wl_subsurface_place_above_requiest_interfaces = [&wl_surface_interface];
static const wl_interface*[1] wl_subsurface_place_below_requiest_interfaces = [&wl_surface_interface];
static const wl_interface*[0] wl_subsurface_set_sync_requiest_interfaces = [];
static const wl_interface*[0] wl_subsurface_set_desync_requiest_interfaces = [];
static const wl_message[6] wl_subsurface_requests = [
  wl_message ("destroy", "", wl_subsurface_destroy_requiest_interfaces.ptr),
  wl_message ("set_position", "ii", wl_subsurface_set_position_requiest_interfaces.ptr),
  wl_message ("place_above", "o", wl_subsurface_place_above_requiest_interfaces.ptr),
  wl_message ("place_below", "o", wl_subsurface_place_below_requiest_interfaces.ptr),
  wl_message ("set_sync", "", wl_subsurface_set_sync_requiest_interfaces.ptr),
  wl_message ("set_desync", "", wl_subsurface_set_desync_requiest_interfaces.ptr),
];
static const wl_message[0] wl_subsurface_events = [
];
extern (C) static const wl_interface wl_subsurface_interface = {
  "wl_subsurface", 1,
  wl_subsurface_requests.length, wl_subsurface_requests.ptr,
  wl_subsurface_events.length,   wl_subsurface_events.ptr,
};
