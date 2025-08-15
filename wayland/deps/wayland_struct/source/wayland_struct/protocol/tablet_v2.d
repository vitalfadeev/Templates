// Generated with wayland-scanner-d
// protocol tablet_v2
module wayland_struct.protocol.tablet_v2;

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

// module tablet_v2.zwp_tablet_manager_v2;

struct
zwp_tablet_manager_v2 {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(zwp_tablet_manager_v2);
  @disable this(ref zwp_tablet_manager_v2);
  }

  // Requests
  pragma (inline,true):
  auto get_tablet_seat (wl_seat* seat) { return cast (zwp_tablet_seat_v2*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.get_tablet_seat, /* ret interface: */ &zwp_tablet_seat_v2_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null,seat); }
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }

  // Opcodes
  enum
  Opcode : uint {
    get_tablet_seat = 0,
    destroy = 1,
  }

  alias IFACE = zwp_tablet_manager_v2_interface;
}

static const wl_interface*[2] zwp_tablet_manager_v2_get_tablet_seat_requiest_interfaces = [&zwp_tablet_seat_v2_interface,&wl_seat_interface];
static const wl_interface*[0] zwp_tablet_manager_v2_destroy_requiest_interfaces = [];
static const wl_message[2] zwp_tablet_manager_v2_requests = [
  wl_message ("get_tablet_seat", "no", zwp_tablet_manager_v2_get_tablet_seat_requiest_interfaces.ptr),
  wl_message ("destroy", "", zwp_tablet_manager_v2_destroy_requiest_interfaces.ptr),
];
static const wl_message[0] zwp_tablet_manager_v2_events = [
];
extern (C) static const wl_interface zwp_tablet_manager_v2_interface = {
  "zwp_tablet_manager_v2", 2,
  zwp_tablet_manager_v2_requests.length, zwp_tablet_manager_v2_requests.ptr,
  zwp_tablet_manager_v2_events.length,   zwp_tablet_manager_v2_events.ptr,
};
// module tablet_v2.zwp_tablet_seat_v2;

