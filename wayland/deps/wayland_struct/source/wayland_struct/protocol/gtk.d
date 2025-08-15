// Generated with wayland-scanner-d
// protocol gtk
module wayland_struct.protocol.gtk;

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

// module gtk.gtk_shell1;

struct
gtk_shell1 {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(gtk_shell1);
  @disable this(ref gtk_shell1);
  }

  // Requests
  pragma (inline,true):
  auto get_gtk_surface (wl_surface* surface) { return cast (gtk_surface1*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.get_gtk_surface, /* ret interface: */ &gtk_surface1_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null,surface); }
  auto set_startup_id (const(char)* startup_id) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_startup_id, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , startup_id); }
  auto system_bell (gtk_surface1* surface) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.system_bell, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , surface); }
  auto notify_launch (const(char)* startup_id) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.notify_launch, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , startup_id); }

  // Events
  struct
  Listener {
    capabilities_cb capabilities = &_capabilities_impl_default;

    alias capabilities_cb = extern (C) void function (void* ctx, gtk_shell1* _this /* args: */ , uint capabilities);

    extern (C)
    static
    void
    _capabilities_impl_default (void* ctx, gtk_shell1* _this /* args: */ , uint capabilities) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Capability {
    global_app_menu = 1,
    global_menu_bar = 2,
    desktop_icons = 3,
  }

  // Opcodes
  enum
  Opcode : uint {
    get_gtk_surface = 0,
    set_startup_id = 1,
    system_bell = 2,
    notify_launch = 3,
  }

  alias IFACE = gtk_shell1_interface;
}

static const wl_interface*[2] gtk_shell1_get_gtk_surface_requiest_interfaces = [&gtk_surface1_interface,&wl_surface_interface];
static const wl_interface*[1] gtk_shell1_set_startup_id_requiest_interfaces = [null];
static const wl_interface*[1] gtk_shell1_system_bell_requiest_interfaces = [&gtk_surface1_interface];
static const wl_interface*[1] gtk_shell1_notify_launch_requiest_interfaces = [null];
static const wl_message[4] gtk_shell1_requests = [
  wl_message ("get_gtk_surface", "no", gtk_shell1_get_gtk_surface_requiest_interfaces.ptr),
  wl_message ("set_startup_id", "?s", gtk_shell1_set_startup_id_requiest_interfaces.ptr),
  wl_message ("system_bell", "?o", gtk_shell1_system_bell_requiest_interfaces.ptr),
  wl_message ("notify_launch", "3s", gtk_shell1_notify_launch_requiest_interfaces.ptr),
];
static const wl_interface*[1] gtk_shell1_capabilities_event_interfaces = [null];
static const wl_message[1] gtk_shell1_events = [
  wl_message ("capabilities", "u", gtk_shell1_capabilities_event_interfaces.ptr),
];
extern (C) static const wl_interface gtk_shell1_interface = {
  "gtk_shell1", 6,
  gtk_shell1_requests.length, gtk_shell1_requests.ptr,
  gtk_shell1_events.length,   gtk_shell1_events.ptr,
};
// module gtk.gtk_surface1;

