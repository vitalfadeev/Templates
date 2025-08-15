// Generated with wayland-scanner-d
// protocol linux_dmabuf_v1
module wayland_struct.protocol.linux_dmabuf_v1;

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

// module linux_dmabuf_v1.zwp_linux_dmabuf_v1;

struct
zwp_linux_dmabuf_v1 {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(zwp_linux_dmabuf_v1);
  @disable this(ref zwp_linux_dmabuf_v1);
  }

  // Requests
  pragma (inline,true):
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }
  auto create_params () { return cast (zwp_linux_buffer_params_v1*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.create_params, /* ret interface: */ &zwp_linux_buffer_params_v1_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null); }
  auto get_default_feedback () { return cast (zwp_linux_dmabuf_feedback_v1*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.get_default_feedback, /* ret interface: */ &zwp_linux_dmabuf_feedback_v1_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null); }
  auto get_surface_feedback (wl_surface* surface) { return cast (zwp_linux_dmabuf_feedback_v1*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.get_surface_feedback, /* ret interface: */ &zwp_linux_dmabuf_feedback_v1_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null,surface); }

  // Events
  struct
  Listener {
    Format_cb   format   = &_format_impl_default;
    Modifier_cb modifier = &_modifier_impl_default;

    alias Format_cb   = extern (C) void function (void* ctx, zwp_linux_dmabuf_v1* _this /* args: */ , uint format);
    alias Modifier_cb = extern (C) void function (void* ctx, zwp_linux_dmabuf_v1* _this /* args: */ , uint format, uint modifier_hi, uint modifier_lo);

    extern (C)
    static
    void
    _format_impl_default (void* ctx, zwp_linux_dmabuf_v1* _this /* args: */ , uint format) {
        // 
    }

    extern (C)
    static
    void
    _modifier_impl_default (void* ctx, zwp_linux_dmabuf_v1* _this /* args: */ , uint format, uint modifier_hi, uint modifier_lo) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Opcodes
  enum
  Opcode : uint {
    destroy = 0,
    create_params = 1,
    get_default_feedback = 2,
    get_surface_feedback = 3,
  }

  alias IFACE = zwp_linux_dmabuf_v1_interface;
}

static const wl_interface*[0] zwp_linux_dmabuf_v1_destroy_requiest_interfaces = [];
static const wl_interface*[1] zwp_linux_dmabuf_v1_create_params_requiest_interfaces = [&zwp_linux_buffer_params_v1_interface];
static const wl_interface*[1] zwp_linux_dmabuf_v1_get_default_feedback_requiest_interfaces = [&zwp_linux_dmabuf_feedback_v1_interface];
static const wl_interface*[2] zwp_linux_dmabuf_v1_get_surface_feedback_requiest_interfaces = [&zwp_linux_dmabuf_feedback_v1_interface,&wl_surface_interface];
static const wl_message[4] zwp_linux_dmabuf_v1_requests = [
  wl_message ("destroy", "", zwp_linux_dmabuf_v1_destroy_requiest_interfaces.ptr),
  wl_message ("create_params", "n", zwp_linux_dmabuf_v1_create_params_requiest_interfaces.ptr),
  wl_message ("get_default_feedback", "4n", zwp_linux_dmabuf_v1_get_default_feedback_requiest_interfaces.ptr),
  wl_message ("get_surface_feedback", "4no", zwp_linux_dmabuf_v1_get_surface_feedback_requiest_interfaces.ptr),
];
static const wl_interface*[1] zwp_linux_dmabuf_v1_format_event_interfaces = [null];
static const wl_interface*[3] zwp_linux_dmabuf_v1_modifier_event_interfaces = [null,null,null];
static const wl_message[2] zwp_linux_dmabuf_v1_events = [
  wl_message ("format", "u", zwp_linux_dmabuf_v1_format_event_interfaces.ptr),
  wl_message ("modifier", "3uuu", zwp_linux_dmabuf_v1_modifier_event_interfaces.ptr),
];
extern (C) static const wl_interface zwp_linux_dmabuf_v1_interface = {
  "zwp_linux_dmabuf_v1", 5,
  zwp_linux_dmabuf_v1_requests.length, zwp_linux_dmabuf_v1_requests.ptr,
  zwp_linux_dmabuf_v1_events.length,   zwp_linux_dmabuf_v1_events.ptr,
};
// module linux_dmabuf_v1.zwp_linux_buffer_params_v1;

