import std.stdio;
import core.sys.posix.poll       : poll,pollfd,POLLIN,POLLHUP,POLLERR;
import core.sys.posix.sys.select : select,FD_ISSET,FD_SET,FD_ZERO,fd_set;
import core.sys.posix.sys.time   : timeval;
import std.string                : fromStringz;
import udev_d;
//#include <stdio.h>
//#include <unistd.h>
//#include <libudev.h>

int 
main() {
	udev *udev;
	udev_device *dev;
   	udev_monitor *mon;
	int fd;

	/* create udev object */
	udev = udev_new ();
	if (!udev) {
		writeln ("Can't create udev\n");
		return 1;
	}

	mon = udev_monitor_new_from_netlink (udev, "udev");
	//udev_monitor_filter_add_match_subsystem_devtype (mon, "net", null);
	udev_monitor_filter_add_match_subsystem_devtype (mon, "usb", null);
	udev_monitor_enable_receiving (mon);
	fd = udev_monitor_get_fd (mon);

	
	for (int i = 0; i < 1000; i++) {
		fd_set  fds;
		timeval tv;
		int     ret;

		FD_ZERO (&fds);
		FD_SET (fd, &fds);
		tv.tv_sec  = 0;
		tv.tv_usec = 0;

		ret = select (fd+1, &fds, null, null, &tv);
		if (ret > 0 && FD_ISSET (fd, &fds)) {
			dev = udev_monitor_receive_device (mon);
			if (dev) {
				// add    ,bind.change
				// remove ,unbind
				writefln ("I: ACTION=%s",  udev_device_get_action  (dev).fromStringz);
				writefln ("I: DEVNAME=%s", udev_device_get_sysname (dev).fromStringz);
				writefln ("I: DEVPATH=%s", udev_device_get_devpath (dev).fromStringz);
				//writefln ("I: MACADDR=%s\n", udev_device_get_sysattr_value (dev, "address"));
				//writefln ("---\n");

				/* free dev */
				udev_device_unref (dev);
			}
		}
		/* 500 milliseconds */
        import core.sys.posix.unistd : sleep;
        sleep (1);
	}

	/* free udev */
	udev_unref (udev);

	return 0;
}