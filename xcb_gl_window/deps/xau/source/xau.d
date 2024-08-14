module xau;

import std.stdio : File;
import core.sys.posix.sys.types : mode_t;

extern(C)
int open( const char *pathname, int flags, mode_t mode );


//string[] mechanisms = [
//    "Host Access",
//    "MIT‐MAGIC‐COOKIE‐1",
//    "XDM‐AUTHORIZATION‐1",
//    "SUN‐DES‐1",
//    "Server Interpreted",
//];

enum : ushort {
    FamilyInternet      = 0,
    FamilyDECnet        = 1,
    FamilyChaos         = 2,
    FamilyAmoeba        = 33,
    FamilyLocalHost     = 252,   // for local non-net authentication 
    FamilyKrb5Principal = 253,   // Kerberos 5 principal name 
    FamilyNetname       = 254,   // not part of X standard 
    FamilyLocal         = 256,   // not part of X standard (i.e. X.h)
    FamilyWild          = 65535,
}


struct 
Xauth {
    ushort  family;
    string  address;
    string  number;
    string  name;
    ubyte[] data;
}


enum {
    LOCK_SUCCESS = 0,   // lock succeeded
    LOCK_ERROR   = 1,   // lock unexpectely failed, check errno
    LOCK_TIMEOUT = 2,   // lock failed, timeouts expired
}


/*
Generates  the  default  authorization  file name by 
    1. first checking the XAUTHORITY environment variable if set,  
    2. it  returns $HOME/.Xauthority.
    3. null
```
    string fname = file_name();
```
*/
string 
file_name() {
    import std.process : environment;
    import std.path    : buildPath;

    string x_auth_file;

    // 1.
    x_auth_file = environment.get ("XAUTHORITY");

    // 2.
    if ( x_auth_file is null ) {
        auto home = environment.get ("HOME");
        if ( home !is null )
            x_auth_file = buildPath (home, ".Xauthority");
    }

    // 3.
    // null

    return x_auth_file;
}

/*
Reads the next entry from auth_file.  
```
    string fname = file_name();
    if ( fname )
        foreach( auth; auth_file( fname ) )
            writeln( auth );
```
*/
struct 
ReadAuth {
    File   f;
    Xauth _front;


    this (ref File _f) {
        this.f = _f;
        popFront();
    }

    @property
    Xauth* front;
    bool   empty () { return (front is null); }
    void   popFront () {
        if (read_short (_front.family) == 0) {
            front = null; 
            return;
        }

        if (read_counted_string (_front.address) == 0) {
            front = null; 
            return;
        }

        if (read_counted_string (_front.number) == 0) {
            front = null; 
            return;
        }

        if (read_counted_string (_front.name) == 0) {
            front = null; 
            return;
        }

        if (read_counted_string (_front.data) == 0) {
            front = null; 
            return;
        }

        front = &_front;
    }

    auto 
    read_short (out ushort short_ptr) {
        ubyte[2] file_short;

        auto buf = f.rawRead (file_short);

        if (buf.length == 0)
            return 0;

        short_ptr = cast(ushort) (file_short[0] * 256 + file_short[1]);

        return 1;
    }

    auto 
    read_counted_string(T) (out T s) {
        ushort len;

        if (read_short (len) == 0)
            return 0;

        if (len == 0) {
            s.length = 0;
        } 
        else {
            s.length = len;

            auto buf = f.rawRead ((cast(ubyte*) s.ptr)[0..len]);

            if (buf.length != len) {
                s.length = 0;
                return 0;
            }
        }

        return 1;        
    }
}


/*
WriteAuth  writes an authorization entry to auth_file.  It returns 1
on success, 0 on failure.
*/
auto 
WriteAuth (string file_name, Xauth* auth) {
    return auth_file_writer (file_name).write_auth (auth);
}

