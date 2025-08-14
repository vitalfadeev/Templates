import std.stdio             : writeln,writefln;
import std.string            : fromStringz;
import core.sys.posix.fcntl  : open;
import core.sys.posix.unistd : close;
import core.sys.posix.poll   : poll,pollfd,POLLIN,POLLHUP,POLLERR;
import core.sys.posix.time   : clock_gettime,timespec,CLOCK_MONOTONIC;
import core.stdc.errno       : errno;
import core.stdc.stdio       : printf;
import libinput_d;
import udev_d;


struct
LibInput {
    libinput*           _li;
    udev*               _udev;
    libinput_interface _interface;
    InpEvent            event;
    pollfd              _fds;
    int                 wait_tineout = -1;

    this (libinput* _li) {
        if (_li is null)
            _init ();
        else
            this._li = _li;
    }

    ~this () {
        _quit ();
    }

    //int
    //opApply (int delegate (Event event) dg) {
    //    pollfd fds;

    //    fds.fd = get_fd ();
    //    fds.events = POLLIN;
    //    fds.revents = 0;

    //    do {
    //        for (dispatch (), event = get_event ();
    //            event != null; 
    //            event.destroy (), dispatch (), event = get_event ()
    //        ) {
    //            // dg
    //            if (auto result = dg (event)) {
    //                event.destroy ();
    //                return result;  // EXIT
    //            }
 
    //            // add device for listen
    //            switch (event.type) {
    //                case LIBINPUT_EVENT_DEVICE_ADDED: {
    //                    auto _dev =  event.device;
    //                    _dev.config.send_events_set_mode (LIBINPUT_CONFIG_SEND_EVENTS_ENABLED);
    //                    if (_dev.has_capability (LIBINPUT_DEVICE_CAP_TOUCH))
    //                        _dev.ref_ ();
    //                    break;
    //                }
    //                default:
    //            }
    //        }
    //    } while (poll (&fds, 1, wait_tineout) > 0);

    //    return 0;
    //} 

    InpEvent
    front () {
        return event;
    }

    bool
    empty () {  // wait on empty
    _read_again:
        dispatch ();
        event = get_event ();

        if (event is null) {
            _wait_event_on_device ();
            goto _read_again;
        }

        // add device for listen
        switch (event.type) {
            case LIBINPUT_EVENT_DEVICE_ADDED: {
                auto _dev =  event.device;
                _dev.config.send_events_set_mode (LIBINPUT_CONFIG_SEND_EVENTS_ENABLED);
                if (_dev.has_capability (LIBINPUT_DEVICE_CAP_TOUCH))
                    _dev.ref_ ();
                break;
            }
            default:
        }

        return false;
    }

    void
    popFront () {
        event.destroy ();
    }

    void
    _wait_event_on_device () {
        if ((poll (&_fds, 1, wait_tineout) > 0) > 0)  // 0 = timeout
            {} // OK
        else 
            throw new Exception ("device read error");
    }

    void
    opOpAssign (string op : "~",What) (What b) {
        //if (b !is null) {
        //    // put event What
        //}
    }

    extern (C)
    static int 
    _open_restricted (const char *path, int flags, void *user_data) {
        int fd = open (path, flags);
        return fd < 0 ? -errno : fd;
    }

    extern (C)
    static void 
    _close_restricted (int fd, void *user_data) {
        close (fd);
    }

    // add input devices
    void
    _init () {
        _udev = udev_new ();
        _interface.open_restricted  = &_open_restricted;
        _interface.close_restricted = &_close_restricted;

        _li = udev_create_context (&_interface, null, _udev);

        if (!_li)
            throw new Exception ("libevent: udev: init [FAIL] ");

        udev_assign_seat ("seat0");

        //
        _fds = pollfd (get_fd (), POLLIN, 0);
    }

    void
    _quit () {
        unref ();       
    }


    pragma (inline,true):
    int         dispatch ()  { return libinput_dispatch (_li); }
    InpEvent    get_event () { return cast (InpEvent) (libinput_get_event (_li)); }
    libinput*   unref ()     { return libinput_unref (_li); }
    int         get_fd ()    { return libinput_get_fd (_li); }
    int         udev_assign_seat (const(char)* seat_id) { return libinput_udev_assign_seat (_li,seat_id); }
    libinput*   udev_create_context (const(libinput_interface)* interface_,void* user_data,udev* udev) { return libinput_udev_create_context (interface_,user_data,udev); }

}