struct
zwp_linux_buffer_params_v1 {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(zwp_linux_buffer_params_v1);
  @disable this(ref zwp_linux_buffer_params_v1);
  }

  // Requests
  pragma (inline,true):
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }
  auto add (int fd, uint plane_idx, uint offset, uint stride, uint modifier_hi, uint modifier_lo) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.add, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , fd,plane_idx,offset,stride,modifier_hi,modifier_lo); }
  auto create (int width, int height, uint format, uint flags) {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.create, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , width,height,format,flags); }
  auto create_immed (int width, int height, uint format, uint flags) { return cast (wl_buffer*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.create_immed, /* ret interface: */ &wl_buffer_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , null,width,height,format,flags); }

  // Events
  struct
  Listener {
    Created_cb created = &_created_impl_default;
    Failed_cb  failed  = &_failed_impl_default;

    alias Created_cb = extern (C) void function (void* ctx, zwp_linux_buffer_params_v1* _this /* args: */ , wl_buffer buffer);
    alias Failed_cb  = extern (C) void function (void* ctx, zwp_linux_buffer_params_v1* _this /* args: */ );

    extern (C)
    static
    void
    _created_impl_default (void* ctx, zwp_linux_buffer_params_v1* _this /* args: */ , wl_buffer buffer) {
        // 
    }

    extern (C)
    static
    void
    _failed_impl_default (void* ctx, zwp_linux_buffer_params_v1* _this /* args: */ ) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Error {
    already_used = 0,
    plane_idx = 1,
    plane_set = 2,
    incomplete = 3,
    invalid_format = 4,
    invalid_dimensions = 5,
    out_of_bounds = 6,
    invalid_wl_buffer = 7,
  }
  enum
  Flags {
    y_invert = 1,
    interlaced = 2,
    bottom_first = 4,
  }

  // Opcodes
  enum
  Opcode : uint {
    destroy = 0,
    add = 1,
    create = 2,
    create_immed = 3,
  }

  alias IFACE = zwp_linux_buffer_params_v1_interface;
}

static const wl_interface*[0] zwp_linux_buffer_params_v1_destroy_requiest_interfaces = [];
static const wl_interface*[6] zwp_linux_buffer_params_v1_add_requiest_interfaces = [null,null,null,null,null,null];
static const wl_interface*[4] zwp_linux_buffer_params_v1_create_requiest_interfaces = [null,null,null,null];
static const wl_interface*[5] zwp_linux_buffer_params_v1_create_immed_requiest_interfaces = [&wl_buffer_interface,null,null,null,null];
static const wl_message[4] zwp_linux_buffer_params_v1_requests = [
  wl_message ("destroy", "", zwp_linux_buffer_params_v1_destroy_requiest_interfaces.ptr),
  wl_message ("add", "huuuuu", zwp_linux_buffer_params_v1_add_requiest_interfaces.ptr),
  wl_message ("create", "iiuu", zwp_linux_buffer_params_v1_create_requiest_interfaces.ptr),
  wl_message ("create_immed", "2niiuu", zwp_linux_buffer_params_v1_create_immed_requiest_interfaces.ptr),
];
static const wl_interface*[1] zwp_linux_buffer_params_v1_created_event_interfaces = [&wl_buffer_interface];
static const wl_interface*[0] zwp_linux_buffer_params_v1_failed_event_interfaces = [];
static const wl_message[2] zwp_linux_buffer_params_v1_events = [
  wl_message ("created", "n", zwp_linux_buffer_params_v1_created_event_interfaces.ptr),
  wl_message ("failed", "", zwp_linux_buffer_params_v1_failed_event_interfaces.ptr),
];
extern (C) static const wl_interface zwp_linux_buffer_params_v1_interface = {
  "zwp_linux_buffer_params_v1", 5,
  zwp_linux_buffer_params_v1_requests.length, zwp_linux_buffer_params_v1_requests.ptr,
  zwp_linux_buffer_params_v1_events.length,   zwp_linux_buffer_params_v1_events.ptr,
};
// module linux_dmabuf_v1.zwp_linux_dmabuf_feedback_v1;