struct 
auth_file_writer {
    import std.stdio : File;

    File f;


    this (string file_name) {
        f = File (file_name, "wb");
        if (!f.isOpen ())
            throw new Exception ("error: opening file for write: " ~ file_name);
    }

    int 
    write_short (ushort s) {
        ubyte[2] file_short;

        file_short[0] = (s & cast(uint) 0xff00) >> 8;
        file_short[1] =  s & 0xff;
    
        f.rawWrite (file_short);
    
        return 1;
    }

    int 
    write_counted_string (T) (T s) {
        import std.conv : to;

        if (write_short (s.length.to!short) == 0)
            return 0;

        f.rawWrite (s);

        return 1;
    }

    int 
    write_auth (Xauth* auth) {
        if (write_short (auth.family) == 0)
            return 0;

        if (write_counted_string (auth.address) == 0)
            return 0;

        if (write_counted_string (auth.number) == 0)
            return 0;

        if (write_counted_string (auth.name) == 0)
            return 0;

        if (write_counted_string (auth.data) == 0)
            return 0;

        return 1;
    }
}

/*
Searches for an entry which matches the given  network
address/display number pair.
*/
auto 
GetAuthByAddr ( 
    ushort family, string address, string number, string name, 
    out Xauth auth )
{
    import std.stdio : File;
    import std.file  : isFile;

    string auth_name;

    auth_name = file_name ();

    if (auth_name is null)
        return 0;

    if (!auth_name.isFile)      /* checks REAL id */
        return 0;

    auto f = File (auth_name, "rb");

    if (!f.isOpen())
        return 0;

    foreach (entry; ReadAuth (f)) {
        /*
         * Match when:
         *   either family or entry.family are FamilyWild or
         *    family and entry.family are the same and
         *     address and entry.address are the same
         *  and
         *   either number or entry.number are empty or
         *    number and entry.number are the same
         *  and
         *   either name or entry.name are empty or
         *    name and entry.name are the same
         */
        if ((family == FamilyWild || entry.family == FamilyWild || 
                (entry.family == family && address == entry.address)) &&
            (number.length == 0 || entry.number.length == 0 || (number == entry.number)) &&
            (name.length   == 0 || entry.name.length   == 0 || (entry.name == name))
        ) {
            auth = *entry;
            return 1;
        }
    }

    return 0;
}

/*
Is similar to GetAuthByAddr, except that a list
of acceptable authentication methods is specified.  Xau will choose the
file  entry  which  matches  the earliest entry in this list (e.g., the
most secure authentication method).  The types argument is an array  of
strings, one string for each authentication method.  types_length spec‐
ifies  how  many  elements are in the types array.  types_lengths is an
array of integers representing the length of each string.
*/
auto 
GetBestAuthByAddr (
    ushort family, 
    string address, string number, 
    string[] types, 
    out Xauth auth)
{
    import std.stdio : File;
    import std.file  : isFile;
    import std.algorithm.searching : countUntil;


    string auth_name;
    Xauth  best;

    auth_name = file_name ();

    if (auth_name is null)
        return 0;

    if (!auth_name.isFile)      /* checks REAL id */
        return 0;

    auto f = File (auth_name, "rb");

    if (!f.isOpen ())
        return 0;

    auto best_type = types.length;

    foreach (entry; ReadAuth (f)) {
    /*
     * Match when:
     *   either family or entry.family are FamilyWild or
     *    family and entry.family are the same and
     *     address and entry.address are the same
     *  and
     *   either number or entry.number are empty or
     *    number and entry.number are the same
     *  and
     *   either name or entry.name are empty or
     *    name and entry.name are the same
     */
        if ((family == FamilyWild || entry.family == FamilyWild ||
             (entry.family == family &&
             ((address == entry.address)
            ))) &&
            (number.length == 0 || entry.number.length == 0 ||
             (number == entry.number)))
        {
            if (best_type == 0) {
                best = *entry;
                break;
            }
            
            auto i = types.countUntil (entry.name);  // 0xFFFFFFFFFF or 0,1,2,3

            if (i < best_type) {
                best = *entry;
                best_type = i;
                if (i == 0)
                    break;
                continue;
            }
        }
    }

    auth = best;

    return 1;
}