struct
InpEvent {
    libinput_event* event;
    alias event this;
    //@disable this ();

    pragma (inline,true):
    libinput_event_type             type ()                         { return libinput_event_get_type (event); }
    libinput*                       get_context ()                  { return libinput_event_get_context (event); }
    libinput_event_pointer*         get_pointer_event ()            { return libinput_event_get_pointer_event (event); }
    libinput_event_keyboard*        get_keyboard_event ()           { return libinput_event_get_keyboard_event (event); }
    libinput_event_touch*           get_touch_event ()              { return libinput_event_get_touch_event (event); }
    libinput_event_gesture*         get_gesture_event ()            { return libinput_event_get_gesture_event (event); }
    libinput_event_tablet_tool*     get_tablet_tool_event ()        { return libinput_event_get_tablet_tool_event (event); }
    libinput_event_device_notify*   get_device_notify_event ()      { return libinput_event_get_device_notify_event (event); }
    //libinput_event*                 device_notify_get_base_event () { return libinput_event_device_notify_get_base_event (libinput_event_device_notify* event);
    Device                          device  ()                      { return (cast (Device) (libinput_event_get_device (event))); }
    Pointer                         pointer ()                      { return (cast (Pointer) (libinput_event_get_pointer_event (event))); }
    Keyboard                        keyboard ()                     { return (cast (Keyboard) (libinput_event_get_keyboard_event (event))); }
    Touch                           touch ()                        { return (cast (Touch) (libinput_event_get_touch_event (event))); }
    Tablet_Tool                     tablet ()                       { return (cast (Tablet_Tool) (libinput_event_get_tablet_tool_event (event))); }

    void                            destroy ()                      {        libinput_event_destroy (event); }


    string
    toString () {
        import std.format : format;
        import std.conv   : to;

        switch (type) {
            case LIBINPUT_EVENT_DEVICE_ADDED:
            case LIBINPUT_EVENT_DEVICE_REMOVED:
                return format!"%s: %s" (
                    type, 
                    device.name.to!string);
            case LIBINPUT_EVENT_KEYBOARD_KEY:
                return format!"%s: %d: %s: %s" ( 
                    type, 
                    keyboard.get_key,  // KEY_1,KEY_ESC,KEY_BACKSPACE
                    keyboard.get_key_state,
                    keyboard.get_key.decode_key);
            case LIBINPUT_EVENT_POINTER_MOTION:
                return format!"%s: dx,dy: %f,%f" (
                    type, 
                    pointer.dx, 
                    pointer.dy); 
            case LIBINPUT_EVENT_POINTER_MOTION_ABSOLUTE:
                return format!"%s: abs_x,abx_y: %f,%f" (
                    type, 
                    pointer.absolute_x, 
                    pointer.absolute_y);
            case LIBINPUT_EVENT_POINTER_BUTTON:
                return format!"%s: %d %s: %s" (
                    type, 
                    pointer.button,  // BTN_LEFT,BTN_RIGHT,BTN_MIDDLE
                    pointer.button_state,
                    decode_btn (pointer.button));
            case LIBINPUT_EVENT_POINTER_AXIS:
                return format!"%s: axe_source: %s: x,y: %f,%f" (
                    type, 
                    pointer.axis_source, 
                    pointer.axis_value (LIBINPUT_POINTER_AXIS_SCROLL_HORIZONTAL), 
                    pointer.axis_value (LIBINPUT_POINTER_AXIS_SCROLL_VERTICAL));
            case LIBINPUT_EVENT_TOUCH_DOWN:
            case LIBINPUT_EVENT_TOUCH_UP:
            case LIBINPUT_EVENT_TOUCH_MOTION:
            case LIBINPUT_EVENT_TOUCH_CANCEL:
            case LIBINPUT_EVENT_TOUCH_FRAME:
                return format!"%s" (type);
            case LIBINPUT_EVENT_TABLET_TOOL_AXIS:
            case LIBINPUT_EVENT_TABLET_TOOL_PROXIMITY:
            case LIBINPUT_EVENT_TABLET_TOOL_TIP:
            case LIBINPUT_EVENT_TABLET_TOOL_BUTTON:
                return format!"%s" (type);
            case LIBINPUT_EVENT_GESTURE_SWIPE_BEGIN:
            case LIBINPUT_EVENT_GESTURE_SWIPE_UPDATE:
            case LIBINPUT_EVENT_GESTURE_SWIPE_END:
            case LIBINPUT_EVENT_GESTURE_PINCH_BEGIN:
            case LIBINPUT_EVENT_GESTURE_PINCH_UPDATE:
            case LIBINPUT_EVENT_GESTURE_PINCH_END:
                return format!"%s" (type);
            default:
                return format!"%s" (type);
        }
    }

    enum
    Type : ushort {
        NONE                    = libinput_event_type.LIBINPUT_EVENT_NONE,
        DEVICE_ADDED            = libinput_event_type.LIBINPUT_EVENT_DEVICE_ADDED,
        DEVICE_REMOVED          = libinput_event_type.LIBINPUT_EVENT_DEVICE_REMOVED,
        KEYBOARD_KEY            = libinput_event_type.LIBINPUT_EVENT_KEYBOARD_KEY,
        POINTER_MOTION          = libinput_event_type.LIBINPUT_EVENT_POINTER_MOTION,
        POINTER_MOTION_ABSOLUTE = libinput_event_type.LIBINPUT_EVENT_POINTER_MOTION_ABSOLUTE,
        POINTER_BUTTON          = libinput_event_type.LIBINPUT_EVENT_POINTER_BUTTON,
        POINTER_AXIS            = libinput_event_type.LIBINPUT_EVENT_POINTER_AXIS,
        POINTER_AXIS_           = 404,
        TOUCH_DOWN              = libinput_event_type.LIBINPUT_EVENT_TOUCH_DOWN,
        TOUCH_UP                = libinput_event_type.LIBINPUT_EVENT_TOUCH_UP,
        TOUCH_MOTION            = libinput_event_type.LIBINPUT_EVENT_TOUCH_MOTION,
        TOUCH_CANCEL            = libinput_event_type.LIBINPUT_EVENT_TOUCH_CANCEL,
        TABLET_TOOL_AXIS        = libinput_event_type.LIBINPUT_EVENT_TABLET_TOOL_AXIS,
        TABLET_TOOL_PROXIMITY   = libinput_event_type.LIBINPUT_EVENT_TABLET_TOOL_PROXIMITY,
        TABLET_TOOL_TIP         = libinput_event_type.LIBINPUT_EVENT_TABLET_TOOL_TIP,
        TABLET_TOOL_BUTTON      = libinput_event_type.LIBINPUT_EVENT_TABLET_TOOL_BUTTON,
        GESTURE_SWIPE_BEGIN     = libinput_event_type.LIBINPUT_EVENT_GESTURE_SWIPE_BEGIN,
        GESTURE_SWIPE_UPDATE    = libinput_event_type.LIBINPUT_EVENT_GESTURE_SWIPE_UPDATE,
        GESTURE_SWIPE_END       = libinput_event_type.LIBINPUT_EVENT_GESTURE_SWIPE_END,
        GESTURE_PINCH_BEGIN     = libinput_event_type.LIBINPUT_EVENT_GESTURE_PINCH_BEGIN,
        GESTURE_PINCH_UPDATE    = libinput_event_type.LIBINPUT_EVENT_GESTURE_PINCH_UPDATE,
        GESTURE_PINCH_END       = libinput_event_type.LIBINPUT_EVENT_GESTURE_PINCH_END,
    }
}
//syn       = EV_SYN,
//key       = EV_KEY,
//rel       = EV_REL,
//abs       = EV_ABS,
//msc       = EV_MSC,
//sw        = EV_SW,
//led       = EV_LED,
//snd       = EV_SND,
//rep       = EV_REP,
//ff        = EV_FF,
//pwr       = EV_PWR,
//ff_status = EV_FF_STATUS,
//max       = EV_MAX,
//// custom
//draw      = EV_MAX + 1,

