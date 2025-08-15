// Generated with wayland-scanner-d
// protocol presentation_time
module wayland_struct.protocol.presentation_time;

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

// module presentation_time.wp_presentation;

struct
wp_presentation {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wp_presentation);
  @disable this(ref wp_presentation);
  }

  // Requests
  pragma (inline,true):
  auto destroy () {  wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.destroy, /* ret interface: */ null, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ WL_MARSHAL_FLAG_DESTROY /* request args: */ ); }
  auto feedback (wl_surface* surface) { return cast (wp_presentation_feedback*) wl_proxy_marshal_flags (cast (wl_proxy*) &this, Opcode.feedback, /* ret interface: */ &wp_presentation_feedback_interface, /* version: */ wl_proxy_get_version (cast (wl_proxy *) &this), /* flags: */ 0 /* request args: */ , surface,null); }

  // Events
  struct
  Listener {
    clock_id_cb clock_id = &_clock_id_impl_default;

    alias clock_id_cb = extern (C) void function (void* ctx, wp_presentation* _this /* args: */ , uint clk_id);

    extern (C)
    static
    void
    _clock_id_impl_default (void* ctx, wp_presentation* _this /* args: */ , uint clk_id) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Error {
    invalid_timestamp = 0,
    invalid_flag = 1,
  }

  // Opcodes
  enum
  Opcode : uint {
    destroy = 0,
    feedback = 1,
  }

  alias IFACE = wp_presentation_interface;
}

static const wl_interface*[0] wp_presentation_destroy_requiest_interfaces = [];
static const wl_interface*[2] wp_presentation_feedback_requiest_interfaces = [&wl_surface_interface,&wp_presentation_feedback_interface];
static const wl_message[2] wp_presentation_requests = [
  wl_message ("destroy", "", wp_presentation_destroy_requiest_interfaces.ptr),
  wl_message ("feedback", "on", wp_presentation_feedback_requiest_interfaces.ptr),
];
static const wl_interface*[1] wp_presentation_clock_id_event_interfaces = [null];
static const wl_message[1] wp_presentation_events = [
  wl_message ("clock_id", "u", wp_presentation_clock_id_event_interfaces.ptr),
];
extern (C) static const wl_interface wp_presentation_interface = {
  "wp_presentation", 2,
  wp_presentation_requests.length, wp_presentation_requests.ptr,
  wp_presentation_events.length,   wp_presentation_events.ptr,
};
// module presentation_time.wp_presentation_feedback;

struct
wp_presentation_feedback {
  version (D_BetterC) {} else {
  @disable this();
  @disable this(wp_presentation_feedback);
  @disable this(ref wp_presentation_feedback);
  }

  // Events
  struct
  Listener {
    sync_output_cb sync_output = &_sync_output_impl_default;
    presented_cb   presented   = &_presented_impl_default;
    discarded_cb   discarded   = &_discarded_impl_default;

    alias sync_output_cb = extern (C) void function (void* ctx, wp_presentation_feedback* _this /* args: */ , wl_output* output);
    alias presented_cb   = extern (C) void function (void* ctx, wp_presentation_feedback* _this /* args: */ , uint tv_sec_hi, uint tv_sec_lo, uint tv_nsec, uint refresh, uint seq_hi, uint seq_lo, uint flags);
    alias discarded_cb   = extern (C) void function (void* ctx, wp_presentation_feedback* _this /* args: */ );

    extern (C)
    static
    void
    _sync_output_impl_default (void* ctx, wp_presentation_feedback* _this /* args: */ , wl_output* output) {
        // 
    }

    extern (C)
    static
    void
    _presented_impl_default (void* ctx, wp_presentation_feedback* _this /* args: */ , uint tv_sec_hi, uint tv_sec_lo, uint tv_nsec, uint refresh, uint seq_hi, uint seq_lo, uint flags) {
        // 
    }

    extern (C)
    static
    void
    _discarded_impl_default (void* ctx, wp_presentation_feedback* _this /* args: */ ) {
        // 
    }
  }

  // Event listener
  auto add_listener (Listener* impl, void* ctx) { return wl_proxy_add_listener (cast(wl_proxy*)&this, cast (wl_proxy_callback*) impl, ctx); }

  // Enums
  enum
  Kind {
    vsync = 0x1,
    hw_clock = 0x2,
    hw_completion = 0x4,
    zero_copy = 0x8,
  }

  alias IFACE = wp_presentation_feedback_interface;
}

static const wl_message[0] wp_presentation_feedback_requests = [
];
static const wl_interface*[1] wp_presentation_feedback_sync_output_event_interfaces = [&wl_output_interface];
static const wl_interface*[7] wp_presentation_feedback_presented_event_interfaces = [null,null,null,null,null,null,null];
static const wl_interface*[0] wp_presentation_feedback_discarded_event_interfaces = [];
static const wl_message[3] wp_presentation_feedback_events = [
  wl_message ("sync_output", "o", wp_presentation_feedback_sync_output_event_interfaces.ptr),
  wl_message ("presented", "uuuuuuu", wp_presentation_feedback_presented_event_interfaces.ptr),
  wl_message ("discarded", "", wp_presentation_feedback_discarded_event_interfaces.ptr),
];
extern (C) static const wl_interface wp_presentation_feedback_interface = {
  "wp_presentation_feedback", 2,
  wp_presentation_feedback_requests.length, wp_presentation_feedback_requests.ptr,
  wp_presentation_feedback_events.length,   wp_presentation_feedback_events.ptr,
};
