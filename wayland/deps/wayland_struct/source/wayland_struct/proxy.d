module wayland_struct.proxy;

public 
import wayland_struct.util : wl_proxy;
import wayland_struct.util : wl_message;
import wayland_struct.util : wl_interface;
import wayland_struct.util : wl_fixed_t;
import wayland_struct.util : wl_array;
import wayland_struct.util : wl_argument;
import wayland_struct.util : wl_event_queue;
import wayland_struct.util : uint32_t;
import wayland_struct.util : wl_dispatcher_func_t;
import wayland_struct.util : wl_proxy_callback;

enum WL_MARSHAL_FLAG_DESTROY = (1 << 0);


extern (C) {
wl_proxy*       wl_proxy_create                              (wl_proxy* factory, const (wl_interface*) iface);
void            wl_proxy_marshal                             (wl_proxy* p, uint opcode, ...);
wl_proxy*       wl_proxy_marshal_constructor                 (wl_proxy* proxy, uint opcode, const (wl_interface*) iface, ...);
wl_proxy*       wl_proxy_marshal_constructor_versioned       (wl_proxy* proxy, uint32_t opcode, const wl_interface *interface_, uint32_t version_, ...);
wl_proxy*       wl_proxy_marshal_flags                       (wl_proxy* proxy, uint32_t opcode, const wl_interface* interface_, uint32_t version_, uint32_t flags, ...);
void            wl_proxy_marshal_array                       (wl_proxy* p, uint opcode, wl_argument* args);
wl_proxy*       wl_proxy_marshal_array_constructor           (wl_proxy* proxy, uint opcode, wl_argument* args, const (wl_interface*) iface);
wl_proxy*       wl_proxy_marshal_array_flags                 (wl_proxy* proxy, uint32_t opcode, const wl_interface* interface_, uint32_t version_, uint32_t flags, wl_argument* args);
wl_proxy*       wl_proxy_marshal_array_constructor_versioned (wl_proxy* proxy, uint32_t opcode, wl_argument* args, const wl_interface* interface_, uint32_t version_);
int             wl_proxy_add_listener                        (wl_proxy* proxy, wl_proxy_callback*, void* data);
const (void*)   wl_proxy_get_listener                        (wl_proxy* proxy);
int             wl_proxy_add_dispatcher                      (wl_proxy* proxy, wl_dispatcher_func_t dispatcher_func, const (void*)  dispatcher_data, void* data);
void            wl_proxy_set_user_data                       (wl_proxy* proxy, void* user_data);
void*           wl_proxy_get_user_data                       (wl_proxy* proxy);
uint            wl_proxy_get_id                              (wl_proxy* proxy);
const (char*)   wl_proxy_get_class                           (wl_proxy* proxy);
void            wl_proxy_set_queue                           (wl_proxy* proxy, wl_event_queue* queue);
void*           wl_proxy_create_wrapper                      (void*     proxy);
void            wl_proxy_wrapper_destroy                     (void*     proxy_wrapper);
uint32_t        wl_proxy_get_version                         (wl_proxy* proxy);
void            wl_proxy_set_tag                             (wl_proxy* proxy, const char** tag);
char**          wl_proxy_get_tag                             (wl_proxy* proxy);
void            wl_proxy_destroy                             (wl_proxy* proxy);
}

alias create                              = wl_proxy_create;
alias create_wrapper                      = wl_proxy_create_wrapper;
alias marshal                             = wl_proxy_marshal;
alias marshal_constructor                 = wl_proxy_marshal_constructor;
alias marshal_constructor_versioned       = wl_proxy_marshal_constructor_versioned;
alias marshal_flags                       = wl_proxy_marshal_flags;
alias marshal_array_flags                 = wl_proxy_marshal_array_flags;
alias marshal_array                       = wl_proxy_marshal_array;
alias marshal_array_constructor           = wl_proxy_marshal_array_constructor;
alias marshal_array_constructor_versioned = wl_proxy_marshal_array_constructor_versioned;
alias add_listener                        = wl_proxy_add_listener;
alias get_listener                        = wl_proxy_get_listener;
alias add_dispatcher                      = wl_proxy_add_dispatcher;
alias set_user_data                       = wl_proxy_set_user_data;
alias get_user_data                       = wl_proxy_get_user_data;
alias get_version                         = wl_proxy_get_version;
alias get_id                              = wl_proxy_get_id;
alias set_tag                             = wl_proxy_set_tag;
alias get_tag                             = wl_proxy_get_tag;
alias get_class                           = wl_proxy_get_class;
alias set_queue                           = wl_proxy_set_queue;
alias wrapper_destroy                     = wl_proxy_wrapper_destroy;
//alias destroy                             = wl_proxy_destroy;