struct
Device {
    libinput_device* device;
    alias device this;
    //@disable this ();
    
    pragma (inline,true):
    libinput_device*                        ref_ ()                         { return libinput_device_ref (device); }
    libinput_device*                        unref ()                        { return libinput_device_unref (device); }
    void                                    user_data (void* user_data)     {        libinput_device_set_user_data (device, user_data); }
    void*                                   user_data ()                    { return libinput_device_get_user_data (device); }
    libinput*                               get_context ()                  { return libinput_device_get_context (device); }
    libinput_device_group*                  device_group ()                 { return libinput_device_get_device_group (device); }
    const(char)*                            sysname ()                      { return libinput_device_get_sysname (device); }
    const(char)*                            name ()                         { return libinput_device_get_name (device); }
    uint                                    id_product ()                   { return libinput_device_get_id_product (device); }
    uint                                    id_vendor ()                    { return libinput_device_get_id_vendor (device); }
    const(char)*                            output_name ()                  { return libinput_device_get_output_name (device); }
    libinput_seat*                          seat ()                         { return libinput_device_get_seat (device); }
    int                                     set_seat_logical_name (const(char)* name) { return libinput_device_set_seat_logical_name (device,name); }
    udev_device*                            get_udev_device ()              { return libinput_device_get_udev_device (device); }
    void                                    led_update (libinput_led leds)  {        libinput_device_led_update (device, leds); }
    int                                     has_capability (libinput_device_capability capability) { return libinput_device_has_capability (device, capability); }
    int                                     get_size (double* width,double* height)                         { return libinput_device_get_size (device,width,height); }
    int                                     pointer_has_button (uint code)          { return libinput_device_pointer_has_button (device, code); }
    int                                     keyboard_has_key (uint code)    { return libinput_device_keyboard_has_key (device, code); }
    Config                                  config () { return (cast (Config) device); }
}

