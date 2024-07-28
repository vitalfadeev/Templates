module gl.gles2;

import std.string;
//import types;


//import bindbc.gles.egl;
version (Android) {
public import bindbc.gles.gles;
}
else
version (linux) {
public import bindbc.opengl;
alias GLfixed = int;
}
else {
    static assert (0, "unsupported platform");
}

alias Program_Id = GLuint;
alias Shader_Id  = GLuint;
alias Attrib_Id  = GLuint;

struct
GLES2 {
    Program_Id draw_char_program;
    Context    context;

    void
    _init () {
        context.width  = 640;
        context.height = 480;
        context.user_data = new UserData (context.width,context.height);
        load_programs ();
    }

    void
    load_programs () {
        context.user_data.basic_program = 
            Program (
                "attribute vec2 a_position;   \n" ~
                "void main()                  \n" ~
                "{                            \n" ~
                "   gl_Position = a_position; \n" ~
                "}                            \n"
            ,
                //"precision mediump float;\n" ~
                "void main()                                  \n" ~
                "{                                            \n" ~
                "  gl_FragColor = vec4 ( 1.0, 1.0, 1.0, 1.0 );\n" ~
                "}                                            \n"
            );


        context.user_data.matrix_program = 
            Program (
                "attribute vec2 a_position;                  \n" ~
                "uniform mat4 u_mvpMatrix;                   \n" ~
                "void main()                                 \n" ~
                "{                                           \n" ~
                "   gl_Position = u_mvpMatrix * a_position;  \n" ~
                "}                                           \n"
            ,
                //"precision mediump float;                            \n" ~
                "void main()                                         \n" ~
                "{                                                   \n" ~
                "  gl_FragColor = vec4( 1.0, 1.0, 1.0, 1.0 );        \n" ~
                "}                                                   \n"
            );

        
        context.user_data.translate_program = 
            Program (
                "attribute vec2 a_position;                  \n" ~
                "uniform vec2 u_tr;                          \n" ~
                "uniform vec2 u_sc;                          \n" ~
                "void main()                                 \n" ~
                "{                                           \n" ~
                "   gl_Position = vec4(a_position.x * u_sc.x + u_tr.x, a_position.y * u_sc.y + u_tr.y, 0.0, 1.0);   \n" ~
                "}                                           \n"
            ,
                //"precision mediump float;                            \n" ~
                "void main()                                         \n" ~
                "{                                                   \n" ~
                "  gl_FragColor = vec4( 1.0, 1.0, 1.0, 1.0 );        \n" ~
                "}                                                   \n"
            );
        
    }


    void
    draw_scene () {
        _clear_buffer ();
        _render_scene ();
        _update_window ();
    }

    void
    _clear_buffer () {
        glViewport (0,0,context.user_data.w,context.user_data.h);
        glClearColor (0.2f, 0.2f, 0.2f, 1.0f);
        glClear (GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    }

    void
    _render_scene () {
        //
    }

    void
    _update_window () {
        //SDL_GL_SwapWindow (ad.window);
    }    

version (_w_) {
    Size
    draw_char (GL_Char* gl_char) {
        glUseProgram (context.user_data.basic_program.id);

        glVertexAttribPointer (0, 2, GL_FLOAT, GL_TRUE, 0, gl_char.gl_points.ptr);
        glEnableVertexAttribArray (0);

        foreach (ref gl_contur; gl_char.gl_conturs)
            glDrawArrays (GL_LINE_LOOP, gl_contur.first, gl_contur.count);

        return Size (gl_char.w,gl_char.h);
    }


    Size
    draw_char_at (GL_Char* gl_char, int x, int y) {
        glUseProgram (context.user_data.translate_program.id);

        // matrix
        GLfloat translate_x = 0;
        GLfloat translate_y = 0.5;

        // Load the vertex position
        auto a_position = glGetAttribLocation (context.user_data.translate_program.id, "a_position");
        glVertexAttribPointer (
            a_position, 
            2, 
            GL_FLOAT, 
            GL_FALSE, 
            0, //2 * GLfloat.sizeof, 
            gl_char.gl_points.ptr
        );        
        glEnableVertexAttribArray (a_position);
        
        //Load the translate vector
        GLfloat[2] translate = [0.0, -0.0];
        auto u_tr = glGetUniformLocation (context.user_data.translate_program.id, "u_tr");
        glUniform2fv (u_tr,1,translate.ptr);
        
        //Load the scale vector
        float font_size = 64.0;
        GLfloat[2] scale = [font_size/context.width, font_size/context.height];
        auto u_sc = glGetUniformLocation (context.user_data.translate_program.id, "u_sc");
        glUniform2fv (u_sc,1,scale.ptr);
        
        // Draw the cube
        foreach (ref gl_contur; gl_char.gl_conturs)
            glDrawArrays (GL_LINE_LOOP, gl_contur.first, gl_contur.count);

        return Size (gl_char.w,gl_char.h);
    }
}

    GLfloat[] 
    _test_triangle_verts = [
         0.0f,  0.5f,
        -0.5f, -0.5f,
         0.5f, -0.5f,
    ];
}

struct 
Context {
   UserData*           user_data;   /// Put your user data here...
   GLint               width;      /// Window width
   GLint               height;     /// Window height
   //EGLNativeWindowType hWnd;       /// Window handle
   //EGLDisplay          eglDisplay; /// EGL display
   //EGLContext          eglContext; /// EGL context
   //EGLSurface          eglSurface; /// EGL surface
   /// Callbacks
   void function (Context*) drawFunc;
   void function (Context*, ubyte, int, int ) keyFunc;
   void function (Context*, float deltaTime ) updateFunc;
}

struct
UserData {
    // viewport
    int     w;
    int     h;
    // programs
    Program basic_program;
    Program matrix_program;
    Program translate_program;
}


struct
Program {
    Program_Id id;

    this (string vShaderStr, string fShaderStr) {
        if (!load_program (vShaderStr,fShaderStr))
            this.id = 0;
    }

    bool
    load_program (string vertShaderSrc, string fragShaderSrc) {
        GLint linked;

        // Load the vertex/fragment shaders
        Shader vertex_shader;
        Shader fragment_shader;
        try {
            vertex_shader   = Shader (GL_VERTEX_SHADER, vertShaderSrc);
            fragment_shader = Shader (GL_FRAGMENT_SHADER, fragShaderSrc);
        } catch (Exception e) {            
            if (vertex_shader.id != 0) {
               glDeleteShader (vertex_shader.id);
               throw e;
            }
        }

        // Create the program object
        auto program_id = glCreateProgram ();
        
        if (program_id == 0)
           throw new Exception ("glCreateProgram");

        glAttachShader (program_id, vertex_shader.id);
        glAttachShader (program_id, fragment_shader.id);

        // Link the program
        glLinkProgram (program_id);

        // Check the link status
        glGetProgramiv (program_id, GL_LINK_STATUS, &linked);

        if (!linked)
            throw new Program_Exception (program_id, "glGetProgramiv");

        // Free up no longer needed shader resources
        glDeleteShader (vertex_shader.id);
        glDeleteShader (fragment_shader.id);

        this.id = program_id;
        return true;
    }

    Attrib
    attrib (string name) {
        import std.string : toStringz;

        auto loc = glGetAttribLocation (id, name.toStringz);
        if (loc == -1)
            throw new Exception ("glGetAttribLocation");

        return Attrib ();
    }

    struct
    Attrib {
        Attrib_Id id;
        alias id this;
    }

    class 
    Program_Exception : Exception {
        this (Program_Id program_object, string msg) {
            GLint info_len = 0;

            glGetProgramiv (program_object,GL_INFO_LOG_LENGTH,&info_len);

            if (info_len > 1) {
                 string info;
                 info.length = info_len;

                 glGetProgramInfoLog (
                     program_object, 
                     info_len, 
                     null, 
                     cast (char*) info.ptr
                 );

                 info.length--;

                 glDeleteProgram (program_object);
                 super (msg ~ ": Error linking program: \n" ~ info);
            }
            else {
                glDeleteProgram (program_object);
                super (msg);
            }
        }
    }}


struct
Shader {
    Shader_Id id;

    this (GLenum type, string shader_src) {
        if (!load_shader (type,shader_src))
            this.id = 0;
    }

    bool 
    load_shader (GLenum type, string shader_src) {
        Shader_Id shader;
        GLint compiled;
       
        // Create the shader object
        shader = glCreateShader (type);

        if (shader == 0)
            throw new Exception ("glCreateShader");

        // Load the shader source
        const GLchar* ptr = shader_src.ptr;
        glShaderSource (shader, 1, &ptr, null);
       
        // Compile the shader
        glCompileShader (shader);

        // Check the compile status
        glGetShaderiv (shader, GL_COMPILE_STATUS, &compiled);

        if (!compiled)
            throw new Shader_Exception (shader,"glGetShaderiv",shader_src);

        this.id = shader;
 
        return true;
    }    

    class 
    Shader_Exception : Exception {
        this (Shader_Id shader, string msg, string shader_src) {
             GLint info_len = 0;

             glGetShaderiv (shader, GL_INFO_LOG_LENGTH, &info_len);
               
             if (info_len > 1) {
                 string info;
                 info.length = info_len;

                 glGetShaderInfoLog (
                     shader, 
                     info_len, 
                     null, 
                     cast (char*) info.ptr
                 );

                 info.length--;

                 glDeleteShader (shader);
                 super (msg ~ ": Error compiling shader: \n" ~info ~ "\n" ~ shader_src);
             }
             else {
                glDeleteShader (shader);
                super (msg);
             }
       }
    }
}

struct
ESMatrix {
    GLfloat[4][4] m;

    auto
    ptr () {
        return m.ptr;
    }
}

struct
Translate {
    GLfloat[2] m;

    auto
    ptr () {
        return m.ptr;
    }
}

void 
esPerspective(ESMatrix *result, float fovy, float aspect, float nearZ, float farZ) {
    import core.stdc.math : tanf;
    import std.math : PI;

    GLfloat frustumW, frustumH;
   
    frustumH = tanf( fovy / 360.0f * PI ) * nearZ;
    frustumW = frustumH * aspect;

    esFrustum (result, -frustumW, frustumW, -frustumH, frustumH, nearZ, farZ);
}

void
esMatrixLoadIdentity (ESMatrix *result) {
    import core.stdc.string : memset;
    memset (result, 0x0, ESMatrix.sizeof);
    result.m[0][0] = 1.0f;
    result.m[1][1] = 1.0f;
    result.m[2][2] = 1.0f;
    result.m[3][3] = 1.0f;
}

void
esFrustum (ESMatrix *result, float left, float right, float bottom, float top, float nearZ, float farZ) {
    float       deltaX = right - left;
    float       deltaY = top - bottom;
    float       deltaZ = farZ - nearZ;
    ESMatrix    frust;

    if ( (nearZ <= 0.0f) || (farZ <= 0.0f) ||
         (deltaX <= 0.0f) || (deltaY <= 0.0f) || (deltaZ <= 0.0f) )
         return;

    frust.m[0][0] = 2.0f * nearZ / deltaX;
    frust.m[0][1] = frust.m[0][2] = frust.m[0][3] = 0.0f;

    frust.m[1][1] = 2.0f * nearZ / deltaY;
    frust.m[1][0] = frust.m[1][2] = frust.m[1][3] = 0.0f;

    frust.m[2][0] = (right + left) / deltaX;
    frust.m[2][1] = (top + bottom) / deltaY;
    frust.m[2][2] = -(nearZ + farZ) / deltaZ;
    frust.m[2][3] = -1.0f;

    frust.m[3][2] = -2.0f * nearZ * farZ / deltaZ;
    frust.m[3][0] = frust.m[3][1] = frust.m[3][3] = 0.0f;

    esMatrixMultiply(result, &frust, result);
}


void
esTranslate (ESMatrix *result, GLfloat tx, GLfloat ty, GLfloat tz) {
    result.m[3][0] += (result.m[0][0] * tx + result.m[1][0] * ty + result.m[2][0] * tz);
    result.m[3][1] += (result.m[0][1] * tx + result.m[1][1] * ty + result.m[2][1] * tz);
    result.m[3][2] += (result.m[0][2] * tx + result.m[1][2] * ty + result.m[2][2] * tz);
    result.m[3][3] += (result.m[0][3] * tx + result.m[1][3] * ty + result.m[2][3] * tz);
}

void
esMatrixMultiply (ESMatrix *result, ESMatrix *srcA, ESMatrix *srcB) {
    import core.stdc.string : memcpy;

    ESMatrix    tmp;
    int         i;

    for (i=0; i<4; i++) {
        tmp.m[i][0] =   (srcA.m[i][0] * srcB.m[0][0]) +
                        (srcA.m[i][1] * srcB.m[1][0]) +
                        (srcA.m[i][2] * srcB.m[2][0]) +
                        (srcA.m[i][3] * srcB.m[3][0]) ;

        tmp.m[i][1] =   (srcA.m[i][0] * srcB.m[0][1]) + 
                        (srcA.m[i][1] * srcB.m[1][1]) +
                        (srcA.m[i][2] * srcB.m[2][1]) +
                        (srcA.m[i][3] * srcB.m[3][1]) ;

        tmp.m[i][2] =   (srcA.m[i][0] * srcB.m[0][2]) + 
                        (srcA.m[i][1] * srcB.m[1][2]) +
                        (srcA.m[i][2] * srcB.m[2][2]) +
                        (srcA.m[i][3] * srcB.m[3][2]) ;

        tmp.m[i][3] =   (srcA.m[i][0] * srcB.m[0][3]) + 
                        (srcA.m[i][1] * srcB.m[1][3]) +
                        (srcA.m[i][2] * srcB.m[2][3]) +
                        (srcA.m[i][3] * srcB.m[3][3]) ;
    }

    memcpy (result, &tmp, ESMatrix.sizeof);
}


void 
esScale (ESMatrix *result, GLfloat sx, GLfloat sy, GLfloat sz) {
    result.m[0][0] *= sx;
    result.m[0][1] *= sx;
    result.m[0][2] *= sx;
    result.m[0][3] *= sx;

    result.m[1][0] *= sy;
    result.m[1][1] *= sy;
    result.m[1][2] *= sy;
    result.m[1][3] *= sy;

    result.m[2][0] *= sz;
    result.m[2][1] *= sz;
    result.m[2][2] *= sz;
    result.m[2][3] *= sz;
}

// GL Side
// -1 .. 0 .. 1          float
// -256 .. 0 .. 255      byte
// -32768 .. 0 .. 32767  short
//
// CPU Side
//  0 .. 1024
// -512 .. 0 .. 511
// viewport 0,0,1024,512
//
// all must be normalize (normalized = GL_FALSE in glVertexAttribPointer)
// type 0..1024 is short 16-bit
//
