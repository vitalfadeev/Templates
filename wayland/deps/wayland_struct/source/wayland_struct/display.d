module wayland_struct.display;

import wayland_struct.util     : wl_interface;
import wayland_struct.util     : wl_event_queue;
import wayland_struct.util     : timespec;

import wayland_struct.util     : wl_message;
import wayland_struct.util     : wl_display;
import wayland_struct.proxy    : wl_proxy;
import wayland_struct.proxy    : wl_proxy_marshal_constructor,wl_proxy_marshal_flags,wl_proxy_get_version;

enum display_opcode_sync = 0;
enum display_opcode_get_registry = 1;


extern (C) {
//struct wl_display;

// wl_display_get_registry
//wl_registry*    wl_display_get_registry (wl_display* wl_display);
// wl_display_bind
// auto wl_display_bind (wl_display* wl_display_, uint name) { return wl_proxy_marshal_flags (wl_display_, opcode.bind, &new_id.interface, wl_proxy_get_version (wl_display_), 0, null, name);  }
wl_display*     wl_display_connect (const (char*) name);
wl_display*     wl_display_connect_to_fd (int fd);
int             wl_display_get_fd (wl_display* display);
void            wl_display_set_max_buffer_size (wl_display* display, size_t max_buffer_size);
int             wl_display_dispatch (wl_display* display);
int             wl_display_dispatch_queue (wl_display* display, wl_event_queue* queue);
int             wl_display_dispatch_queue_pending (wl_display* display, wl_event_queue* queue);
int             wl_display_dispatch_queue_timeout (wl_display* display, wl_event_queue* queue, const timespec* timeout);
int             wl_display_dispatch_pending (wl_display* display);
int             wl_display_get_error (wl_display* display);
uint            wl_display_get_protocol_error (wl_display* display, const (wl_interface*)* iface, uint* id);
int             wl_display_flush (wl_display* display);
int             wl_display_roundtrip_queue (wl_display* display, wl_event_queue* queue);
int             wl_display_roundtrip (wl_display* display);
wl_event_queue* wl_display_create_queue (wl_display* display);
wl_event_queue* wl_display_create_queue_with_name (wl_display* display, const char* name);
int             wl_display_prepare_read_queue (wl_display* display, wl_event_queue* queue);
int             wl_display_prepare_read (wl_display* display);
void            wl_display_cancel_read (wl_display* display);
int             wl_display_read_events (wl_display* display);
void            wl_display_disconnect (wl_display* display);
}

//alias get_registry           = wl_display_get_registry;
//alias bind                   = wl_display_bind;
alias create_queue           = wl_display_create_queue;
alias create_queue_with_name = wl_display_create_queue_with_name;
alias dispatch               = wl_display_dispatch;
alias dispatch_pending       = wl_display_dispatch_pending;
alias dispatch_queue         = wl_display_dispatch_queue;
alias dispatch_queue_pending = wl_display_dispatch_queue_pending;
alias dispatch_queue_timeout = wl_display_dispatch_queue_timeout;
alias roundtrip              = wl_display_roundtrip;
alias roundtrip_queue        = wl_display_roundtrip_queue;
alias read_events            = wl_display_read_events;
alias disconnect             = wl_display_disconnect;
alias prepare_read_queue     = wl_display_prepare_read_queue;
alias prepare_read           = wl_display_prepare_read;
alias cancel_read            = wl_display_cancel_read;
alias get_error              = wl_display_get_error;
alias get_protocol_error     = wl_display_get_protocol_error;
alias flush                  = wl_display_flush;
alias get_fd                 = wl_display_get_fd;
alias set_max_buffer_size    = wl_display_set_max_buffer_size;


//struct
//wl_display {
//  wl_proxy* _super;
//  alias _super this;

//  // Requests
//  pragma (inline,true):
//  auto sync () { return cast (wl_callback) wl_proxy_marshal_flags (_super, opcode.sync, &wl_callback.interface_, wl_proxy_get_version (_super), 0, null);  }
//  auto get_registry () { return cast (wl_registry) wl_proxy_marshal_flags (_super, opcode.get_registry, &wl_registry.interface_, wl_proxy_get_version (_super), 0, null);  }

//  // Events
//  struct
//  Listener {
//    error_cb error;
//    delete_id_cb delete_id;

//    alias error_cb = void function (void* data, wl_display* _wl_display, void* object_id, uint code, const(char)* message);
//    alias delete_id_cb = void function (void* data, wl_display* _wl_display, uint id);
//  }

//  // Enums
//  enum
//  error_ {
//    invalid_object = 0,
//    invalid_method = 1,
//    no_memory = 2,
//    implementation = 3,
//  }

//  // Opcodes
//  enum
//  opcode : uint {
//    sync = 0,
//    get_registry = 1,
//  }

//  // Interface
//  static const wl_message[1] _requests  = [wl_message ()];
//  static const wl_message[1] _events    = [wl_message ()];
//  static const wl_interface interface_ = {
//    "wl_display", 1,
//    2, _requests.ptr,
//    2, _events.ptr
//  };
//}