struct
Config {
    libinput_device* device;
    alias device this;
//    @disable this ();

    int                                     tap_get_finger_count ()  { return libinput_device_config_tap_get_finger_count (device); }
    libinput_config_status                  tap_set_enabled (libinput_config_tap_state enable)                      { return libinput_device_config_tap_set_enabled (device,enable); }
    libinput_config_tap_state               tap_get_enabled ()       { return libinput_device_config_tap_get_enabled (device); }
    libinput_config_tap_state               tap_get_default_enabled ()              { return libinput_device_config_tap_get_default_enabled (device); }
    libinput_config_status                  tap_set_drag_lock_enabled (libinput_config_drag_lock_state enable)            { return libinput_device_config_tap_set_drag_lock_enabled (device, enable); }
    libinput_config_drag_lock_state         tap_get_drag_lock_enabled ()    { return libinput_device_config_tap_get_drag_lock_enabled (device); }
    libinput_config_drag_lock_state         tap_get_default_drag_lock_enabled () { return libinput_device_config_tap_get_default_drag_lock_enabled (device); }
    int                                     calibration_has_matrix ()       { return libinput_device_config_calibration_has_matrix (device); }
    libinput_config_status                  calibration_set_matrix (ref const(float)[6] matrix)       { return libinput_device_config_calibration_set_matrix (device, matrix); }
    int                                     calibration_get_matrix (ref float[6] matrix)       { return libinput_device_config_calibration_get_matrix (device, matrix); }
    int                                     calibration_get_default_matrix (ref float[6] matrix) { return libinput_device_config_calibration_get_default_matrix (device, matrix); }
    uint                                    send_events_get_modes ()        { return libinput_device_config_send_events_get_modes (device); }
    libinput_config_status                  send_events_set_mode (uint mode)         { return libinput_device_config_send_events_set_mode (device,mode); }
    uint                                    send_events_get_mode ()         { return libinput_device_config_send_events_get_mode (device); }
    uint                                    send_events_get_default_mode () { return libinput_device_config_send_events_get_default_mode (device); }
    int                                     accel_is_available ()           { return libinput_device_config_accel_is_available (device); }
    libinput_config_status                  accel_set_speed (double speed)              { return libinput_device_config_accel_set_speed (device, speed); }
    double                                  accel_get_speed ()              { return libinput_device_config_accel_get_speed (device); }
    double                                  accel_get_default_speed ()      { return libinput_device_config_accel_get_default_speed (device); }
    uint                                    accel_get_profiles ()           { return libinput_device_config_accel_get_profiles (device); }
    libinput_config_status                  accel_set_profile (libinput_config_accel_profile mode)            { return libinput_device_config_accel_set_profile (device, mode); }
    libinput_config_accel_profile           accel_get_profile ()            { return libinput_device_config_accel_get_profile (device); }
    libinput_config_accel_profile           config_accel_get_default_profile ()    { return libinput_device_config_accel_get_default_profile (device); }
    int                                     scroll_has_natural_scroll ()    { return libinput_device_config_scroll_has_natural_scroll (device); }
    libinput_config_status                  scroll_set_natural_scroll_enabled (int enable) { return libinput_device_config_scroll_set_natural_scroll_enabled (device,enable); }
    int                                     scroll_get_natural_scroll_enabled () { return libinput_device_config_scroll_get_natural_scroll_enabled (device); }
    int                                     scroll_get_default_natural_scroll_enabled () { return libinput_device_config_scroll_get_default_natural_scroll_enabled (device); }
    int                                     left_handed_is_available ()     { return libinput_device_config_left_handed_is_available (device); }
    libinput_config_status                  left_handed_set (int left_handed)              { return libinput_device_config_left_handed_set (device,left_handed); }
    int                                     left_handed_get ()              { return libinput_device_config_left_handed_get (device); }
    int                                     left_handed_get_default ()      { return libinput_device_config_left_handed_get_default (device); }
    uint                                    click_get_methods ()            { return libinput_device_config_click_get_methods (device); }
    libinput_config_status                  click_set_method (libinput_config_click_method method)             { return libinput_device_config_click_set_method (device, method); }
    libinput_config_click_method            click_get_method ()             { return libinput_device_config_click_get_method (device); }
    libinput_config_click_method            click_get_default_method ()     { return libinput_device_config_click_get_default_method (device); }
    int                                     middle_emulation_is_available () { return libinput_device_config_middle_emulation_is_available (device); }
    libinput_config_status                  middle_emulation_set_enabled (libinput_config_middle_emulation_state enable) { return libinput_device_config_middle_emulation_set_enabled (device, enable); }
    libinput_config_middle_emulation_state  middle_emulation_get_enabled () { return libinput_device_config_middle_emulation_get_enabled (device); }
    libinput_config_middle_emulation_state  middle_emulation_get_default_enabled () { return libinput_device_config_middle_emulation_get_default_enabled (device); }
    uint                                    scroll_get_methods ()           { return libinput_device_config_scroll_get_methods (device); }
    libinput_config_status                  scroll_set_method (libinput_config_scroll_method method)            { return libinput_device_config_scroll_set_method (device, method); }
    libinput_config_scroll_method           scroll_get_method ()            { return libinput_device_config_scroll_get_method (device); }
    libinput_config_scroll_method           scroll_get_default_method ()    { return libinput_device_config_scroll_get_default_method (device); }
    libinput_config_status                  scroll_set_button (uint button) { return libinput_device_config_scroll_set_button (device, button); }
    uint                                    scroll_get_button ()            { return libinput_device_config_scroll_get_button (device); }
    uint                                    scroll_get_default_button ()    { return libinput_device_config_scroll_get_default_button (device); }
    int                                     dwt_is_available ()             { return libinput_device_config_dwt_is_available (device); }
    libinput_config_status                  dwt_set_enabled (libinput_config_dwt_state enable)              { return libinput_device_config_dwt_set_enabled (device, enable); }
    libinput_config_dwt_state               dwt_get_enabled ()              { return libinput_device_config_dwt_get_enabled (device); }
    libinput_config_dwt_state               dwt_get_default_enabled ()      { return libinput_device_config_dwt_get_default_enabled (device); }
}

