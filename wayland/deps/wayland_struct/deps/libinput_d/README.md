# Read events from [libinput](https://wayland.freedesktop.org/libinput/doc/1.28.1/api/)

Exmaple:
```D
	foreach (event; LibInput (null))
		writeln (event.type);
```

Example 2 [app.d](source/app.d):
```D
	foreach (event; LibInput (null))
		switch (event.type) {
			case LIBINPUT_EVENT_DEVICE_ADDED:
			case LIBINPUT_EVENT_DEVICE_REMOVED:
				writefln ("%s: %s added", 
					event.type.to!string, 
					event.device.name.to!string); break;
			case LIBINPUT_EVENT_KEYBOARD_KEY:
				writefln ("%s: %d: %s: %s", 
					event.type.to!string, 
					event.keyboard.get_key,  // KEY_1,KEY_ESC,KEY_BACKSPACE
					event.keyboard.get_key_state.to!string,
					event.keyboard.get_key.decode_key); break;
			case LIBINPUT_EVENT_POINTER_MOTION:
				writefln ("%s: dx,dy: %f,%f", 
					event.type.to!string, 
					event.pointer.dx, 
					event.pointer.dy); break;
			case LIBINPUT_EVENT_POINTER_MOTION_ABSOLUTE:
				writefln ("%s: abs_x,abx_y: %f,%f", 
					event.type.to!string, 
					event.pointer.absolute_x, 
					event.pointer.absolute_y); break;
			case LIBINPUT_EVENT_POINTER_BUTTON:
				writefln ("%s: %d %s: %s", 
					event.type.to!string, 
					event.pointer.button,  // BTN_LEFT,BTN_RIGHT,BTN_MIDDLE
					event.pointer.button_state.to!string,
					decode_btn (event.pointer.button)); break;
			case LIBINPUT_EVENT_POINTER_AXIS:
				writefln ("%s: axe_source: %s: x,y: %f,%f", 
					event.type.to!string, 
					event.pointer.axis_source.to!string, 
					event.pointer.axis_value (LIBINPUT_POINTER_AXIS_SCROLL_HORIZONTAL), 
					event.pointer.axis_value (LIBINPUT_POINTER_AXIS_SCROLL_VERTICAL)); break;
			case LIBINPUT_EVENT_TOUCH_DOWN:
			case LIBINPUT_EVENT_TOUCH_UP:
			case LIBINPUT_EVENT_TOUCH_MOTION:
			case LIBINPUT_EVENT_TOUCH_CANCEL:
			case LIBINPUT_EVENT_TOUCH_FRAME:
				writefln ("%s", event.type.to!string); break;
			case LIBINPUT_EVENT_TABLET_TOOL_AXIS:
			case LIBINPUT_EVENT_TABLET_TOOL_PROXIMITY:
			case LIBINPUT_EVENT_TABLET_TOOL_TIP:
			case LIBINPUT_EVENT_TABLET_TOOL_BUTTON:
				writefln ("%s", event.type.to!string); break;
			case LIBINPUT_EVENT_GESTURE_SWIPE_BEGIN:
			case LIBINPUT_EVENT_GESTURE_SWIPE_UPDATE:
			case LIBINPUT_EVENT_GESTURE_SWIPE_END:
			case LIBINPUT_EVENT_GESTURE_PINCH_BEGIN:
			case LIBINPUT_EVENT_GESTURE_PINCH_UPDATE:
			case LIBINPUT_EVENT_GESTURE_PINCH_END:
				writefln ("%s", event.type.to!string); break;
			default:
				writeln (event.type);
		}
```

output
```
LIBINPUT_EVENT_DEVICE_ADDED: Power Button added
LIBINPUT_EVENT_DEVICE_ADDED: Video Bus added
LIBINPUT_EVENT_DEVICE_ADDED: Video Bus added
LIBINPUT_EVENT_DEVICE_ADDED: Lid Switch added
LIBINPUT_EVENT_DEVICE_ADDED: Sleep Button added
LIBINPUT_EVENT_DEVICE_ADDED: USB 2.0 UVC VGA WebCam: USB2.0  added
LIBINPUT_EVENT_DEVICE_ADDED: A4Tech USB Mouse added
LIBINPUT_EVENT_DEVICE_ADDED: LITEON Technology USB Keyboard added
LIBINPUT_EVENT_DEVICE_ADDED: Asus WMI hotkeys added
LIBINPUT_EVENT_DEVICE_ADDED: AT Translated Set 2 keyboard added
LIBINPUT_EVENT_DEVICE_ADDED: ETPS/2 Elantech Touchpad added
LIBINPUT_EVENT_POINTER_BUTTON: 272 LIBINPUT_BUTTON_STATE_PRESSED: BTN_MOUSE
LIBINPUT_EVENT_POINTER_BUTTON: 272 LIBINPUT_BUTTON_STATE_RELEASED: BTN_MOUSE
LIBINPUT_EVENT_KEYBOARD_KEY: 97: LIBINPUT_KEY_STATE_PRESSED: KEY_RIGHTCTRL
LIBINPUT_EVENT_KEYBOARD_KEY: 97: LIBINPUT_KEY_STATE_RELEASED: KEY_RIGHTCTRL
LIBINPUT_EVENT_KEYBOARD_KEY: 29: LIBINPUT_KEY_STATE_PRESSED: KEY_LEFTCTRL
LIBINPUT_EVENT_KEYBOARD_KEY: 46: LIBINPUT_KEY_STATE_PRESSED: KEY_C
^C
```

## dub.sjon
```
	...
	"libs-posix"     : ["libinput","libudev"],
	...
```
