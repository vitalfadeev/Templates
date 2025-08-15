// Generated with wayland-scanner-d
// protocol xdg_shell
module wayland_struct.protocol.xdg_shell;

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

// module xdg_shell.xdg_wm_base;

struct
xdg_wm_base {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(xdg_wm_base);
  @disable this(ref xdg_wm_base);
  }

  // Requests
  pragma (inline,true):
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }
  auto create_positioner () { return cast (xdg_positioner*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.create_positioner, /* ret interface: */ &xdg_positioner_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null); }
  auto get_xdg_surface (wl_surface* surface) { return cast (xdg_surface*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.get_xdg_surface, /* ret interface: */ &xdg_surface_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null,surface); }
  auto pong (uint serial) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.pong, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , serial); }

  // Events
  struct
  Listener {
    ping_cb ping = &_ping_impl_default;

    alias ping_cb = extern (C) void function (void* ctx, xdg_wm_base* _this /* args: */ , uint serial);

    extern (C)
    static
    void
    _ping_impl_default (void* ctx, xdg_wm_base* _this /* args: */ , uint serial) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Error {
    role = 0,
    defunct_surfaces = 1,
    not_the_topmost_popup = 2,
    invalid_popup_parent = 3,
    invalid_surface_state = 4,
    invalid_positioner = 5,
    unresponsive = 6,
  }

  // Opcodes
  enum
  Opcode : uint {
    destroy = 0,
    create_positioner = 1,
    get_xdg_surface = 2,
    pong = 3,
  }

  alias IFACE = xdg_wm_base_interface;
}

static const wl_interface*[0] xdg_wm_base_destroy_requiest_interfaces = [];
static const wl_interface*[1] xdg_wm_base_create_positioner_requiest_interfaces = [&xdg_positioner_interface];
static const wl_interface*[2] xdg_wm_base_get_xdg_surface_requiest_interfaces = [&xdg_surface_interface,&wl_surface_interface];
static const wl_interface*[1] xdg_wm_base_pong_requiest_interfaces = [null];
static const wl_message[4] xdg_wm_base_requests = [
  wl_message ("destroy", "", xdg_wm_base_destroy_requiest_interfaces.ptr),
  wl_message ("create_positioner", "n", xdg_wm_base_create_positioner_requiest_interfaces.ptr),
  wl_message ("get_xdg_surface", "no", xdg_wm_base_get_xdg_surface_requiest_interfaces.ptr),
  wl_message ("pong", "u", xdg_wm_base_pong_requiest_interfaces.ptr),
];
static const wl_interface*[1] xdg_wm_base_ping_event_interfaces = [null];
static const wl_message[1] xdg_wm_base_events = [
  wl_message ("ping", "u", xdg_wm_base_ping_event_interfaces.ptr),
];
extern (C) static const wl_interface xdg_wm_base_interface = {
  "xdg_wm_base", 7,
  xdg_wm_base_requests.length, xdg_wm_base_requests.ptr,
  xdg_wm_base_events.length,   xdg_wm_base_events.ptr,
};
// module xdg_shell.xdg_positioner;

struct
xdg_positioner {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(xdg_positioner);
  @disable this(ref xdg_positioner);
  }

  // Requests
  pragma (inline,true):
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }
  auto set_size (int width, int height) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_size, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , width,height); }
  auto set_anchor_rect (int x, int y, int width, int height) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_anchor_rect, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , x,y,width,height); }
  auto set_anchor (uint anchor) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_anchor, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , anchor); }
  auto set_gravity (uint gravity) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_gravity, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , gravity); }
  auto set_constraint_adjustment (uint constraint_adjustment) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_constraint_adjustment, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , constraint_adjustment); }
  auto set_offset (int x, int y) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_offset, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , x,y); }
  auto set_reactive () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_reactive, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ ); }
  auto set_parent_size (int parent_width, int parent_height) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_parent_size, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , parent_width,parent_height); }
  auto set_parent_configure (uint serial) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_parent_configure, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , serial); }

  // Enums
  enum
  Error {
    invalid_input = 0,
  }
  enum
  Anchor {
    none = 0,
    top = 1,
    bottom = 2,
    left = 3,
    right = 4,
    top_left = 5,
    bottom_left = 6,
    top_right = 7,
    bottom_right = 8,
  }
  enum
  Gravity {
    none = 0,
    top = 1,
    bottom = 2,
    left = 3,
    right = 4,
    top_left = 5,
    bottom_left = 6,
    top_right = 7,
    bottom_right = 8,
  }
  enum
  Constraint_adjustment {
    none = 0,
    slide_x = 1,
    slide_y = 2,
    flip_x = 4,
    flip_y = 8,
    resize_x = 16,
    resize_y = 32,
  }

  // Opcodes
  enum
  Opcode : uint {
    destroy = 0,
    set_size = 1,
    set_anchor_rect = 2,
    set_anchor = 3,
    set_gravity = 4,
    set_constraint_adjustment = 5,
    set_offset = 6,
    set_reactive = 7,
    set_parent_size = 8,
    set_parent_configure = 9,
  }

  alias IFACE = xdg_positioner_interface;
}