struct
Pointer {
    libinput_event_pointer* event;
    alias event this;
//    @disable this ();

    pragma (inline,true):
    uint                         time ()                                          { return libinput_event_pointer_get_time (event); }
    ulong                        time_usec ()                                     { return libinput_event_pointer_get_time_usec (event); }
    double                       dx ()                                            { return libinput_event_pointer_get_dx (event); }
    double                       dy ()                                            { return libinput_event_pointer_get_dy (event); }
    double                       dx_unaccelerated ()                              { return libinput_event_pointer_get_dx_unaccelerated (event); }
    double                       dy_unaccelerated ()                              { return libinput_event_pointer_get_dy_unaccelerated (event); }
    double                       absolute_x ()                                    { return libinput_event_pointer_get_absolute_x (event); }
    double                       absolute_y ()                                    { return libinput_event_pointer_get_absolute_y (event); }
    double                       absolute_x_transformed (uint width)              { return libinput_event_pointer_get_absolute_x_transformed (event, width); }
    double                       absolute_y_transformed (uint height)             { return libinput_event_pointer_get_absolute_y_transformed (event, height); }
    uint                         button ()                                        { return libinput_event_pointer_get_button (event); }
    libinput_button_state        button_state ()                                  { return libinput_event_pointer_get_button_state (event); }
    uint                         seat_button_count ()                             { return libinput_event_pointer_get_seat_button_count (event); }
    int                          has_axis (libinput_pointer_axis axis)            { return libinput_event_pointer_has_axis (event,axis); }
    double                       axis_value (libinput_pointer_axis axis)          { return libinput_event_pointer_get_axis_value (event,axis); }
    libinput_pointer_axis_source axis_source ()                                   { return libinput_event_pointer_get_axis_source (event); }
    double                       axis_value_discrete (libinput_pointer_axis axis) { return libinput_event_pointer_get_axis_value_discrete (event,axis); }
    libinput_event*              base_event ()                                    { return libinput_event_pointer_get_base_event (event); }
}