/*
   LockAuth does the work necessary to synchronously update  an  autho‐
   rization file.  First it makes two file names, one with ‘‘‐c’’ appended
   to  file_name,  the other with ‘‘‐l’’ appended.  If the ‘‘‐c’’ file al‐
   ready exists and is more than dead seconds old, LockAuth removes  it
   and  the  associated  ‘‘‐l’’ file.  To prevent possible synchronization
   troubles with NFS, a dead value of zero forces the files to be removed.
   LockAuth makes retries attempts to create and link the  file  names,
   pausing  timeout  seconds  between each attempt.  LockAuth returns a
   collection of values depending on the results:

   LOCK_ERROR
          A system error occurred, either a file_name which is  too  long,
          or  an  unexpected  failure from a system call.  errno may prove
          useful.

   LOCK_TIMEOUT
          retries attempts failed

   LOCK_SUCCESS
          The lock succeeded.
*/
int 
LockAuth (string file_name, int retries, int timeout, long dead) {
    import std.datetime : Clock, seconds, dur;
    import std.file     : DirEntry, timeStatusChanged, FileException, remove;
    import std.format   : format;
    import std.conv     : octal;
    import std.string   : toStringz;
    import core.thread  : Thread;
    import core.sys.posix.unistd    : link;
    import core.stdc.errno          : EACCES, EEXIST, ENOENT;
    import core.sys.posix.fcntl     : O_WRONLY, O_CREAT, O_EXCL;
    import core.sys.posix.unistd    : close;
    import core.stdc.errno          : errno;
    import core.sys.posix.sys.types : mode_t;

    int creat_fd = -1;

    if ( file_name.length > 1022 )
        return LOCK_ERROR;

    auto creat_name = format!"%s-c"( file_name );
    auto link_name  = format!"%s-l"( file_name );

    try {
        auto statb = DirEntry (creat_name).statBuf;
        auto now   = Clock.currTime ();

        /*
         * NFS may cause ctime to be before now, special
         * case a 0 deadtime to force lock removal
         */        
        if (dead == 0 || (now - timeStatusChanged (statb)) > dur!("seconds")(dead)) {
            remove (creat_name);
            remove (link_name);
        }
    } catch ( FileException e ) { 
        // pass on no file
    }

    // LOCK
    while (retries > 0) {
        // lock
        if (creat_fd == -1) {
            creat_fd = 
                open( 
                    creat_name.toStringz, 
                    O_WRONLY | O_CREAT | O_EXCL, 
                    octal!600 );
            if (creat_fd == -1) {
                if (errno != EACCES && errno != EEXIST)
                    return LOCK_ERROR;
            } else
                close (creat_fd);
        }

        if (creat_fd != -1) {
            // lock link
            version (SYSTEM_NOT_ABLE_HARD_LINK)
            {
                // rename
            }
            else
            {
                // hard link 
                if (link (creat_name.toStringz, link_name.toStringz) != -1)
                    return LOCK_SUCCESS;

                if (errno == ENOENT) {
                    creat_fd = -1;  /* force re-creat next time around */
                    continue;
                }

                if (errno != EEXIST)
                    return LOCK_ERROR;
            }
        }

        // wait
        Thread.sleep (dur!("seconds")(timeout));

        retries--;
    }

    return LOCK_TIMEOUT;
}

/*
uUnlockAuth undoes the work of  uLockAuth  by  unlinking  both  the
‘‘‐c’’ and ‘‘‐l’’ file names.
*/
int 
UnlockAuth (string file_name) {
    import std.format   : format;
    import std.file     : remove;

    if (file_name.length > 1022)
        return 0;

    version(WIN32)
    auto creat_name = format!"%s-c"(file_name);
    auto link_name  = format!"%s-l"(file_name);

    /*
     * I think this is the correct order
     */
    version(WIN32)
    remove (creat_name);
    remove (link_name);

    return 0;
}