static const wl_interface*[0] xdg_positioner_destroy_requiest_interfaces = [];
static const wl_interface*[2] xdg_positioner_set_size_requiest_interfaces = [null,null];
static const wl_interface*[4] xdg_positioner_set_anchor_rect_requiest_interfaces = [null,null,null,null];
static const wl_interface*[1] xdg_positioner_set_anchor_requiest_interfaces = [null];
static const wl_interface*[1] xdg_positioner_set_gravity_requiest_interfaces = [null];
static const wl_interface*[1] xdg_positioner_set_constraint_adjustment_requiest_interfaces = [null];
static const wl_interface*[2] xdg_positioner_set_offset_requiest_interfaces = [null,null];
static const wl_interface*[0] xdg_positioner_set_reactive_requiest_interfaces = [];
static const wl_interface*[2] xdg_positioner_set_parent_size_requiest_interfaces = [null,null];
static const wl_interface*[1] xdg_positioner_set_parent_configure_requiest_interfaces = [null];
static const wl_message[10] xdg_positioner_requests = [
  wl_message ("destroy", "", xdg_positioner_destroy_requiest_interfaces.ptr),
  wl_message ("set_size", "ii", xdg_positioner_set_size_requiest_interfaces.ptr),
  wl_message ("set_anchor_rect", "iiii", xdg_positioner_set_anchor_rect_requiest_interfaces.ptr),
  wl_message ("set_anchor", "u", xdg_positioner_set_anchor_requiest_interfaces.ptr),
  wl_message ("set_gravity", "u", xdg_positioner_set_gravity_requiest_interfaces.ptr),
  wl_message ("set_constraint_adjustment", "u", xdg_positioner_set_constraint_adjustment_requiest_interfaces.ptr),
  wl_message ("set_offset", "ii", xdg_positioner_set_offset_requiest_interfaces.ptr),
  wl_message ("set_reactive", "3", xdg_positioner_set_reactive_requiest_interfaces.ptr),
  wl_message ("set_parent_size", "3ii", xdg_positioner_set_parent_size_requiest_interfaces.ptr),
  wl_message ("set_parent_configure", "3u", xdg_positioner_set_parent_configure_requiest_interfaces.ptr),
];
static const wl_message[0] xdg_positioner_events = [
];
extern (C) static const wl_interface xdg_positioner_interface = {
  "xdg_positioner", 7,
  xdg_positioner_requests.length, xdg_positioner_requests.ptr,
  xdg_positioner_events.length,   xdg_positioner_events.ptr,
};
// module xdg_shell.xdg_surface;

struct
xdg_surface {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(xdg_surface);
  @disable this(ref xdg_surface);
  }

  // Requests
  pragma (inline,true):
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }
  auto get_toplevel () { return cast (xdg_toplevel*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.get_toplevel, /* ret interface: */ &xdg_toplevel_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null); }
  auto get_popup (xdg_surface* parent, xdg_positioner* positioner) { return cast (xdg_popup*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.get_popup, /* ret interface: */ &xdg_popup_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null,parent,positioner); }
  auto set_window_geometry (int x, int y, int width, int height) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_window_geometry, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , x,y,width,height); }
  auto ack_configure (uint serial) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.ack_configure, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , serial); }

  // Events
  struct
  Listener {
    configure_cb configure = &_configure_impl_default;

    alias configure_cb = extern (C) void function (void* ctx, xdg_surface* _this /* args: */ , uint serial);

    extern (C)
    static
    void
    _configure_impl_default (void* ctx, xdg_surface* _this /* args: */ , uint serial) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Error {
    not_constructed = 1,
    already_constructed = 2,
    unconfigured_buffer = 3,
    invalid_serial = 4,
    invalid_size = 5,
    defunct_role_object = 6,
  }

  // Opcodes
  enum
  Opcode : uint {
    destroy = 0,
    get_toplevel = 1,
    get_popup = 2,
    set_window_geometry = 3,
    ack_configure = 4,
  }

  alias IFACE = xdg_surface_interface;
}