struct
Keyboard {
    libinput_event_keyboard* event;
    alias event this;
//    @disable this ();

    pragma (inline,true):
    uint                get_time ()             { return libinput_event_keyboard_get_time (event); }
    ulong               get_time_usec ()        { return libinput_event_keyboard_get_time_usec (event); }
    uint                get_key ()              { return libinput_event_keyboard_get_key (event); }
    libinput_key_state  get_key_state ()        { return libinput_event_keyboard_get_key_state (event); }
    libinput_event*     get_base_event ()       { return libinput_event_keyboard_get_base_event (event); }
    uint                get_seat_key_count ()   { return libinput_event_keyboard_get_seat_key_count (event); }
}

struct
Touch {
    libinput_event_touch* event;
    alias event this;
//    @disable this ();

    pragma (inline,true):
    uint            get_time ()                     { return libinput_event_touch_get_time (event); }
    ulong           get_time_usec ()                { return libinput_event_touch_get_time_usec (event); }
    int             get_slot ()                     { return libinput_event_touch_get_slot (event); }
    int             get_seat_slot ()                { return libinput_event_touch_get_seat_slot (event); }
    double          get_x ()                        { return libinput_event_touch_get_x (event); }
    double          get_y ()                        { return libinput_event_touch_get_y (event); }
    double          get_x_transformed (uint width)  { return libinput_event_touch_get_x_transformed (event,width); }
    double          get_y_transformed (uint height) { return libinput_event_touch_get_y_transformed (event,height); }
    libinput_event* get_base_event ()               { return libinput_event_touch_get_base_event (event); }
}