struct
zwp_tablet_seat_v2 {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(zwp_tablet_seat_v2);
  @disable this(ref zwp_tablet_seat_v2);
  }

  // Requests
  pragma (inline,true):
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }

  // Events
  struct
  Listener {
    Tablet_added_cb tablet_added = &_tablet_added_impl_default;
    Tool_added_cb   tool_added   = &_tool_added_impl_default;
    Pad_added_cb    pad_added    = &_pad_added_impl_default;

    alias Tablet_added_cb = extern (C) void function (void* ctx, zwp_tablet_seat_v2* _this /* args: */ , zwp_tablet_v2 id);
    alias Tool_added_cb   = extern (C) void function (void* ctx, zwp_tablet_seat_v2* _this /* args: */ , zwp_tablet_tool_v2 id);
    alias Pad_added_cb    = extern (C) void function (void* ctx, zwp_tablet_seat_v2* _this /* args: */ , zwp_tablet_pad_v2 id);

    extern (C)
    static
    void
    _tablet_added_impl_default (void* ctx, zwp_tablet_seat_v2* _this /* args: */ , zwp_tablet_v2 id) {
        // 
    }

    extern (C)
    static
    void
    _tool_added_impl_default (void* ctx, zwp_tablet_seat_v2* _this /* args: */ , zwp_tablet_tool_v2 id) {
        // 
    }

    extern (C)
    static
    void
    _pad_added_impl_default (void* ctx, zwp_tablet_seat_v2* _this /* args: */ , zwp_tablet_pad_v2 id) {
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

  alias IFACE = zwp_tablet_seat_v2_interface;
}

static const wl_interface*[0] zwp_tablet_seat_v2_destroy_requiest_interfaces = [];
static const wl_message[1] zwp_tablet_seat_v2_requests = [
  wl_message ("destroy", "", zwp_tablet_seat_v2_destroy_requiest_interfaces.ptr),
];
static const wl_interface*[1] zwp_tablet_seat_v2_tablet_added_event_interfaces = [&zwp_tablet_v2_interface];
static const wl_interface*[1] zwp_tablet_seat_v2_tool_added_event_interfaces = [&zwp_tablet_tool_v2_interface];
static const wl_interface*[1] zwp_tablet_seat_v2_pad_added_event_interfaces = [&zwp_tablet_pad_v2_interface];
static const wl_message[3] zwp_tablet_seat_v2_events = [
  wl_message ("tablet_added", "n", zwp_tablet_seat_v2_tablet_added_event_interfaces.ptr),
  wl_message ("tool_added", "n", zwp_tablet_seat_v2_tool_added_event_interfaces.ptr),
  wl_message ("pad_added", "n", zwp_tablet_seat_v2_pad_added_event_interfaces.ptr),
];
extern (C) static const wl_interface zwp_tablet_seat_v2_interface = {
  "zwp_tablet_seat_v2", 2,
  zwp_tablet_seat_v2_requests.length, zwp_tablet_seat_v2_requests.ptr,
  zwp_tablet_seat_v2_events.length,   zwp_tablet_seat_v2_events.ptr,
};
// module tablet_v2.zwp_tablet_tool_v2;

struct
zwp_tablet_tool_v2 {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(zwp_tablet_tool_v2);
  @disable this(ref zwp_tablet_tool_v2);
  }

  // Requests
  pragma (inline,true):
  auto set_cursor (uint serial, wl_surface* surface, int hotspot_x, int hotspot_y) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_cursor, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , serial,surface,hotspot_x,hotspot_y); }
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }

  // Events
  struct
  Listener {
    Type_cb              type              = &_type_impl_default;
    Hardware_serial_cb   hardware_serial   = &_hardware_serial_impl_default;
    Hardware_id_wacom_cb hardware_id_wacom = &_hardware_id_wacom_impl_default;
    Capability_cb        capability        = &_capability_impl_default;
    Done_cb              done              = &_done_impl_default;
    Removed_cb           removed           = &_removed_impl_default;
    Proximity_in_cb      proximity_in      = &_proximity_in_impl_default;
    Proximity_out_cb     proximity_out     = &_proximity_out_impl_default;
    Down_cb              down              = &_down_impl_default;
    Up_cb                up                = &_up_impl_default;
    Motion_cb            motion            = &_motion_impl_default;
    Pressure_cb          pressure          = &_pressure_impl_default;
    Distance_cb          distance          = &_distance_impl_default;
    Tilt_cb              tilt              = &_tilt_impl_default;
    Rotation_cb          rotation          = &_rotation_impl_default;
    Slider_cb            slider            = &_slider_impl_default;
    Wheel_cb             wheel             = &_wheel_impl_default;
    Button_cb            button            = &_button_impl_default;
    Frame_cb             frame             = &_frame_impl_default;

    alias Type_cb              = extern (C) void function (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , uint tool_type);
    alias Hardware_serial_cb   = extern (C) void function (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , uint hardware_serial_hi, uint hardware_serial_lo);
    alias Hardware_id_wacom_cb = extern (C) void function (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , uint hardware_id_hi, uint hardware_id_lo);
    alias Capability_cb        = extern (C) void function (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , uint capability);
    alias Done_cb              = extern (C) void function (void* ctx, zwp_tablet_tool_v2* _this /* args: */ );
    alias Removed_cb           = extern (C) void function (void* ctx, zwp_tablet_tool_v2* _this /* args: */ );
    alias Proximity_in_cb      = extern (C) void function (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , uint serial, zwp_tablet_v2* tablet, wl_surface* surface);
    alias Proximity_out_cb     = extern (C) void function (void* ctx, zwp_tablet_tool_v2* _this /* args: */ );
    alias Down_cb              = extern (C) void function (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , uint serial);
    alias Up_cb                = extern (C) void function (void* ctx, zwp_tablet_tool_v2* _this /* args: */ );
    alias Motion_cb            = extern (C) void function (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , wl_fixed_t x, wl_fixed_t y);
    alias Pressure_cb          = extern (C) void function (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , uint pressure);
    alias Distance_cb          = extern (C) void function (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , uint distance);
    alias Tilt_cb              = extern (C) void function (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , wl_fixed_t tilt_x, wl_fixed_t tilt_y);
    alias Rotation_cb          = extern (C) void function (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , wl_fixed_t degrees);
    alias Slider_cb            = extern (C) void function (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , int position);
    alias Wheel_cb             = extern (C) void function (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , wl_fixed_t degrees, int clicks);
    alias Button_cb            = extern (C) void function (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , uint serial, uint button, uint state);
    alias Frame_cb             = extern (C) void function (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , uint time);

    extern (C)
    static
    void
    _type_impl_default (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , uint tool_type) {
        // 
    }

    extern (C)
    static
    void
    _hardware_serial_impl_default (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , uint hardware_serial_hi, uint hardware_serial_lo) {
        // 
    }

    extern (C)
    static
    void
    _hardware_id_wacom_impl_default (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , uint hardware_id_hi, uint hardware_id_lo) {
        // 
    }

    extern (C)
    static
    void
    _capability_impl_default (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , uint capability) {
        // 
    }

    extern (C)
    static
    void
    _done_impl_default (void* ctx, zwp_tablet_tool_v2* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _removed_impl_default (void* ctx, zwp_tablet_tool_v2* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _proximity_in_impl_default (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , uint serial, zwp_tablet_v2* tablet, wl_surface* surface) {
        // 
    }

    extern (C)
    static
    void
    _proximity_out_impl_default (void* ctx, zwp_tablet_tool_v2* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _down_impl_default (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , uint serial) {
        // 
    }

    extern (C)
    static
    void
    _up_impl_default (void* ctx, zwp_tablet_tool_v2* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _motion_impl_default (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , wl_fixed_t x, wl_fixed_t y) {
        // 
    }

    extern (C)
    static
    void
    _pressure_impl_default (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , uint pressure) {
        // 
    }

    extern (C)
    static
    void
    _distance_impl_default (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , uint distance) {
        // 
    }

    extern (C)
    static
    void
    _tilt_impl_default (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , wl_fixed_t tilt_x, wl_fixed_t tilt_y) {
        // 
    }

    extern (C)
    static
    void
    _rotation_impl_default (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , wl_fixed_t degrees) {
        // 
    }

    extern (C)
    static
    void
    _slider_impl_default (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , int position) {
        // 
    }

    extern (C)
    static
    void
    _wheel_impl_default (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , wl_fixed_t degrees, int clicks) {
        // 
    }

    extern (C)
    static
    void
    _button_impl_default (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , uint serial, uint button, uint state) {
        // 
    }

    extern (C)
    static
    void
    _frame_impl_default (void* ctx, zwp_tablet_tool_v2* _this /* args: */ , uint time) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Type {
    pen = 0x140,
    eraser = 0x141,
    brush = 0x142,
    pencil = 0x143,
    airbrush = 0x144,
    finger = 0x145,
    mouse = 0x146,
    lens = 0x147,
  }
  enum
  Capability {
    tilt = 1,
    pressure = 2,
    distance = 3,
    rotation = 4,
    slider = 5,
    wheel = 6,
  }
  enum
  Button_state {
    released = 0,
    pressed = 1,
  }
  enum
  Error {
    role = 0,
  }

  // Opcodes
  enum
  Opcode : uint {
    set_cursor = 0,
    destroy = 1,
  }

  alias IFACE = zwp_tablet_tool_v2_interface;
}

static const wl_interface*[4] zwp_tablet_tool_v2_set_cursor_requiest_interfaces = [null,&wl_surface_interface,null,null];
static const wl_interface*[0] zwp_tablet_tool_v2_destroy_requiest_interfaces = [];
static const wl_message[2] zwp_tablet_tool_v2_requests = [
  wl_message ("set_cursor", "u?oii", zwp_tablet_tool_v2_set_cursor_requiest_interfaces.ptr),
  wl_message ("destroy", "", zwp_tablet_tool_v2_destroy_requiest_interfaces.ptr),
];
static const wl_interface*[1] zwp_tablet_tool_v2_type_event_interfaces = [null];
static const wl_interface*[2] zwp_tablet_tool_v2_hardware_serial_event_interfaces = [null,null];
static const wl_interface*[2] zwp_tablet_tool_v2_hardware_id_wacom_event_interfaces = [null,null];
static const wl_interface*[1] zwp_tablet_tool_v2_capability_event_interfaces = [null];
static const wl_interface*[0] zwp_tablet_tool_v2_done_event_interfaces = [];
static const wl_interface*[0] zwp_tablet_tool_v2_removed_event_interfaces = [];
static const wl_interface*[3] zwp_tablet_tool_v2_proximity_in_event_interfaces = [null,&zwp_tablet_v2_interface,&wl_surface_interface];
static const wl_interface*[0] zwp_tablet_tool_v2_proximity_out_event_interfaces = [];
static const wl_interface*[1] zwp_tablet_tool_v2_down_event_interfaces = [null];
static const wl_interface*[0] zwp_tablet_tool_v2_up_event_interfaces = [];
static const wl_interface*[2] zwp_tablet_tool_v2_motion_event_interfaces = [null,null];
static const wl_interface*[1] zwp_tablet_tool_v2_pressure_event_interfaces = [null];
static const wl_interface*[1] zwp_tablet_tool_v2_distance_event_interfaces = [null];
static const wl_interface*[2] zwp_tablet_tool_v2_tilt_event_interfaces = [null,null];
static const wl_interface*[1] zwp_tablet_tool_v2_rotation_event_interfaces = [null];
static const wl_interface*[1] zwp_tablet_tool_v2_slider_event_interfaces = [null];
static const wl_interface*[2] zwp_tablet_tool_v2_wheel_event_interfaces = [null,null];
static const wl_interface*[3] zwp_tablet_tool_v2_button_event_interfaces = [null,null,null];
static const wl_interface*[1] zwp_tablet_tool_v2_frame_event_interfaces = [null];
static const wl_message[19] zwp_tablet_tool_v2_events = [
  wl_message ("type", "u", zwp_tablet_tool_v2_type_event_interfaces.ptr),
  wl_message ("hardware_serial", "uu", zwp_tablet_tool_v2_hardware_serial_event_interfaces.ptr),
  wl_message ("hardware_id_wacom", "uu", zwp_tablet_tool_v2_hardware_id_wacom_event_interfaces.ptr),
  wl_message ("capability", "u", zwp_tablet_tool_v2_capability_event_interfaces.ptr),
  wl_message ("done", "", zwp_tablet_tool_v2_done_event_interfaces.ptr),
  wl_message ("removed", "", zwp_tablet_tool_v2_removed_event_interfaces.ptr),
  wl_message ("proximity_in", "uoo", zwp_tablet_tool_v2_proximity_in_event_interfaces.ptr),
  wl_message ("proximity_out", "", zwp_tablet_tool_v2_proximity_out_event_interfaces.ptr),
  wl_message ("down", "u", zwp_tablet_tool_v2_down_event_interfaces.ptr),
  wl_message ("up", "", zwp_tablet_tool_v2_up_event_interfaces.ptr),
  wl_message ("motion", "ff", zwp_tablet_tool_v2_motion_event_interfaces.ptr),
  wl_message ("pressure", "u", zwp_tablet_tool_v2_pressure_event_interfaces.ptr),
  wl_message ("distance", "u", zwp_tablet_tool_v2_distance_event_interfaces.ptr),
  wl_message ("tilt", "ff", zwp_tablet_tool_v2_tilt_event_interfaces.ptr),
  wl_message ("rotation", "f", zwp_tablet_tool_v2_rotation_event_interfaces.ptr),
  wl_message ("slider", "i", zwp_tablet_tool_v2_slider_event_interfaces.ptr),
  wl_message ("wheel", "fi", zwp_tablet_tool_v2_wheel_event_interfaces.ptr),
  wl_message ("button", "uuu", zwp_tablet_tool_v2_button_event_interfaces.ptr),
  wl_message ("frame", "u", zwp_tablet_tool_v2_frame_event_interfaces.ptr),
];
extern (C) static const wl_interface zwp_tablet_tool_v2_interface = {
  "zwp_tablet_tool_v2", 2,
  zwp_tablet_tool_v2_requests.length, zwp_tablet_tool_v2_requests.ptr,
  zwp_tablet_tool_v2_events.length,   zwp_tablet_tool_v2_events.ptr,
};
// module tablet_v2.zwp_tablet_v2;

struct
zwp_tablet_v2 {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(zwp_tablet_v2);
  @disable this(ref zwp_tablet_v2);
  }

  // Requests
  pragma (inline,true):
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }

  // Events
  struct
  Listener {
    Name_cb    name    = &_name_impl_default;
    Id_cb      id      = &_id_impl_default;
    Path_cb    path    = &_path_impl_default;
    Done_cb    done    = &_done_impl_default;
    Removed_cb removed = &_removed_impl_default;
    Bustype_cb bustype = &_bustype_impl_default;

    alias Name_cb    = extern (C) void function (void* ctx, zwp_tablet_v2* _this /* args: */ , const(char)* name);
    alias Id_cb      = extern (C) void function (void* ctx, zwp_tablet_v2* _this /* args: */ , uint vid, uint pid);
    alias Path_cb    = extern (C) void function (void* ctx, zwp_tablet_v2* _this /* args: */ , const(char)* path);
    alias Done_cb    = extern (C) void function (void* ctx, zwp_tablet_v2* _this /* args: */ );
    alias Removed_cb = extern (C) void function (void* ctx, zwp_tablet_v2* _this /* args: */ );
    alias Bustype_cb = extern (C) void function (void* ctx, zwp_tablet_v2* _this /* args: */ , uint bustype);

    extern (C)
    static
    void
    _name_impl_default (void* ctx, zwp_tablet_v2* _this /* args: */ , const(char)* name) {
        // 
    }

    extern (C)
    static
    void
    _id_impl_default (void* ctx, zwp_tablet_v2* _this /* args: */ , uint vid, uint pid) {
        // 
    }

    extern (C)
    static
    void
    _path_impl_default (void* ctx, zwp_tablet_v2* _this /* args: */ , const(char)* path) {
        // 
    }

    extern (C)
    static
    void
    _done_impl_default (void* ctx, zwp_tablet_v2* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _removed_impl_default (void* ctx, zwp_tablet_v2* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _bustype_impl_default (void* ctx, zwp_tablet_v2* _this /* args: */ , uint bustype) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Bustype {
    usb = 3,
    bluetooth = 5,
    virtual = 6,
    serial = 17,
    i2c = 24,
  }

  // Opcodes
  enum
  Opcode : uint {
    destroy = 0,
  }

  alias IFACE = zwp_tablet_v2_interface;
}

static const wl_interface*[0] zwp_tablet_v2_destroy_requiest_interfaces = [];
static const wl_message[1] zwp_tablet_v2_requests = [
  wl_message ("destroy", "", zwp_tablet_v2_destroy_requiest_interfaces.ptr),
];
static const wl_interface*[1] zwp_tablet_v2_name_event_interfaces = [null];
static const wl_interface*[2] zwp_tablet_v2_id_event_interfaces = [null,null];
static const wl_interface*[1] zwp_tablet_v2_path_event_interfaces = [null];
static const wl_interface*[0] zwp_tablet_v2_done_event_interfaces = [];
static const wl_interface*[0] zwp_tablet_v2_removed_event_interfaces = [];
static const wl_interface*[1] zwp_tablet_v2_bustype_event_interfaces = [null];
static const wl_message[6] zwp_tablet_v2_events = [
  wl_message ("name", "s", zwp_tablet_v2_name_event_interfaces.ptr),
  wl_message ("id", "uu", zwp_tablet_v2_id_event_interfaces.ptr),
  wl_message ("path", "s", zwp_tablet_v2_path_event_interfaces.ptr),
  wl_message ("done", "", zwp_tablet_v2_done_event_interfaces.ptr),
  wl_message ("removed", "", zwp_tablet_v2_removed_event_interfaces.ptr),
  wl_message ("bustype", "2u", zwp_tablet_v2_bustype_event_interfaces.ptr),
];
extern (C) static const wl_interface zwp_tablet_v2_interface = {
  "zwp_tablet_v2", 2,
  zwp_tablet_v2_requests.length, zwp_tablet_v2_requests.ptr,
  zwp_tablet_v2_events.length,   zwp_tablet_v2_events.ptr,
};
// module tablet_v2.zwp_tablet_pad_ring_v2;

struct
zwp_tablet_pad_ring_v2 {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(zwp_tablet_pad_ring_v2);
  @disable this(ref zwp_tablet_pad_ring_v2);
  }

  // Requests
  pragma (inline,true):
  auto set_feedback (const(char)* description, uint serial) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_feedback, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , description,serial); }
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }

  // Events
  struct
  Listener {
    Source_cb source = &_source_impl_default;
    Angle_cb  angle  = &_angle_impl_default;
    Stop_cb   stop   = &_stop_impl_default;
    Frame_cb  frame  = &_frame_impl_default;

    alias Source_cb = extern (C) void function (void* ctx, zwp_tablet_pad_ring_v2* _this /* args: */ , uint source);
    alias Angle_cb  = extern (C) void function (void* ctx, zwp_tablet_pad_ring_v2* _this /* args: */ , wl_fixed_t degrees);
    alias Stop_cb   = extern (C) void function (void* ctx, zwp_tablet_pad_ring_v2* _this /* args: */ );
    alias Frame_cb  = extern (C) void function (void* ctx, zwp_tablet_pad_ring_v2* _this /* args: */ , uint time);

    extern (C)
    static
    void
    _source_impl_default (void* ctx, zwp_tablet_pad_ring_v2* _this /* args: */ , uint source) {
        // 
    }

    extern (C)
    static
    void
    _angle_impl_default (void* ctx, zwp_tablet_pad_ring_v2* _this /* args: */ , wl_fixed_t degrees) {
        // 
    }

    extern (C)
    static
    void
    _stop_impl_default (void* ctx, zwp_tablet_pad_ring_v2* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _frame_impl_default (void* ctx, zwp_tablet_pad_ring_v2* _this /* args: */ , uint time) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Source {
    finger = 1,
  }

  // Opcodes
  enum
  Opcode : uint {
    set_feedback = 0,
    destroy = 1,
  }

  alias IFACE = zwp_tablet_pad_ring_v2_interface;
}

static const wl_interface*[2] zwp_tablet_pad_ring_v2_set_feedback_requiest_interfaces = [null,null];
static const wl_interface*[0] zwp_tablet_pad_ring_v2_destroy_requiest_interfaces = [];
static const wl_message[2] zwp_tablet_pad_ring_v2_requests = [
  wl_message ("set_feedback", "su", zwp_tablet_pad_ring_v2_set_feedback_requiest_interfaces.ptr),
  wl_message ("destroy", "", zwp_tablet_pad_ring_v2_destroy_requiest_interfaces.ptr),
];
static const wl_interface*[1] zwp_tablet_pad_ring_v2_source_event_interfaces = [null];
static const wl_interface*[1] zwp_tablet_pad_ring_v2_angle_event_interfaces = [null];
static const wl_interface*[0] zwp_tablet_pad_ring_v2_stop_event_interfaces = [];
static const wl_interface*[1] zwp_tablet_pad_ring_v2_frame_event_interfaces = [null];
static const wl_message[4] zwp_tablet_pad_ring_v2_events = [
  wl_message ("source", "u", zwp_tablet_pad_ring_v2_source_event_interfaces.ptr),
  wl_message ("angle", "f", zwp_tablet_pad_ring_v2_angle_event_interfaces.ptr),
  wl_message ("stop", "", zwp_tablet_pad_ring_v2_stop_event_interfaces.ptr),
  wl_message ("frame", "u", zwp_tablet_pad_ring_v2_frame_event_interfaces.ptr),
];
extern (C) static const wl_interface zwp_tablet_pad_ring_v2_interface = {
  "zwp_tablet_pad_ring_v2", 2,
  zwp_tablet_pad_ring_v2_requests.length, zwp_tablet_pad_ring_v2_requests.ptr,
  zwp_tablet_pad_ring_v2_events.length,   zwp_tablet_pad_ring_v2_events.ptr,
};
// module tablet_v2.zwp_tablet_pad_strip_v2;

struct
zwp_tablet_pad_strip_v2 {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(zwp_tablet_pad_strip_v2);
  @disable this(ref zwp_tablet_pad_strip_v2);
  }

  // Requests
  pragma (inline,true):
  auto set_feedback (const(char)* description, uint serial) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_feedback, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , description,serial); }
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }

  // Events
  struct
  Listener {
    Source_cb   source   = &_source_impl_default;
    Position_cb position = &_position_impl_default;
    Stop_cb     stop     = &_stop_impl_default;
    Frame_cb    frame    = &_frame_impl_default;

    alias Source_cb   = extern (C) void function (void* ctx, zwp_tablet_pad_strip_v2* _this /* args: */ , uint source);
    alias Position_cb = extern (C) void function (void* ctx, zwp_tablet_pad_strip_v2* _this /* args: */ , uint position);
    alias Stop_cb     = extern (C) void function (void* ctx, zwp_tablet_pad_strip_v2* _this /* args: */ );
    alias Frame_cb    = extern (C) void function (void* ctx, zwp_tablet_pad_strip_v2* _this /* args: */ , uint time);

    extern (C)
    static
    void
    _source_impl_default (void* ctx, zwp_tablet_pad_strip_v2* _this /* args: */ , uint source) {
        // 
    }

    extern (C)
    static
    void
    _position_impl_default (void* ctx, zwp_tablet_pad_strip_v2* _this /* args: */ , uint position) {
        // 
    }

    extern (C)
    static
    void
    _stop_impl_default (void* ctx, zwp_tablet_pad_strip_v2* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _frame_impl_default (void* ctx, zwp_tablet_pad_strip_v2* _this /* args: */ , uint time) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Source {
    finger = 1,
  }

  // Opcodes
  enum
  Opcode : uint {
    set_feedback = 0,
    destroy = 1,
  }

  alias IFACE = zwp_tablet_pad_strip_v2_interface;
}

static const wl_interface*[2] zwp_tablet_pad_strip_v2_set_feedback_requiest_interfaces = [null,null];
static const wl_interface*[0] zwp_tablet_pad_strip_v2_destroy_requiest_interfaces = [];
static const wl_message[2] zwp_tablet_pad_strip_v2_requests = [
  wl_message ("set_feedback", "su", zwp_tablet_pad_strip_v2_set_feedback_requiest_interfaces.ptr),
  wl_message ("destroy", "", zwp_tablet_pad_strip_v2_destroy_requiest_interfaces.ptr),
];
static const wl_interface*[1] zwp_tablet_pad_strip_v2_source_event_interfaces = [null];
static const wl_interface*[1] zwp_tablet_pad_strip_v2_position_event_interfaces = [null];
static const wl_interface*[0] zwp_tablet_pad_strip_v2_stop_event_interfaces = [];
static const wl_interface*[1] zwp_tablet_pad_strip_v2_frame_event_interfaces = [null];
static const wl_message[4] zwp_tablet_pad_strip_v2_events = [
  wl_message ("source", "u", zwp_tablet_pad_strip_v2_source_event_interfaces.ptr),
  wl_message ("position", "u", zwp_tablet_pad_strip_v2_position_event_interfaces.ptr),
  wl_message ("stop", "", zwp_tablet_pad_strip_v2_stop_event_interfaces.ptr),
  wl_message ("frame", "u", zwp_tablet_pad_strip_v2_frame_event_interfaces.ptr),
];
extern (C) static const wl_interface zwp_tablet_pad_strip_v2_interface = {
  "zwp_tablet_pad_strip_v2", 2,
  zwp_tablet_pad_strip_v2_requests.length, zwp_tablet_pad_strip_v2_requests.ptr,
  zwp_tablet_pad_strip_v2_events.length,   zwp_tablet_pad_strip_v2_events.ptr,
};
// module tablet_v2.zwp_tablet_pad_group_v2;

struct
zwp_tablet_pad_group_v2 {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(zwp_tablet_pad_group_v2);
  @disable this(ref zwp_tablet_pad_group_v2);
  }

  // Requests
  pragma (inline,true):
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }

  // Events
  struct
  Listener {
    Buttons_cb     buttons     = &_buttons_impl_default;
    Ring_cb        ring        = &_ring_impl_default;
    Strip_cb       strip       = &_strip_impl_default;
    Modes_cb       modes       = &_modes_impl_default;
    Done_cb        done        = &_done_impl_default;
    Mode_switch_cb mode_switch = &_mode_switch_impl_default;
    Dial_cb        dial        = &_dial_impl_default;

    alias Buttons_cb     = extern (C) void function (void* ctx, zwp_tablet_pad_group_v2* _this /* args: */ , wl_array* buttons);
    alias Ring_cb        = extern (C) void function (void* ctx, zwp_tablet_pad_group_v2* _this /* args: */ , zwp_tablet_pad_ring_v2 ring);
    alias Strip_cb       = extern (C) void function (void* ctx, zwp_tablet_pad_group_v2* _this /* args: */ , zwp_tablet_pad_strip_v2 strip);
    alias Modes_cb       = extern (C) void function (void* ctx, zwp_tablet_pad_group_v2* _this /* args: */ , uint modes);
    alias Done_cb        = extern (C) void function (void* ctx, zwp_tablet_pad_group_v2* _this /* args: */ );
    alias Mode_switch_cb = extern (C) void function (void* ctx, zwp_tablet_pad_group_v2* _this /* args: */ , uint time, uint serial, uint mode);
    alias Dial_cb        = extern (C) void function (void* ctx, zwp_tablet_pad_group_v2* _this /* args: */ , zwp_tablet_pad_dial_v2 dial);

    extern (C)
    static
    void
    _buttons_impl_default (void* ctx, zwp_tablet_pad_group_v2* _this /* args: */ , wl_array* buttons) {
        // 
    }

    extern (C)
    static
    void
    _ring_impl_default (void* ctx, zwp_tablet_pad_group_v2* _this /* args: */ , zwp_tablet_pad_ring_v2 ring) {
        // 
    }

    extern (C)
    static
    void
    _strip_impl_default (void* ctx, zwp_tablet_pad_group_v2* _this /* args: */ , zwp_tablet_pad_strip_v2 strip) {
        // 
    }

    extern (C)
    static
    void
    _modes_impl_default (void* ctx, zwp_tablet_pad_group_v2* _this /* args: */ , uint modes) {
        // 
    }

    extern (C)
    static
    void
    _done_impl_default (void* ctx, zwp_tablet_pad_group_v2* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _mode_switch_impl_default (void* ctx, zwp_tablet_pad_group_v2* _this /* args: */ , uint time, uint serial, uint mode) {
        // 
    }

    extern (C)
    static
    void
    _dial_impl_default (void* ctx, zwp_tablet_pad_group_v2* _this /* args: */ , zwp_tablet_pad_dial_v2 dial) {
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

  alias IFACE = zwp_tablet_pad_group_v2_interface;
}

static const wl_interface*[0] zwp_tablet_pad_group_v2_destroy_requiest_interfaces = [];
static const wl_message[1] zwp_tablet_pad_group_v2_requests = [
  wl_message ("destroy", "", zwp_tablet_pad_group_v2_destroy_requiest_interfaces.ptr),
];
static const wl_interface*[1] zwp_tablet_pad_group_v2_buttons_event_interfaces = [null];
static const wl_interface*[1] zwp_tablet_pad_group_v2_ring_event_interfaces = [&zwp_tablet_pad_ring_v2_interface];
static const wl_interface*[1] zwp_tablet_pad_group_v2_strip_event_interfaces = [&zwp_tablet_pad_strip_v2_interface];
static const wl_interface*[1] zwp_tablet_pad_group_v2_modes_event_interfaces = [null];
static const wl_interface*[0] zwp_tablet_pad_group_v2_done_event_interfaces = [];
static const wl_interface*[3] zwp_tablet_pad_group_v2_mode_switch_event_interfaces = [null,null,null];
static const wl_interface*[1] zwp_tablet_pad_group_v2_dial_event_interfaces = [&zwp_tablet_pad_dial_v2_interface];
static const wl_message[7] zwp_tablet_pad_group_v2_events = [
  wl_message ("buttons", "a", zwp_tablet_pad_group_v2_buttons_event_interfaces.ptr),
  wl_message ("ring", "n", zwp_tablet_pad_group_v2_ring_event_interfaces.ptr),
  wl_message ("strip", "n", zwp_tablet_pad_group_v2_strip_event_interfaces.ptr),
  wl_message ("modes", "u", zwp_tablet_pad_group_v2_modes_event_interfaces.ptr),
  wl_message ("done", "", zwp_tablet_pad_group_v2_done_event_interfaces.ptr),
  wl_message ("mode_switch", "uuu", zwp_tablet_pad_group_v2_mode_switch_event_interfaces.ptr),
  wl_message ("dial", "2n", zwp_tablet_pad_group_v2_dial_event_interfaces.ptr),
];
extern (C) static const wl_interface zwp_tablet_pad_group_v2_interface = {
  "zwp_tablet_pad_group_v2", 2,
  zwp_tablet_pad_group_v2_requests.length, zwp_tablet_pad_group_v2_requests.ptr,
  zwp_tablet_pad_group_v2_events.length,   zwp_tablet_pad_group_v2_events.ptr,
};
// module tablet_v2.zwp_tablet_pad_v2;

struct
zwp_tablet_pad_v2 {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(zwp_tablet_pad_v2);
  @disable this(ref zwp_tablet_pad_v2);
  }

  // Requests
  pragma (inline,true):
  auto set_feedback (uint button, const(char)* description, uint serial) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_feedback, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , button,description,serial); }
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }

  // Events
  struct
  Listener {
    Group_cb   group   = &_group_impl_default;
    Path_cb    path    = &_path_impl_default;
    Buttons_cb buttons = &_buttons_impl_default;
    Done_cb    done    = &_done_impl_default;
    Button_cb  button  = &_button_impl_default;
    Enter_cb   enter   = &_enter_impl_default;
    Leave_cb   leave   = &_leave_impl_default;
    Removed_cb removed = &_removed_impl_default;

    alias Group_cb   = extern (C) void function (void* ctx, zwp_tablet_pad_v2* _this /* args: */ , zwp_tablet_pad_group_v2 pad_group);
    alias Path_cb    = extern (C) void function (void* ctx, zwp_tablet_pad_v2* _this /* args: */ , const(char)* path);
    alias Buttons_cb = extern (C) void function (void* ctx, zwp_tablet_pad_v2* _this /* args: */ , uint buttons);
    alias Done_cb    = extern (C) void function (void* ctx, zwp_tablet_pad_v2* _this /* args: */ );
    alias Button_cb  = extern (C) void function (void* ctx, zwp_tablet_pad_v2* _this /* args: */ , uint time, uint button, uint state);
    alias Enter_cb   = extern (C) void function (void* ctx, zwp_tablet_pad_v2* _this /* args: */ , uint serial, zwp_tablet_v2* tablet, wl_surface* surface);
    alias Leave_cb   = extern (C) void function (void* ctx, zwp_tablet_pad_v2* _this /* args: */ , uint serial, wl_surface* surface);
    alias Removed_cb = extern (C) void function (void* ctx, zwp_tablet_pad_v2* _this /* args: */ );

    extern (C)
    static
    void
    _group_impl_default (void* ctx, zwp_tablet_pad_v2* _this /* args: */ , zwp_tablet_pad_group_v2 pad_group) {
        // 
    }

    extern (C)
    static
    void
    _path_impl_default (void* ctx, zwp_tablet_pad_v2* _this /* args: */ , const(char)* path) {
        // 
    }

    extern (C)
    static
    void
    _buttons_impl_default (void* ctx, zwp_tablet_pad_v2* _this /* args: */ , uint buttons) {
        // 
    }

    extern (C)
    static
    void
    _done_impl_default (void* ctx, zwp_tablet_pad_v2* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _button_impl_default (void* ctx, zwp_tablet_pad_v2* _this /* args: */ , uint time, uint button, uint state) {
        // 
    }

    extern (C)
    static
    void
    _enter_impl_default (void* ctx, zwp_tablet_pad_v2* _this /* args: */ , uint serial, zwp_tablet_v2* tablet, wl_surface* surface) {
        // 
    }

    extern (C)
    static
    void
    _leave_impl_default (void* ctx, zwp_tablet_pad_v2* _this /* args: */ , uint serial, wl_surface* surface) {
        // 
    }

    extern (C)
    static
    void
    _removed_impl_default (void* ctx, zwp_tablet_pad_v2* _this /* args: */ ) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Button_state {
    released = 0,
    pressed = 1,
  }

  // Opcodes
  enum
  Opcode : uint {
    set_feedback = 0,
    destroy = 1,
  }

  alias IFACE = zwp_tablet_pad_v2_interface;
}

static const wl_interface*[3] zwp_tablet_pad_v2_set_feedback_requiest_interfaces = [null,null,null];
static const wl_interface*[0] zwp_tablet_pad_v2_destroy_requiest_interfaces = [];
static const wl_message[2] zwp_tablet_pad_v2_requests = [
  wl_message ("set_feedback", "usu", zwp_tablet_pad_v2_set_feedback_requiest_interfaces.ptr),
  wl_message ("destroy", "", zwp_tablet_pad_v2_destroy_requiest_interfaces.ptr),
];
static const wl_interface*[1] zwp_tablet_pad_v2_group_event_interfaces = [&zwp_tablet_pad_group_v2_interface];
static const wl_interface*[1] zwp_tablet_pad_v2_path_event_interfaces = [null];
static const wl_interface*[1] zwp_tablet_pad_v2_buttons_event_interfaces = [null];
static const wl_interface*[0] zwp_tablet_pad_v2_done_event_interfaces = [];
static const wl_interface*[3] zwp_tablet_pad_v2_button_event_interfaces = [null,null,null];
static const wl_interface*[3] zwp_tablet_pad_v2_enter_event_interfaces = [null,&zwp_tablet_v2_interface,&wl_surface_interface];
static const wl_interface*[2] zwp_tablet_pad_v2_leave_event_interfaces = [null,&wl_surface_interface];
static const wl_interface*[0] zwp_tablet_pad_v2_removed_event_interfaces = [];
static const wl_message[8] zwp_tablet_pad_v2_events = [
  wl_message ("group", "n", zwp_tablet_pad_v2_group_event_interfaces.ptr),
  wl_message ("path", "s", zwp_tablet_pad_v2_path_event_interfaces.ptr),
  wl_message ("buttons", "u", zwp_tablet_pad_v2_buttons_event_interfaces.ptr),
  wl_message ("done", "", zwp_tablet_pad_v2_done_event_interfaces.ptr),
  wl_message ("button", "uuu", zwp_tablet_pad_v2_button_event_interfaces.ptr),
  wl_message ("enter", "uoo", zwp_tablet_pad_v2_enter_event_interfaces.ptr),
  wl_message ("leave", "uo", zwp_tablet_pad_v2_leave_event_interfaces.ptr),
  wl_message ("removed", "", zwp_tablet_pad_v2_removed_event_interfaces.ptr),
];
extern (C) static const wl_interface zwp_tablet_pad_v2_interface = {
  "zwp_tablet_pad_v2", 2,
  zwp_tablet_pad_v2_requests.length, zwp_tablet_pad_v2_requests.ptr,
  zwp_tablet_pad_v2_events.length,   zwp_tablet_pad_v2_events.ptr,
};
// module tablet_v2.zwp_tablet_pad_dial_v2;

struct
zwp_tablet_pad_dial_v2 {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(zwp_tablet_pad_dial_v2);
  @disable this(ref zwp_tablet_pad_dial_v2);
  }

  // Requests
  pragma (inline,true):
  auto set_feedback (const(char)* description, uint serial) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.set_feedback, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , description,serial); }
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }

  // Events
  struct
  Listener {
    Delta_cb delta = &_delta_impl_default;
    Frame_cb frame = &_frame_impl_default;

    alias Delta_cb = extern (C) void function (void* ctx, zwp_tablet_pad_dial_v2* _this /* args: */ , int value120);
    alias Frame_cb = extern (C) void function (void* ctx, zwp_tablet_pad_dial_v2* _this /* args: */ , uint time);

    extern (C)
    static
    void
    _delta_impl_default (void* ctx, zwp_tablet_pad_dial_v2* _this /* args: */ , int value120) {
        // 
    }

    extern (C)
    static
    void
    _frame_impl_default (void* ctx, zwp_tablet_pad_dial_v2* _this /* args: */ , uint time) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Opcodes
  enum
  Opcode : uint {
    set_feedback = 0,
    destroy = 1,
  }

  alias IFACE = zwp_tablet_pad_dial_v2_interface;
}