static const wl_interface*[0] xdg_surface_destroy_requiest_interfaces = [];
static const wl_interface*[1] xdg_surface_get_toplevel_requiest_interfaces = [&xdg_toplevel_interface];
static const wl_interface*[3] xdg_surface_get_popup_requiest_interfaces = [&xdg_popup_interface,&xdg_surface_interface,&xdg_positioner_interface];
static const wl_interface*[4] xdg_surface_set_window_geometry_requiest_interfaces = [null,null,null,null];
static const wl_interface*[1] xdg_surface_ack_configure_requiest_interfaces = [null];
static const wl_message[5] xdg_surface_requests = [
  wl_message ("destroy", "", xdg_surface_destroy_requiest_interfaces.ptr),
  wl_message ("get_toplevel", "n", xdg_surface_get_toplevel_requiest_interfaces.ptr),
  wl_message ("get_popup", "n?oo", xdg_surface_get_popup_requiest_interfaces.ptr),
  wl_message ("set_window_geometry", "iiii", xdg_surface_set_window_geometry_requiest_interfaces.ptr),
  wl_message ("ack_configure", "u", xdg_surface_ack_configure_requiest_interfaces.ptr),
];
static const wl_interface*[1] xdg_surface_configure_event_interfaces = [null];
static const wl_message[1] xdg_surface_events = [
  wl_message ("configure", "u", xdg_surface_configure_event_interfaces.ptr),
];
extern (C) static const wl_interface xdg_surface_interface = {
  "xdg_surface", 7,
  xdg_surface_requests.length, xdg_surface_requests.ptr,
  xdg_surface_events.length,   xdg_surface_events.ptr,
};
// module xdg_shell.xdg_toplevel;