struct
Gesture {
    libinput_event_gesture* event;
    alias event this;
//    @disable this ();

    pragma (inline,true):
    uint            get_time ()             { return libinput_event_gesture_get_time (event); }
    ulong           get_time_usec ()        { return libinput_event_gesture_get_time_usec (event); }
    libinput_event* get_base_event ()       { return libinput_event_gesture_get_base_event (event); }
    int             get_finger_count ()     { return libinput_event_gesture_get_finger_count (event); }
    int             get_cancelled ()        { return libinput_event_gesture_get_cancelled (event); }
    double          get_dx ()               { return libinput_event_gesture_get_dx (event); }
    double          get_dy ()               { return libinput_event_gesture_get_dy (event); }
    double          get_dx_unaccelerated () { return libinput_event_gesture_get_dx_unaccelerated (event); }
    double          get_dy_unaccelerated () { return libinput_event_gesture_get_dy_unaccelerated (event); }
    double          get_scale ()            { return libinput_event_gesture_get_scale (event); }
    double          get_angle_delta ()      { return libinput_event_gesture_get_angle_delta (event); }

}


struct
Tablet_Tool {
    libinput_event_tablet_tool* event;
    alias event this;
//    @disable this ();

    pragma (inline,true):
    libinput_event*         get_base_event ()           { return libinput_event_tablet_tool_get_base_event (event); }
    int                     x_has_changed ()            { return libinput_event_tablet_tool_x_has_changed (event); }
    int                     y_has_changed ()            { return libinput_event_tablet_tool_y_has_changed (event); }
    int                     pressure_has_changed ()     { return libinput_event_tablet_tool_pressure_has_changed (event); }
    int                     distance_has_changed ()     { return libinput_event_tablet_tool_distance_has_changed (event); }
    int                     tilt_x_has_changed ()       { return libinput_event_tablet_tool_tilt_x_has_changed (event); }
    int                     tilt_y_has_changed ()       { return libinput_event_tablet_tool_tilt_y_has_changed (event); }
    int                     rotation_has_changed ()     { return libinput_event_tablet_tool_rotation_has_changed (event); }
    int                     slider_has_changed ()       { return libinput_event_tablet_tool_slider_has_changed (event); }
    int                     wheel_has_changed ()        { return libinput_event_tablet_tool_wheel_has_changed (event); }
    double                  get_x ()                    { return libinput_event_tablet_tool_get_x (event); }
    double                  get_y ()                    { return libinput_event_tablet_tool_get_y (event); }
    double                  get_pressure ()             { return libinput_event_tablet_tool_get_pressure (event); }
    double                  get_distance ()             { return libinput_event_tablet_tool_get_distance (event); }
    double                  get_tilt_x ()               { return libinput_event_tablet_tool_get_tilt_x (event); }
    double                  get_tilt_y ()               { return libinput_event_tablet_tool_get_tilt_y (event); }
    double                  get_rotation ()             { return libinput_event_tablet_tool_get_rotation (event); }
    double                  get_slider_position ()      { return libinput_event_tablet_tool_get_slider_position (event); }
    double                  get_wheel_delta ()          { return libinput_event_tablet_tool_get_wheel_delta (event); }
    int                     get_wheel_delta_discrete () { return libinput_event_tablet_tool_get_wheel_delta_discrete (event); }
    double                  get_x_transformed (uint width)      { return libinput_event_tablet_tool_get_x_transformed (event,width); }
    double                  get_y_transformed (uint height)     { return libinput_event_tablet_tool_get_y_transformed (event,height); }
    libinput_tablet_tool_proximity_state get_proximity_state () { return libinput_event_tablet_tool_get_proximity_state (event); }
    libinput_tablet_tool_tip_state       get_tip_state ()       { return libinput_event_tablet_tool_get_tip_state (event); }
    uint                    get_button ()               { return libinput_event_tablet_tool_get_button (event); }
    libinput_button_state   get_button_state ()         { return libinput_event_tablet_tool_get_button_state (event); }
    uint                    get_seat_button_count ()    { return libinput_event_tablet_tool_get_seat_button_count (event); }
    uint                    get_time ()                 { return libinput_event_tablet_tool_get_time (event); }
    ulong                   get_time_usec ()            { return libinput_event_tablet_tool_get_time_usec (event); }
    Tool                    get_tool ()                 { return cast (Tool) (libinput_event_tablet_tool_get_tool (event)); }
}


