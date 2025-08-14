module wayland_struct.util;

extern (C):
struct wl_object;
struct wl_proxy;
struct wl_display;
struct wl_event_queue;
struct timespec;

alias uint32_t             = uint;
alias wl_fixed_t           = int;
alias new_id               = void*;
alias wl_dispatcher_func_t = extern (C) int  function (const (void*), void*, uint, const (wl_message*), wl_argument*);
alias wl_log_func_t        = extern (C) void function (const (char*), ...);
alias wl_proxy_callback    = extern (C) void function ();

struct 
wl_array {
    size_t size;
    size_t alloc;
    void*  data;
}

struct 
wl_message {
    const (char*)           name;
    const (char*)           signature;
    const (wl_interface*)*  types;
}

struct 
wl_interface {
    const (char*)       name;
    int                 ver;
    int                 method_count;
    const (wl_message*) methods;
    int                 event_count;
    const (wl_message*) events;
}

union 
wl_argument {
    int           i; // signed integer
    uint          u; // unsigned integer
    wl_fixed_t    f; // fixed point
    const (char*) s; // string
    wl_object*    o; // object
    uint          n; // new_id
    wl_array*     a; // array
    int           h; // file descriptor
}

//struct 
//wl_object {
//    wl_interface* interface;
//    void*         implementation;
//    uint32_t      id;
//};

//wl_interface 
//foo_interface = wl_interface (
//    "foo", 1,
//    2, foo_requests,
//    1, foo_events
//);