struct
zwp_linux_dmabuf_feedback_v1 {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(zwp_linux_dmabuf_feedback_v1);
  @disable this(ref zwp_linux_dmabuf_feedback_v1);
  }

  // Requests
  pragma (inline,true):
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }

  // Events
  struct
  Listener {
    Done_cb                  done                  = &_done_impl_default;
    Format_table_cb          format_table          = &_format_table_impl_default;
    Main_device_cb           main_device           = &_main_device_impl_default;
    Tranche_done_cb          tranche_done          = &_tranche_done_impl_default;
    Tranche_target_device_cb tranche_target_device = &_tranche_target_device_impl_default;
    Tranche_formats_cb       tranche_formats       = &_tranche_formats_impl_default;
    Tranche_flags_cb         tranche_flags         = &_tranche_flags_impl_default;

    alias Done_cb                  = extern (C) void function (void* ctx, zwp_linux_dmabuf_feedback_v1* _this /* args: */ );
    alias Format_table_cb          = extern (C) void function (void* ctx, zwp_linux_dmabuf_feedback_v1* _this /* args: */ , int fd, uint size);
    alias Main_device_cb           = extern (C) void function (void* ctx, zwp_linux_dmabuf_feedback_v1* _this /* args: */ , wl_array* device);
    alias Tranche_done_cb          = extern (C) void function (void* ctx, zwp_linux_dmabuf_feedback_v1* _this /* args: */ );
    alias Tranche_target_device_cb = extern (C) void function (void* ctx, zwp_linux_dmabuf_feedback_v1* _this /* args: */ , wl_array* device);
    alias Tranche_formats_cb       = extern (C) void function (void* ctx, zwp_linux_dmabuf_feedback_v1* _this /* args: */ , wl_array* indices);
    alias Tranche_flags_cb         = extern (C) void function (void* ctx, zwp_linux_dmabuf_feedback_v1* _this /* args: */ , uint flags);

    extern (C)
    static
    void
    _done_impl_default (void* ctx, zwp_linux_dmabuf_feedback_v1* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _format_table_impl_default (void* ctx, zwp_linux_dmabuf_feedback_v1* _this /* args: */ , int fd, uint size) {
        // 
    }

    extern (C)
    static
    void
    _main_device_impl_default (void* ctx, zwp_linux_dmabuf_feedback_v1* _this /* args: */ , wl_array* device) {
        // 
    }

    extern (C)
    static
    void
    _tranche_done_impl_default (void* ctx, zwp_linux_dmabuf_feedback_v1* _this /* args: */ ) {
        // 
    }

    extern (C)
    static
    void
    _tranche_target_device_impl_default (void* ctx, zwp_linux_dmabuf_feedback_v1* _this /* args: */ , wl_array* device) {
        // 
    }

    extern (C)
    static
    void
    _tranche_formats_impl_default (void* ctx, zwp_linux_dmabuf_feedback_v1* _this /* args: */ , wl_array* indices) {
        // 
    }

    extern (C)
    static
    void
    _tranche_flags_impl_default (void* ctx, zwp_linux_dmabuf_feedback_v1* _this /* args: */ , uint flags) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Tranche_flags {
    scanout = 1,
  }

  // Opcodes
  enum
  Opcode : uint {
    destroy = 0,
  }

  alias IFACE = zwp_linux_dmabuf_feedback_v1_interface;
}

static const wl_interface*[0] zwp_linux_dmabuf_feedback_v1_destroy_requiest_interfaces = [];
static const wl_message[1] zwp_linux_dmabuf_feedback_v1_requests = [
  wl_message ("destroy", "", zwp_linux_dmabuf_feedback_v1_destroy_requiest_interfaces.ptr),
];
static const wl_interface*[0] zwp_linux_dmabuf_feedback_v1_done_event_interfaces = [];
static const wl_interface*[2] zwp_linux_dmabuf_feedback_v1_format_table_event_interfaces = [null,null];
static const wl_interface*[1] zwp_linux_dmabuf_feedback_v1_main_device_event_interfaces = [null];
static const wl_interface*[0] zwp_linux_dmabuf_feedback_v1_tranche_done_event_interfaces = [];
static const wl_interface*[1] zwp_linux_dmabuf_feedback_v1_tranche_target_device_event_interfaces = [null];
static const wl_interface*[1] zwp_linux_dmabuf_feedback_v1_tranche_formats_event_interfaces = [null];
static const wl_interface*[1] zwp_linux_dmabuf_feedback_v1_tranche_flags_event_interfaces = [null];
static const wl_message[7] zwp_linux_dmabuf_feedback_v1_events = [
  wl_message ("done", "", zwp_linux_dmabuf_feedback_v1_done_event_interfaces.ptr),
  wl_message ("format_table", "hu", zwp_linux_dmabuf_feedback_v1_format_table_event_interfaces.ptr),
  wl_message ("main_device", "a", zwp_linux_dmabuf_feedback_v1_main_device_event_interfaces.ptr),
  wl_message ("tranche_done", "", zwp_linux_dmabuf_feedback_v1_tranche_done_event_interfaces.ptr),
  wl_message ("tranche_target_device", "a", zwp_linux_dmabuf_feedback_v1_tranche_target_device_event_interfaces.ptr),
  wl_message ("tranche_formats", "a", zwp_linux_dmabuf_feedback_v1_tranche_formats_event_interfaces.ptr),
  wl_message ("tranche_flags", "u", zwp_linux_dmabuf_feedback_v1_tranche_flags_event_interfaces.ptr),
];
extern (C) static const wl_interface zwp_linux_dmabuf_feedback_v1_interface = {
  "zwp_linux_dmabuf_feedback_v1", 5,
  zwp_linux_dmabuf_feedback_v1_requests.length, zwp_linux_dmabuf_feedback_v1_requests.ptr,
  zwp_linux_dmabuf_feedback_v1_events.length,   zwp_linux_dmabuf_feedback_v1_events.ptr,
};