struct
Tool {
    libinput_tablet_tool* tool;
    alias tool this;
//    @disable this ();

    pragma (inline,true):
    libinput_tablet_tool_type   get_type ()                     { return libinput_tablet_tool_get_type (tool); }
    ulong                       get_tool_id ()                  { return libinput_tablet_tool_get_tool_id (tool); }
    libinput_tablet_tool*       ref_ ()                         { return libinput_tablet_tool_ref (tool); }
    libinput_tablet_tool*       unref ()                        { return libinput_tablet_tool_unref (tool); }
    int                         has_pressure ()                 { return libinput_tablet_tool_has_pressure (tool); }
    int                         has_distance ()                 { return libinput_tablet_tool_has_distance (tool); }
    int                         has_tilt ()                     { return libinput_tablet_tool_has_tilt (tool); }
    int                         has_rotation ()                 { return libinput_tablet_tool_has_rotation (tool); }
    int                         has_slider ()                   { return libinput_tablet_tool_has_slider (tool); }
    int                         has_wheel ()                    { return libinput_tablet_tool_has_wheel (tool); }
    int                         has_button (uint code)          { return libinput_tablet_tool_has_button (tool, code); }
    int                         is_unique ()                    { return libinput_tablet_tool_is_unique (tool); }
    ulong                       get_serial ()                   { return libinput_tablet_tool_get_serial (tool); }
    void*                       get_user_data ()                { return libinput_tablet_tool_get_user_data (tool); }
    void                        set_user_data (void* user_data) { return libinput_tablet_tool_set_user_data (tool,user_data); }
}

auto
decode_enum (string STARTSWITH) (int btn) {
    import std.string;
    import input_event_codes;

    static
    foreach (m; __traits (allMembers,input_event_codes)) {
        static if (m.startsWith (STARTSWITH)/* && is (__traits (getMember,input_event_codes,m)==int)*/) {
            //pragma (msg,m," = ", __traits (getMember,input_event_codes,m));
            if (btn == __traits (getMember,input_event_codes,m)) return m;
        }
    }

    return "undefined";
}

alias decode_btn = decode_enum!"BTN_";
alias decode_key = decode_enum!"KEY_";
alias decode_snd = decode_enum!"SND_";
alias decode_led = decode_enum!"LED_";
alias decode_rep = decode_enum!"REP_";
alias decode_msc = decode_enum!"MSC_";
alias decode_sw  = decode_enum!"SW_";
alias decode_rel = decode_enum!"REL_";
alias decode_abs = decode_enum!"ABS_";
