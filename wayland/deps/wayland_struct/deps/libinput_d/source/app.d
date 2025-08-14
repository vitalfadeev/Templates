import std.conv        : to;
import std.stdio       : writeln,writefln;
import libinput_struct : LibInput,decode_btn,decode_key;
import libinput_d;
import input_event_codes;



void
main () {
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
}