struct
xdg_toplevel {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(xdg_toplevel);
  @disable this(ref xdg_toplevel);
  }

  // Requests
  pragma (inline,true):
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }
  auto set_parent (xdg_toplevel* parent) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_parent, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , parent); }
  auto set_title (const(char)* title) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_title, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , title); }
  auto set_app_id (const(char)* app_id) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_app_id, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , app_id); }
  auto show_window_menu (wl_seat* seat, uint serial, int x, int y) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.show_window_menu, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , seat,serial,x,y); }
  auto move (wl_seat* seat, uint serial) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.move, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , seat,serial); }
  auto resize (wl_seat* seat, uint serial, uint edges) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.resize, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , seat,serial,edges); }
  auto set_max_size (int width, int height) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_max_size, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , width,height); }
  auto set_min_size (int width, int height) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_min_size, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , width,height); }
  auto set_maximized () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_maximized, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ ); }
  auto unset_maximized () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.unset_maximized, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ ); }
  auto set_fullscreen (wl_output* output) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_fullscreen, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , output); }
  auto unset_fullscreen () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.unset_fullscreen, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ ); }
  auto set_minimized () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_minimized, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ ); }

  // Events
  struct
  Listener {
    configure_cb        configure        = &_configure_impl_default;
    close_cb            close            = &_close_impl_default;
    configure_bounds_cb configure_bounds = &_configure_bounds_impl_default;
    wm_capabilities_cb  wm_capabilities  = &_wm_capabilities_impl_default;

    alias configure_cb        = extern (C) void function (void* ctx, xdg_toplevel* _this /* args: */ , int width, int height, wl_array* states);
    alias close_cb            = extern (C) void function (void* ctx, xdg_toplevel* _this /* args: */ );
    alias configure_bounds_cb = extern (C) void function (void* ctx, xdg_toplevel* _this /* args: */ , int width, int height);
    alias wm_capabilities_cb  = extern (C) void function (void* ctx, xdg_toplevel* _this /* args: */ , wl_array* capabilities);

    extern (C)
    static
    void
    _configure_impl_default (void* ctx, xdg_toplevel* _this /* args: */ , int width, int height, wl_array* states) {
        // 
    }

    extern (C)
    static
    void
    _close_impl_default (void* ctx, xdg_toplevel* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _configure_bounds_impl_default (void* ctx, xdg_toplevel* _this /* args: */ , int width, int height) {
        // 
    }

    extern (C)
    static
    void
    _wm_capabilities_impl_default (void* ctx, xdg_toplevel* _this /* args: */ , wl_array* capabilities) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Error {
    invalid_resize_edge = 0,
    invalid_parent = 1,
    invalid_size = 2,
  }
  enum
  Resize_edge {
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
  State {
    maximized = 1,
    fullscreen = 2,
    resizing = 3,
    activated = 4,
    tiled_left = 5,
    tiled_right = 6,
    tiled_top = 7,
    tiled_bottom = 8,
    suspended = 9,
    constrained_left = 10,
    constrained_right = 11,
    constrained_top = 12,
    constrained_bottom = 13,
  }
  enum
  Wm_capabilities {
    window_menu = 1,
    maximize = 2,
    fullscreen = 3,
    minimize = 4,
  }

  // Opcodes
  enum
  Opcode : uint {
    destroy = 0,
    set_parent = 1,
    set_title = 2,
    set_app_id = 3,
    show_window_menu = 4,
    move = 5,
    resize = 6,
    set_max_size = 7,
    set_min_size = 8,
    set_maximized = 9,
    unset_maximized = 10,
    set_fullscreen = 11,
    unset_fullscreen = 12,
    set_minimized = 13,
  }

  alias IFACE = xdg_toplevel_interface;
}

static const wl_interface*[0] xdg_toplevel_destroy_requiest_interfaces = [];
static const wl_interface*[1] xdg_toplevel_set_parent_requiest_interfaces = [&xdg_toplevel_interface];
static const wl_interface*[1] xdg_toplevel_set_title_requiest_interfaces = [null];
static const wl_interface*[1] xdg_toplevel_set_app_id_requiest_interfaces = [null];
static const wl_interface*[4] xdg_toplevel_show_window_menu_requiest_interfaces = [&wl_seat_interface,null,null,null];
static const wl_interface*[2] xdg_toplevel_move_requiest_interfaces = [&wl_seat_interface,null];
static const wl_interface*[3] xdg_toplevel_resize_requiest_interfaces = [&wl_seat_interface,null,null];
static const wl_interface*[2] xdg_toplevel_set_max_size_requiest_interfaces = [null,null];
static const wl_interface*[2] xdg_toplevel_set_min_size_requiest_interfaces = [null,null];
static const wl_interface*[0] xdg_toplevel_set_maximized_requiest_interfaces = [];
static const wl_interface*[0] xdg_toplevel_unset_maximized_requiest_interfaces = [];
static const wl_interface*[1] xdg_toplevel_set_fullscreen_requiest_interfaces = [&wl_output_interface];
static const wl_interface*[0] xdg_toplevel_unset_fullscreen_requiest_interfaces = [];
static const wl_interface*[0] xdg_toplevel_set_minimized_requiest_interfaces = [];
static const wl_message[14] xdg_toplevel_requests = [
  wl_message ("destroy", "", xdg_toplevel_destroy_requiest_interfaces.ptr),
  wl_message ("set_parent", "?o", xdg_toplevel_set_parent_requiest_interfaces.ptr),
  wl_message ("set_title", "s", xdg_toplevel_set_title_requiest_interfaces.ptr),
  wl_message ("set_app_id", "s", xdg_toplevel_set_app_id_requiest_interfaces.ptr),
  wl_message ("show_window_menu", "ouii", xdg_toplevel_show_window_menu_requiest_interfaces.ptr),
  wl_message ("move", "ou", xdg_toplevel_move_requiest_interfaces.ptr),
  wl_message ("resize", "ouu", xdg_toplevel_resize_requiest_interfaces.ptr),
  wl_message ("set_max_size", "ii", xdg_toplevel_set_max_size_requiest_interfaces.ptr),
  wl_message ("set_min_size", "ii", xdg_toplevel_set_min_size_requiest_interfaces.ptr),
  wl_message ("set_maximized", "", xdg_toplevel_set_maximized_requiest_interfaces.ptr),
  wl_message ("unset_maximized", "", xdg_toplevel_unset_maximized_requiest_interfaces.ptr),
  wl_message ("set_fullscreen", "?o", xdg_toplevel_set_fullscreen_requiest_interfaces.ptr),
  wl_message ("unset_fullscreen", "", xdg_toplevel_unset_fullscreen_requiest_interfaces.ptr),
  wl_message ("set_minimized", "", xdg_toplevel_set_minimized_requiest_interfaces.ptr),
];
static const wl_interface*[3] xdg_toplevel_configure_event_interfaces = [null,null,null];
static const wl_interface*[0] xdg_toplevel_close_event_interfaces = [];
static const wl_interface*[2] xdg_toplevel_configure_bounds_event_interfaces = [null,null];
static const wl_interface*[1] xdg_toplevel_wm_capabilities_event_interfaces = [null];
static const wl_message[4] xdg_toplevel_events = [
  wl_message ("configure", "iia", xdg_toplevel_configure_event_interfaces.ptr),
  wl_message ("close", "", xdg_toplevel_close_event_interfaces.ptr),
  wl_message ("configure_bounds", "4ii", xdg_toplevel_configure_bounds_event_interfaces.ptr),
  wl_message ("wm_capabilities", "5a", xdg_toplevel_wm_capabilities_event_interfaces.ptr),
];
extern (C) static const wl_interface xdg_toplevel_interface = {
  "xdg_toplevel", 7,
  xdg_toplevel_requests.length, xdg_toplevel_requests.ptr,
  xdg_toplevel_events.length,   xdg_toplevel_events.ptr,
};
// module xdg_shell.xdg_popup;

struct
xdg_popup {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(xdg_popup);
  @disable this(ref xdg_popup);
  }

  // Requests
  pragma (inline,true):
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }
  auto grab (wl_seat* seat, uint serial) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.grab, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , seat,serial); }
  auto reposition (xdg_positioner* positioner, uint token) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.reposition, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , positioner,token); }

  // Events
  struct
  Listener {
    configure_cb    configure    = &_configure_impl_default;
    popup_done_cb   popup_done   = &_popup_done_impl_default;
    repositioned_cb repositioned = &_repositioned_impl_default;

    alias configure_cb    = extern (C) void function (void* ctx, xdg_popup* _this /* args: */ , int x, int y, int width, int height);
    alias popup_done_cb   = extern (C) void function (void* ctx, xdg_popup* _this /* args: */ );
    alias repositioned_cb = extern (C) void function (void* ctx, xdg_popup* _this /* args: */ , uint token);

    extern (C)
    static
    void
    _configure_impl_default (void* ctx, xdg_popup* _this /* args: */ , int x, int y, int width, int height) {
        // 
    }

    extern (C)
    static
    void
    _popup_done_impl_default (void* ctx, xdg_popup* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _repositioned_impl_default (void* ctx, xdg_popup* _this /* args: */ , uint token) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Error {
    invalid_grab = 0,
  }

  // Opcodes
  enum
  Opcode : uint {
    destroy = 0,
    grab = 1,
    reposition = 2,
  }

  alias IFACE = xdg_popup_interface;
}

static const wl_interface*[0] xdg_popup_destroy_requiest_interfaces = [];
static const wl_interface*[2] xdg_popup_grab_requiest_interfaces = [&wl_seat_interface,null];
static const wl_interface*[2] xdg_popup_reposition_requiest_interfaces = [&xdg_positioner_interface,null];
static const wl_message[3] xdg_popup_requests = [
  wl_message ("destroy", "", xdg_popup_destroy_requiest_interfaces.ptr),
  wl_message ("grab", "ou", xdg_popup_grab_requiest_interfaces.ptr),
  wl_message ("reposition", "3ou", xdg_popup_reposition_requiest_interfaces.ptr),
];
static const wl_interface*[4] xdg_popup_configure_event_interfaces = [null,null,null,null];
static const wl_interface*[0] xdg_popup_popup_done_event_interfaces = [];
static const wl_interface*[1] xdg_popup_repositioned_event_interfaces = [null];
static const wl_message[3] xdg_popup_events = [
  wl_message ("configure", "iiii", xdg_popup_configure_event_interfaces.ptr),
  wl_message ("popup_done", "", xdg_popup_popup_done_event_interfaces.ptr),
  wl_message ("repositioned", "3u", xdg_popup_repositioned_event_interfaces.ptr),
];
extern (C) static const wl_interface xdg_popup_interface = {
  "xdg_popup", 7,
  xdg_popup_requests.length, xdg_popup_requests.ptr,
  xdg_popup_events.length,   xdg_popup_events.ptr,
};
