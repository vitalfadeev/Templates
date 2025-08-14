import core.sys.posix.sys.mman : mmap,munmap,PROT_READ,PROT_WRITE,MAP_SHARED,MAP_FAILED;
import core.sys.posix.sys.stat : fstat,stat_t;
import core.sys.posix.fcntl    : open,O_RDWR;
import core.sys.posix.fcntl    : O_CREAT,O_EXCL;
import core.sys.posix.unistd   : close;
import core.sys.posix.unistd   : ftruncate;
import core.sys.posix.signal   : timespec;
import core.sys.posix.time     : clock_gettime;
import core.sys.posix.time     : CLOCK_REALTIME;
import core.sys.posix.sys.mman : shm_open;
import core.sys.posix.sys.mman : shm_unlink;
import core.stdc.errno         : errno;
import core.stdc.errno         : EEXIST;
import core.stdc.errno         : EINTR;
import std.conv                : to;
import std.conv                : octal;
import wayland_struct;
import impl;


static 
string
randname () {
    char[7] buf;
    timespec ts;
    clock_gettime (CLOCK_REALTIME, &ts);
    long r = ts.tv_nsec;
    for (int i = 0; i < 6; ++i) {
        buf[i] = 'A'+(r&15)+(r&16)*2;
        r >>= 5;
    }
    return buf.to!string;
}

static 
int
create_shm_file () {
    int retries = 100;
    do {
        string name = "/wl_shm-" ~ randname ();
        retries--;
        int fd = shm_open (name.ptr, O_RDWR | O_CREAT | O_EXCL, octal!"600");
        if (fd >= 0) {
            shm_unlink (name.ptr);
            return fd;
        }
    } while (retries > 0 && errno == EEXIST);
    return -1;
}

int
allocate_shm_file (size_t size) {
    int fd = create_shm_file ();
    if (fd < 0)
        return -1;
    int ret;
    do {
        ret = ftruncate (fd,size);
    } while (ret < 0 && errno == EINTR);
    if (ret < 0) {
        close (fd);
        return -1;
    }
    return fd;
}

static 
wl_buffer*
draw_frame (wayland_ctx* ctx) {
    with (ctx) {
        int stride = width * 4;
        int size = stride * height;

        int fd = allocate_shm_file (size);
        if (fd == -1) {
            return null;
        }

        uint* data = cast (uint*) mmap (null, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
        if (data == MAP_FAILED) {
            close (fd);
            return null;
        }

        wl_shm_pool = wl_shm.create_pool (fd, size);
        wl_buffer   = wl_shm_pool.create_buffer (0, width, height, stride, PIXEL_FORMAT_ID);
        wl_shm_pool.destroy ();
        close (fd);

        /* Draw checkerboxed background */
        for (int y = 0; y < height; ++y) {
            for (int x = 0; x < width; ++x) {
                if ((x + y / 32 * 32) % 64 < 32)
                    data[y * width + x] = 0xFF666666;
                else
                    data[y * width + x] = 0xFFEEEEEE;
            }
        }

        munmap (data, size);
        wl_buffer.add_listener (&wl_buffer.listener, null);
        return wl_buffer;
    }
}