struct
gtk_surface1 {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(gtk_surface1);
  @disable this(ref gtk_surface1);
  }

  // Requests
  pragma (inline,true):
  auto set_dbus_properties (const(char)* application_id, const(char)* app_menu_path, const(char)* menubar_path, const(char)* window_object_path, const(char)* application_object_path, const(char)* unique_bus_name) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_dbus_properties, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , application_id,app_menu_path,menubar_path,window_object_path,application_object_path,unique_bus_name); }
  auto set_modal () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_modal, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ ); }
  auto unset_modal () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.unset_modal, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ ); }
  auto present (uint time) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.present, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , time); }
  auto request_focus (const(char)* startup_id) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.request_focus, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , startup_id); }
  auto release () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.release, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }
  auto titlebar_gesture (uint serial, wl_seat* seat, uint gesture) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.titlebar_gesture, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , serial,seat,gesture); }

  // Events
  struct
  Listener {
    configure_cb       configure       = &_configure_impl_default;
    configure_edges_cb configure_edges = &_configure_edges_impl_default;

    alias configure_cb       = extern (C) void function (void* ctx, gtk_surface1* _this /* args: */ , wl_array* states);
    alias configure_edges_cb = extern (C) void function (void* ctx, gtk_surface1* _this /* args: */ , wl_array* constraints);

    extern (C)
    static
    void
    _configure_impl_default (void* ctx, gtk_surface1* _this /* args: */ , wl_array* states) {
        // 
    }

    extern (C)
    static
    void
    _configure_edges_impl_default (void* ctx, gtk_surface1* _this /* args: */ , wl_array* constraints) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  State {
    tiled = 1,
    tiled_top = 2,
    tiled_right = 3,
    tiled_bottom = 4,
    tiled_left = 5,
  }
  enum
  Edge_constraint {
    resizable_top = 1,
    resizable_right = 2,
    resizable_bottom = 3,
    resizable_left = 4,
  }
  enum
  Gesture {
    double_click = 1,
    right_click = 2,
    middle_click = 3,
  }
  enum
  Error {
    invalid_gesture = 0,
  }

  // Opcodes
  enum
  Opcode : uint {
    set_dbus_properties = 0,
    set_modal = 1,
    unset_modal = 2,
    present = 3,
    request_focus = 4,
    release = 5,
    titlebar_gesture = 6,
  }

  alias IFACE = gtk_surface1_interface;
}

static const wl_interface*[6] gtk_surface1_set_dbus_properties_requiest_interfaces = [null,null,null,null,null,null];
static const wl_interface*[0] gtk_surface1_set_modal_requiest_interfaces = [];
static const wl_interface*[0] gtk_surface1_unset_modal_requiest_interfaces = [];
static const wl_interface*[1] gtk_surface1_present_requiest_interfaces = [null];
static const wl_interface*[1] gtk_surface1_request_focus_requiest_interfaces = [null];
static const wl_interface*[0] gtk_surface1_release_requiest_interfaces = [];
static const wl_interface*[3] gtk_surface1_titlebar_gesture_requiest_interfaces = [null,&wl_seat_interface,null];
static const wl_message[7] gtk_surface1_requests = [
  wl_message ("set_dbus_properties", "?s?s?s?s?s?s", gtk_surface1_set_dbus_properties_requiest_interfaces.ptr),
  wl_message ("set_modal", "", gtk_surface1_set_modal_requiest_interfaces.ptr),
  wl_message ("unset_modal", "", gtk_surface1_unset_modal_requiest_interfaces.ptr),
  wl_message ("present", "u", gtk_surface1_present_requiest_interfaces.ptr),
  wl_message ("request_focus", "3?s", gtk_surface1_request_focus_requiest_interfaces.ptr),
  wl_message ("release", "4", gtk_surface1_release_requiest_interfaces.ptr),
  wl_message ("titlebar_gesture", "5uou", gtk_surface1_titlebar_gesture_requiest_interfaces.ptr),
];
static const wl_interface*[1] gtk_surface1_configure_event_interfaces = [null];
static const wl_interface*[1] gtk_surface1_configure_edges_event_interfaces = [null];
static const wl_message[2] gtk_surface1_events = [
  wl_message ("configure", "a", gtk_surface1_configure_event_interfaces.ptr),
  wl_message ("configure_edges", "2a", gtk_surface1_configure_edges_event_interfaces.ptr),
];
extern (C) static const wl_interface gtk_surface1_interface = {
  "gtk_surface1", 6,
  gtk_surface1_requests.length, gtk_surface1_requests.ptr,
  gtk_surface1_events.length,   gtk_surface1_events.ptr,
};