static const wl_interface*[2] zwp_tablet_pad_dial_v2_set_feedback_requiest_interfaces = [null,null];
static const wl_interface*[0] zwp_tablet_pad_dial_v2_destroy_requiest_interfaces = [];
static const wl_message[2] zwp_tablet_pad_dial_v2_requests = [
  wl_message ("set_feedback", "su", zwp_tablet_pad_dial_v2_set_feedback_requiest_interfaces.ptr),
  wl_message ("destroy", "", zwp_tablet_pad_dial_v2_destroy_requiest_interfaces.ptr),
];
static const wl_interface*[1] zwp_tablet_pad_dial_v2_delta_event_interfaces = [null];
static const wl_interface*[1] zwp_tablet_pad_dial_v2_frame_event_interfaces = [null];
static const wl_message[2] zwp_tablet_pad_dial_v2_events = [
  wl_message ("delta", "i", zwp_tablet_pad_dial_v2_delta_event_interfaces.ptr),
  wl_message ("frame", "u", zwp_tablet_pad_dial_v2_frame_event_interfaces.ptr),
];
extern (C) static const wl_interface zwp_tablet_pad_dial_v2_interface = {
  "zwp_tablet_pad_dial_v2", 2,
  zwp_tablet_pad_dial_v2_requests.length, zwp_tablet_pad_dial_v2_requests.ptr,
  zwp_tablet_pad_dial_v2_events.length,   zwp_tablet_pad_dial_v2_events.ptr,
};
