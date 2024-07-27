module gl.gl33;

version (GL_3_3):
struct
GL33 {
    Size
    draw_char () {
        glViewport (0,0,640,480);

        glClearColor (0.2f, 0.2f, 0.2f, 1.0f);
        glClear (GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        glUseProgram (gl_view.ad.program);

        glVertexAttribPointer (0, 2, GL_FLOAT, GL_TRUE, 0, _gl_char.gl_points.ptr);
        glEnableVertexAttribArray (0);

        foreach (ref gl_contur; _gl_char.gl_conturs)
            glDrawArrays (GL_LINE_LOOP, gl_contur.first, gl_contur.count);

        return Size (_gl_char.w,_gl_char.h);
    }
}
