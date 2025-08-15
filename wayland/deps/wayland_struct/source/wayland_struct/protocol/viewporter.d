// Generated with wayland-scanner-d
// protocol viewporter
module wayland_struct.protocol.viewporter;

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

// module viewporter.wp_viewporter;

struct
wp_viewporter {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wp_viewporter);
  @disable this(ref wp_viewporter);
  }

  // Requests
  pragma (inline,true):
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }
  auto get_viewport (wl_surface* surface) { return cast (wp_viewport*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.get_viewport, /* ret interface: */ &wp_viewport_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null,surface); }

  // Enums
  enum
  Error {
    viewport_exists = 0,
  }

  // Opcodes
  enum
  Opcode : uint {
    destroy = 0,
    get_viewport = 1,
  }

  alias IFACE = wp_viewporter_interface;
}

static const wl_interface*[0] wp_viewporter_destroy_requiest_interfaces = [];
static const wl_interface*[2] wp_viewporter_get_viewport_requiest_interfaces = [&wp_viewport_interface,&wl_surface_interface];
static const wl_message[2] wp_viewporter_requests = [
  wl_message ("destroy", "", wp_viewporter_destroy_requiest_interfaces.ptr),
  wl_message ("get_viewport", "no", wp_viewporter_get_viewport_requiest_interfaces.ptr),
];
static const wl_message[0] wp_viewporter_events = [
];
extern (C) static const wl_interface wp_viewporter_interface = {
  "wp_viewporter", 1,
  wp_viewporter_requests.length, wp_viewporter_requests.ptr,
  wp_viewporter_events.length,   wp_viewporter_events.ptr,
};
// module viewporter.wp_viewport;

struct
wp_viewport {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wp_viewport);
  @disable this(ref wp_viewport);
  }

  // Requests
  pragma (inline,true):
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }
  auto set_source (wl_fixed_t x, wl_fixed_t y, wl_fixed_t width, wl_fixed_t height) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_source, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , x,y,width,height); }
  auto set_destination (int width, int height) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_destination, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , width,height); }

  // Enums
  enum
  Error {
    bad_value = 0,
    bad_size = 1,
    out_of_buffer = 2,
    no_surface = 3,
  }

  // Opcodes
  enum
  Opcode : uint {
    destroy = 0,
    set_source = 1,
    set_destination = 2,
  }

  alias IFACE = wp_viewport_interface;
}

static const wl_interface*[0] wp_viewport_destroy_requiest_interfaces = [];
static const wl_interface*[4] wp_viewport_set_source_requiest_interfaces = [null,null,null,null];
static const wl_interface*[2] wp_viewport_set_destination_requiest_interfaces = [null,null];
static const wl_message[3] wp_viewport_requests = [
  wl_message ("destroy", "", wp_viewport_destroy_requiest_interfaces.ptr),
  wl_message ("set_source", "ffff", wp_viewport_set_source_requiest_interfaces.ptr),
  wl_message ("set_destination", "ii", wp_viewport_set_destination_requiest_interfaces.ptr),
];
static const wl_message[0] wp_viewport_events = [
];
extern (C) static const wl_interface wp_viewport_interface = {
  "wp_viewport", 1,
  wp_viewport_requests.length, wp_viewport_requests.ptr,
  wp_viewport_events.length,   wp_viewport_events.ptr,
};
