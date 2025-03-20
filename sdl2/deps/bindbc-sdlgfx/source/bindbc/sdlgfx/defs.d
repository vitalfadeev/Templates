module bindbc.sdlgfx.defs;

import bindbc.sdl;

struct SDL_gfxBlitInfo {
    Uint8    *s_pixels;
    int       s_width;
    int       s_height;
    int       s_skip;
    Uint8    *d_pixels;
    int       d_width;
    int       d_height;
    int       d_skip;
    void     *aux_data;
    SDL_PixelFormat *src;
    Uint8    *table;
    SDL_PixelFormat *dst;
}

version(BindSDLgfx_Static) {
    extern (C) @nogc nothrow {
        // SDL_gfxPrimitives.h: graphics primitives for SDL
        int pixelColor(SDL_Renderer * dst, Sint16 x, Sint16 y, Uint32 color);
        int pixelRGBA(SDL_Renderer * dst, Sint16 x, Sint16 y, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int hlineColor(SDL_Renderer * dst, Sint16 x1, Sint16 x2, Sint16 y, Uint32 color);
        int hlineRGBA(SDL_Renderer * dst, Sint16 x1, Sint16 x2, Sint16 y, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int vlineColor(SDL_Renderer * dst, Sint16 x, Sint16 y1, Sint16 y2, Uint32 color);
        int vlineRGBA(SDL_Renderer * dst, Sint16 x, Sint16 y1, Sint16 y2, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int rectangleColor(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Uint32 color);
        int rectangleRGBA(SDL_Renderer * dst, Sint16 x1, Sint16 y1,
            Sint16 x2, Sint16 y2, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int roundedRectangleColor(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Sint16 rad, Uint32 color);
        int roundedRectangleRGBA(SDL_Renderer * dst, Sint16 x1, Sint16 y1,
            Sint16 x2, Sint16 y2, Sint16 rad, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int boxColor(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Uint32 color);
        int boxRGBA(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2,
            Sint16 y2, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int roundedBoxColor(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Sint16 rad, Uint32 color);
        int roundedBoxRGBA(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2,
            Sint16 y2, Sint16 rad, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int lineColor(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Uint32 color);
        int lineRGBA(SDL_Renderer * dst, Sint16 x1, Sint16 y1,
            Sint16 x2, Sint16 y2, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int aalineColor(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Uint32 color);
        int aalineRGBA(SDL_Renderer * dst, Sint16 x1, Sint16 y1,
            Sint16 x2, Sint16 y2, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int thickLineColor(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, 
            Uint8 width, Uint32 color);
        int thickLineRGBA(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, 
            Uint8 width, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int circleColor(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rad, Uint32 color);
        int circleRGBA(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rad, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int arcColor(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rad, Sint16 start, Sint16 end, Uint32 color);
        int arcRGBA(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rad, Sint16 start, Sint16 end, 
            Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int aacircleColor(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rad, Uint32 color);
        int aacircleRGBA(SDL_Renderer * dst, Sint16 x, Sint16 y,
            Sint16 rad, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int filledCircleColor(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 r, Uint32 color);
        int filledCircleRGBA(SDL_Renderer * dst, Sint16 x, Sint16 y,
            Sint16 rad, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int ellipseColor(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rx, Sint16 ry, Uint32 color);
        int ellipseRGBA(SDL_Renderer * dst, Sint16 x, Sint16 y,
            Sint16 rx, Sint16 ry, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int aaellipseColor(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rx, Sint16 ry, Uint32 color);
        int aaellipseRGBA(SDL_Renderer * dst, Sint16 x, Sint16 y,
            Sint16 rx, Sint16 ry, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int filledEllipseColor(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rx, Sint16 ry, Uint32 color);
        int filledEllipseRGBA(SDL_Renderer * dst, Sint16 x, Sint16 y,
            Sint16 rx, Sint16 ry, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int pieColor(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rad,
            Sint16 start, Sint16 end, Uint32 color);
        int pieRGBA(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rad,
            Sint16 start, Sint16 end, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int filledPieColor(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rad,
            Sint16 start, Sint16 end, Uint32 color);
        int filledPieRGBA(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rad,
            Sint16 start, Sint16 end, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int trigonColor(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Sint16 x3, Sint16 y3, Uint32 color);
        int trigonRGBA(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Sint16 x3, Sint16 y3,
            Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int aatrigonColor(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Sint16 x3, Sint16 y3, Uint32 color);
        int aatrigonRGBA(SDL_Renderer * dst,  Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Sint16 x3, Sint16 y3,
            Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int filledTrigonColor(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Sint16 x3, Sint16 y3, Uint32 color);
        int filledTrigonRGBA(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Sint16 x3, Sint16 y3,
            Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int polygonColor(SDL_Renderer * dst, const Sint16 * vx, const Sint16 * vy, int n, Uint32 color);
        int polygonRGBA(SDL_Renderer * dst, const Sint16 * vx, const Sint16 * vy,
            int n, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int aapolygonColor(SDL_Renderer * dst, const Sint16 * vx, const Sint16 * vy, int n, Uint32 color);
        int aapolygonRGBA(SDL_Renderer * dst, const Sint16 * vx, const Sint16 * vy,
            int n, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int filledPolygonColor(SDL_Renderer * dst, const Sint16 * vx, const Sint16 * vy, int n, Uint32 color);
        int filledPolygonRGBA(SDL_Renderer * dst, const Sint16 * vx,
            const Sint16 * vy, int n, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int texturedPolygon(SDL_Renderer * dst, const Sint16 * vx, const Sint16 * vy, int n, SDL_Renderer * texture,int texture_dx,int texture_dy);
        //int filledPolygonColorMT(SDL_Renderer * dst, const Sint16 * vx, const Sint16 * vy, int n, Uint32 color, int **polyInts, int *polyAllocated);
        int filledPolygonRGBAMT(SDL_Renderer * dst, const Sint16 * vx,
            const Sint16 * vy, int n, Uint8 r, Uint8 g, Uint8 b, Uint8 a,
            int **polyInts, int *polyAllocated);
        int texturedPolygonMT(SDL_Renderer * dst, const Sint16 * vx, const Sint16 * vy, int n, SDL_Renderer * texture,int texture_dx,int texture_dy, int **polyInts, int *polyAllocated);
        int bezierColor(SDL_Renderer * dst, const Sint16 * vx, const Sint16 * vy, int n, int s, Uint32 color);
        int bezierRGBA(SDL_Renderer * dst, const Sint16 * vx, const Sint16 * vy,
            int n, int s, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        void gfxPrimitivesSetFont(const void *fontdata, Uint32 cw, Uint32 ch);
        void gfxPrimitivesSetFontRotation(Uint32 rotation);
        int characterColor(SDL_Renderer * dst, Sint16 x, Sint16 y, char c, Uint32 color);
        int characterRGBA(SDL_Renderer * dst, Sint16 x, Sint16 y, char c, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        int stringColor(SDL_Renderer * dst, Sint16 x, Sint16 y, const char *s, Uint32 color);
        int stringRGBA(SDL_Renderer * dst, Sint16 x, Sint16 y, const char *s, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        //int SDL_gfxBlitRGBA(SDL_Renderer * src, SDL_Rect * srcrect, SDL_Renderer * dst, SDL_Rect * dstrect);
        //int SDL_gfxSetAlpha(SDL_Renderer * src, Uint8 a);
        //int SDL_gfxMultiplyAlpha(SDL_Renderer * src, Uint8 a);

        // SDL_imageFilter.h: byte-image "filter" routines 
        int SDL_imageFilterMMXdetect();
        void SDL_imageFilterMMXoff();
        void SDL_imageFilterMMXon();
        int SDL_imageFilterAdd(ubyte *Src1, ubyte *Src2, ubyte *Dest, uint length);
        int SDL_imageFilterMean(ubyte *Src1, ubyte *Src2, ubyte *Dest, uint length);
        int SDL_imageFilterSub(ubyte *Src1, ubyte *Src2, ubyte *Dest, uint length);
        int SDL_imageFilterAbsDiff(ubyte *Src1, ubyte *Src2, ubyte *Dest, uint length);
        int SDL_imageFilterMult(ubyte *Src1, ubyte *Src2, ubyte *Dest, uint length);
        int SDL_imageFilterMultNor(ubyte *Src1, ubyte *Src2, ubyte *Dest, uint length);
        int SDL_imageFilterMultDivby2(ubyte *Src1, ubyte *Src2, ubyte *Dest,
            uint length);
        int SDL_imageFilterMultDivby4(ubyte *Src1, ubyte *Src2, ubyte *Dest,
            uint length);
        int SDL_imageFilterBitAnd(ubyte *Src1, ubyte *Src2, ubyte *Dest, uint length);
        int SDL_imageFilterBitOr(ubyte *Src1, ubyte *Src2, ubyte *Dest, uint length);
        int SDL_imageFilterDiv(ubyte *Src1, ubyte *Src2, ubyte *Dest, uint length);
        int SDL_imageFilterBitNegation(ubyte *Src1, ubyte *Dest, uint length);
        int SDL_imageFilterAddByte(ubyte *Src1, ubyte *Dest, uint length, ubyte C);
        int SDL_imageFilterAddUint(ubyte *Src1, ubyte *Dest, uint length, uint C);
        int SDL_imageFilterAddByteToHalf(ubyte *Src1, ubyte *Dest, uint length,
            ubyte C);
        int SDL_imageFilterSubByte(ubyte *Src1, ubyte *Dest, uint length, ubyte C);
        int SDL_imageFilterSubUint(ubyte *Src1, ubyte *Dest, uint length, uint C);
        int SDL_imageFilterShiftRight(ubyte *Src1, ubyte *Dest, uint length, ubyte N);
        int SDL_imageFilterShiftRightUint(ubyte *Src1, ubyte *Dest, uint length, ubyte N);
        int SDL_imageFilterMultByByte(ubyte *Src1, ubyte *Dest, uint length, ubyte C);
        int SDL_imageFilterShiftRightAndMultByByte(ubyte *Src1, ubyte *Dest, uint length,
            ubyte N, ubyte C);
        int SDL_imageFilterShiftLeftByte(ubyte *Src1, ubyte *Dest, uint length,
            ubyte N);
        int SDL_imageFilterShiftLeftUint(ubyte *Src1, ubyte *Dest, uint length,
            ubyte N);
        int SDL_imageFilterShiftLeft(ubyte *Src1, ubyte *Dest, uint length, ubyte N);
        int SDL_imageFilterBinarizeUsingThreshold(ubyte *Src1, ubyte *Dest, uint length,
            ubyte T);
        int SDL_imageFilterClipToRange(ubyte *Src1, ubyte *Dest, uint length,
            ubyte Tmin, ubyte Tmax);
        int SDL_imageFilterNormalizeLinear(ubyte *Src, ubyte *Dest, uint length, int Cmin,
            int Cmax, int Nmin, int Nmax);
        int SDL_imageFilterConvolveKernel3x3Divide(ubyte *Src, ubyte *Dest, int rows,
            int columns, short *Kernel, ubyte Divisor);
        int SDL_imageFilterConvolveKernel5x5Divide(ubyte *Src, ubyte *Dest, int rows,
            int columns, short *Kernel, ubyte Divisor);
        int SDL_imageFilterConvolveKernel7x7Divide(ubyte *Src, ubyte *Dest, int rows,
            int columns, short *Kernel, ubyte Divisor);
        int SDL_imageFilterConvolveKernel9x9Divide(ubyte *Src, ubyte *Dest, int rows,
            int columns, short *Kernel, ubyte Divisor);
        int SDL_imageFilterConvolveKernel3x3ShiftRight(ubyte *Src, ubyte *Dest, int rows,
            int columns, short *Kernel,
            ubyte NRightShift);
        int SDL_imageFilterConvolveKernel5x5ShiftRight(ubyte *Src, ubyte *Dest, int rows,
            int columns, short *Kernel,
            ubyte NRightShift);
        int SDL_imageFilterConvolveKernel7x7ShiftRight(ubyte *Src, ubyte *Dest, int rows,
            int columns, short *Kernel,
            ubyte NRightShift);
        int SDL_imageFilterConvolveKernel9x9ShiftRight(ubyte *Src, ubyte *Dest, int rows,
            int columns, short *Kernel,
            ubyte NRightShift);
        int SDL_imageFilterSobelX(ubyte *Src, ubyte *Dest, int rows, int columns);
        int SDL_imageFilterSobelXShiftRight(ubyte *Src, ubyte *Dest, int rows, int columns,
            ubyte NRightShift);
        void SDL_imageFilterAlignStack();
        void SDL_imageFilterRestoreStack();

        // SDL_rotozoom.h: rotozoomer, zoomer and shrinker for 32bit or 8bit surfaces
        SDL_Renderer *rotozoomSurface(SDL_Renderer * src, double angle, double zoom, int smooth);
        SDL_Renderer *rotozoomSurfaceXY
            (SDL_Renderer * src, double angle, double zoomx, double zoomy, int smooth);
        void rotozoomSurfaceSize(int width, int height, double angle, double zoom, int *dstwidth,
            int *dstheight);
        void rotozoomSurfaceSizeXY
            (int width, int height, double angle, double zoomx, double zoomy, 
            int *dstwidth, int *dstheight);
        SDL_Renderer *zoomSurface(SDL_Renderer * src, double zoomx, double zoomy, int smooth);
        void zoomSurfaceSize(int width, int height, double zoomx, double zoomy, int *dstwidth, int *dstheight);
        SDL_Renderer *shrinkSurface(SDL_Renderer * src, int factorx, int factory);
        //SDL_Renderer* rotateSurface90Degrees(SDL_Renderer* src, int numClockwiseTurns);
    }
} else {
    extern(C) @nogc nothrow {
        // SDL_gfxPrimitives.h: graphics primitives for SDL
        alias p_pixelColor = int function(SDL_Renderer * dst, Sint16 x, Sint16 y, Uint32 color);
        alias p_pixelRGBA = int function(SDL_Renderer * dst, Sint16 x, Sint16 y, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_hlineColor = int function (SDL_Renderer * dst, Sint16 x1, Sint16 x2, Sint16 y, Uint32 color);
        alias p_hlineRGBA = int function(SDL_Renderer * dst, Sint16 x1, Sint16 x2, Sint16 y, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_vlineColor = int function(SDL_Renderer * dst, Sint16 x, Sint16 y1, Sint16 y2, Uint32 color);
        alias p_vlineRGBA = int function(SDL_Renderer * dst, Sint16 x, Sint16 y1, Sint16 y2, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_rectangleColor = int function(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Uint32 color);
        alias p_rectangleRGBA = int function(SDL_Renderer * dst, Sint16 x1, Sint16 y1,
            Sint16 x2, Sint16 y2, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_roundedRectangleColor = int function(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Sint16 rad, Uint32 color);
        alias p_roundedRectangleRGBA = int function(SDL_Renderer * dst, Sint16 x1, Sint16 y1,
            Sint16 x2, Sint16 y2, Sint16 rad, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_boxColor = int function(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Uint32 color);
        alias p_boxRGBA = int function(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2,
            Sint16 y2, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_roundedBoxColor = int function(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Sint16 rad, Uint32 color);
        alias p_roundedBoxRGBA = int function(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2,
            Sint16 y2, Sint16 rad, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_lineColor = int function(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Uint32 color);
        alias p_lineRGBA = int function(SDL_Renderer * dst, Sint16 x1, Sint16 y1,
            Sint16 x2, Sint16 y2, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_aalineColor = int function(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Uint32 color);
        alias p_aalineRGBA = int function(SDL_Renderer * dst, Sint16 x1, Sint16 y1,
            Sint16 x2, Sint16 y2, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_thickLineColor = int function(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, 
            Uint8 width, Uint32 color);
        alias p_thickLineRGBA = int function(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, 
            Uint8 width, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_circleColor = int function(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rad, Uint32 color);
        alias p_circleRGBA = int function(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rad, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_arcColor = int function(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rad, Sint16 start, Sint16 end, Uint32 color);
        alias p_arcRGBA = int function(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rad, Sint16 start, Sint16 end, 
            Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_aacircleColor = int function(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rad, Uint32 color);
        alias p_aacircleRGBA = int function(SDL_Renderer * dst, Sint16 x, Sint16 y,
            Sint16 rad, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_filledCircleColor = int function(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 r, Uint32 color);
        alias p_filledCircleRGBA = int function(SDL_Renderer * dst, Sint16 x, Sint16 y,
            Sint16 rad, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_ellipseColor = int function(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rx, Sint16 ry, Uint32 color);
        alias p_ellipseRGBA = int function(SDL_Renderer * dst, Sint16 x, Sint16 y,
            Sint16 rx, Sint16 ry, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_aaellipseColor = int function(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rx, Sint16 ry, Uint32 color);
        alias p_aaellipseRGBA = int function(SDL_Renderer * dst, Sint16 x, Sint16 y,
            Sint16 rx, Sint16 ry, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_filledEllipseColor = int function(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rx, Sint16 ry, Uint32 color);
        alias p_filledEllipseRGBA = int function(SDL_Renderer * dst, Sint16 x, Sint16 y,
            Sint16 rx, Sint16 ry, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_pieColor = int function(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rad,
            Sint16 start, Sint16 end, Uint32 color);
        alias p_pieRGBA = int function(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rad,
            Sint16 start, Sint16 end, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_filledPieColor = int function(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rad,
            Sint16 start, Sint16 end, Uint32 color);
        alias p_filledPieRGBA = int function(SDL_Renderer * dst, Sint16 x, Sint16 y, Sint16 rad,
            Sint16 start, Sint16 end, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_trigonColor = int function(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Sint16 x3, Sint16 y3, Uint32 color);
        alias p_trigonRGBA = int function(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Sint16 x3, Sint16 y3,
            Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_aatrigonColor = int function(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Sint16 x3, Sint16 y3, Uint32 color);
        alias p_aatrigonRGBA = int function(SDL_Renderer * dst,  Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Sint16 x3, Sint16 y3,
            Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_filledTrigonColor = int function(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Sint16 x3, Sint16 y3, Uint32 color);
        alias p_filledTrigonRGBA = int function(SDL_Renderer * dst, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Sint16 x3, Sint16 y3,
            Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_polygonColor = int function(SDL_Renderer * dst, const Sint16 * vx, const Sint16 * vy, int n, Uint32 color);
        alias p_polygonRGBA = int function(SDL_Renderer * dst, const Sint16 * vx, const Sint16 * vy,
            int n, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_aapolygonColor = int function(SDL_Renderer * dst, const Sint16 * vx, const Sint16 * vy, int n, Uint32 color);
        alias p_aapolygonRGBA = int function(SDL_Renderer * dst, const Sint16 * vx, const Sint16 * vy,
            int n, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_filledPolygonColor = int function(SDL_Renderer * dst, const Sint16 * vx, const Sint16 * vy, int n, Uint32 color);
        alias p_filledPolygonRGBA = int function(SDL_Renderer * dst, const Sint16 * vx,
            const Sint16 * vy, int n, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_texturedPolygon = int function(SDL_Renderer * dst, const Sint16 * vx, const Sint16 * vy, int n, SDL_Renderer * texture,int texture_dx,int texture_dy);
        //alias p_filledPolygonColorMT = int function(SDL_Renderer * dst, const Sint16 * vx, const Sint16 * vy, int n, Uint32 color, int **polyInts, int *polyAllocated);
        alias p_filledPolygonRGBAMT = int function(SDL_Renderer * dst, const Sint16 * vx,
            const Sint16 * vy, int n, Uint8 r, Uint8 g, Uint8 b, Uint8 a,
            int **polyInts, int *polyAllocated);
        alias p_texturedPolygonMT = int function(SDL_Renderer * dst, const Sint16 * vx, const Sint16 * vy, int n, SDL_Renderer * texture,int texture_dx,int texture_dy, int **polyInts, int *polyAllocated);
        alias p_bezierColor = int function(SDL_Renderer * dst, const Sint16 * vx, const Sint16 * vy, int n, int s, Uint32 color);
        alias p_bezierRGBA = int function(SDL_Renderer * dst, const Sint16 * vx, const Sint16 * vy,
            int n, int s, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_gfxPrimitivesSetFont = void function(const void *fontdata, Uint32 cw, Uint32 ch);
        alias p_gfxPrimitivesSetFontRotation = void function(Uint32 rotation);
        alias p_characterColor = int function(SDL_Renderer * dst, Sint16 x, Sint16 y, char c, Uint32 color);
        alias p_characterRGBA = int function(SDL_Renderer * dst, Sint16 x, Sint16 y, char c, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        alias p_stringColor = int function(SDL_Renderer * dst, Sint16 x, Sint16 y, const char *s, Uint32 color);
        alias p_stringRGBA = int function(SDL_Renderer * dst, Sint16 x, Sint16 y, const char *s, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
        //alias p_SDL_gfxBlitRGBA = int function(SDL_Renderer * src, SDL_Rect * srcrect, SDL_Renderer * dst, SDL_Rect * dstrect);
        //alias p_SDL_gfxSetAlpha = int function(SDL_Renderer * src, Uint8 a);
        //alias p_SDL_gfxMultiplyAlpha = int function(SDL_Renderer * src, Uint8 a);

        // SDL_imageFilter.h: byte-image "filter" routines 
        alias p_SDL_imageFilterMMXdetect = int function();
        alias p_SDL_imageFilterMMXoff = void function();
        alias p_SDL_imageFilterMMXon = void function();
        alias p_SDL_imageFilterAdd = int function(ubyte *Src1, ubyte *Src2, ubyte *Dest, uint length);
        alias p_SDL_imageFilterMean = int function(ubyte *Src1, ubyte *Src2, ubyte *Dest, uint length);
        alias p_SDL_imageFilterSub = int function(ubyte *Src1, ubyte *Src2, ubyte *Dest, uint length);
        alias p_SDL_imageFilterAbsDiff = int function(ubyte *Src1, ubyte *Src2, ubyte *Dest, uint length);
        alias p_SDL_imageFilterMult = int function(ubyte *Src1, ubyte *Src2, ubyte *Dest, uint length);
        alias p_SDL_imageFilterMultNor = int function(ubyte *Src1, ubyte *Src2, ubyte *Dest, uint length);
        alias p_SDL_imageFilterMultDivby2 = int function(ubyte *Src1, ubyte *Src2, ubyte *Dest,
            uint length);
        alias p_SDL_imageFilterMultDivby4 = int function(ubyte *Src1, ubyte *Src2, ubyte *Dest,
            uint length);
        alias p_SDL_imageFilterBitAnd = int function(ubyte *Src1, ubyte *Src2, ubyte *Dest, uint length);
        alias p_SDL_imageFilterBitOr = int function(ubyte *Src1, ubyte *Src2, ubyte *Dest, uint length);
        alias p_SDL_imageFilterDiv = int function(ubyte *Src1, ubyte *Src2, ubyte *Dest, uint length);
        alias p_SDL_imageFilterBitNegation = int function(ubyte *Src1, ubyte *Dest, uint length);
        alias p_SDL_imageFilterAddByte = int function(ubyte *Src1, ubyte *Dest, uint length, ubyte C);
        alias p_SDL_imageFilterAddUint = int function(ubyte *Src1, ubyte *Dest, uint length, uint C);
        alias p_SDL_imageFilterAddByteToHalf = int function(ubyte *Src1, ubyte *Dest, uint length,
            ubyte C);
        alias p_SDL_imageFilterSubByte = int function(ubyte *Src1, ubyte *Dest, uint length, ubyte C);
        alias p_SDL_imageFilterSubUint = int function(ubyte *Src1, ubyte *Dest, uint length, uint C);
        alias p_SDL_imageFilterShiftRight = int function(ubyte *Src1, ubyte *Dest, uint length, ubyte N);
        alias p_SDL_imageFilterShiftRightUint = int function(ubyte *Src1, ubyte *Dest, uint length, ubyte N);
        alias p_SDL_imageFilterMultByByte = int function(ubyte *Src1, ubyte *Dest, uint length, ubyte C);
        alias p_SDL_imageFilterShiftRightAndMultByByte = int function(ubyte *Src1, ubyte *Dest, uint length,
            ubyte N, ubyte C);
        alias p_SDL_imageFilterShiftLeftByte = int function(ubyte *Src1, ubyte *Dest, uint length,
            ubyte N);
        alias p_SDL_imageFilterShiftLeftUint = int function(ubyte *Src1, ubyte *Dest, uint length,
            ubyte N);
        alias p_SDL_imageFilterShiftLeft = int function(ubyte *Src1, ubyte *Dest, uint length, ubyte N);
        alias p_SDL_imageFilterBinarizeUsingThreshold = int function(ubyte *Src1, ubyte *Dest, uint length,
            ubyte T);
        alias p_SDL_imageFilterClipToRange = int function(ubyte *Src1, ubyte *Dest, uint length,
            ubyte Tmin, ubyte Tmax);
        alias p_SDL_imageFilterNormalizeLinear = int function(ubyte *Src, ubyte *Dest, uint length, int Cmin,
            int Cmax, int Nmin, int Nmax);
        alias p_SDL_imageFilterConvolveKernel3x3Divide = int function(ubyte *Src, ubyte *Dest, int rows,
            int columns, short *Kernel, ubyte Divisor);
        alias p_SDL_imageFilterConvolveKernel5x5Divide = int function(ubyte *Src, ubyte *Dest, int rows,
            int columns, short *Kernel, ubyte Divisor);
        alias p_SDL_imageFilterConvolveKernel7x7Divide = int function(ubyte *Src, ubyte *Dest, int rows,
            int columns, short *Kernel, ubyte Divisor);
        alias p_SDL_imageFilterConvolveKernel9x9Divide = int function(ubyte *Src, ubyte *Dest, int rows,
            int columns, short *Kernel, ubyte Divisor);
        alias p_SDL_imageFilterConvolveKernel3x3ShiftRight = int function(ubyte *Src, ubyte *Dest, int rows,
            int columns, short *Kernel,
            ubyte NRightShift);
        alias p_SDL_imageFilterConvolveKernel5x5ShiftRight = int function(ubyte *Src, ubyte *Dest, int rows,
            int columns, short *Kernel,
            ubyte NRightShift);
        alias p_SDL_imageFilterConvolveKernel7x7ShiftRight = int function(ubyte *Src, ubyte *Dest, int rows,
            int columns, short *Kernel,
            ubyte NRightShift);
        alias p_SDL_imageFilterConvolveKernel9x9ShiftRight = int function(ubyte *Src, ubyte *Dest, int rows,
            int columns, short *Kernel,
            ubyte NRightShift);
        alias p_SDL_imageFilterSobelX = int function(ubyte *Src, ubyte *Dest, int rows, int columns);
        alias p_SDL_imageFilterSobelXShiftRight = int function(ubyte *Src, ubyte *Dest, int rows, int columns,
            ubyte NRightShift);
        alias p_SDL_imageFilterAlignStack = void function();
        alias p_SDL_imageFilterRestoreStack = void function();

        // SDL_rotozoom.h: rotozoomer, zoomer and shrinker for 32bit or 8bit surfaces
        alias p_rotozoomSurface = SDL_Renderer* function(SDL_Renderer * src, double angle, double zoom, int smooth);
        alias p_rotozoomSurfaceXY = SDL_Renderer* function
            (SDL_Renderer * src, double angle, double zoomx, double zoomy, int smooth);
        alias p_rotozoomSurfaceSize = void function(int width, int height, double angle, double zoom, int *dstwidth,
            int *dstheight);
        alias p_rotozoomSurfaceSizeXY = void function
            (int width, int height, double angle, double zoomx, double zoomy, 
            int *dstwidth, int *dstheight);
        alias p_zoomSurface = SDL_Renderer* function(SDL_Renderer * src, double zoomx, double zoomy, int smooth);
        alias p_zoomSurfaceSize = void function(int width, int height, double zoomx, double zoomy, int *dstwidth, int *dstheight);
        alias p_shrinkSurface = SDL_Renderer* function(SDL_Renderer * src, int factorx, int factory);
        //alias p_rotateSurface90Degrees = SDL_Renderer* function(SDL_Renderer* src, int numClockwiseTurns);
    }

    __gshared {
        p_pixelColor pixelColor;
        p_pixelRGBA pixelRGBA;
        p_hlineColor hlineColor;
        p_hlineRGBA hlineRGBA;
        p_vlineColor vlineColor;
        p_vlineRGBA vlineRGBA;
        p_rectangleColor rectangleColor;
        p_rectangleRGBA rectangleRGBA;
        p_roundedRectangleColor roundedRectangleColor;
        p_roundedRectangleRGBA roundedRectangleRGBA;
        p_boxColor boxColor;
        p_boxRGBA boxRGBA;
        p_roundedBoxColor roundedBoxColor;
        p_roundedBoxRGBA roundedBoxRGBA;
        p_lineColor lineColor;
        p_lineRGBA lineRGBA;
        p_aalineColor aalineColor;
        p_aalineRGBA aalineRGBA;
        p_thickLineColor thickLineColor;
        p_thickLineRGBA thickLineRGBA;
        p_circleColor circleColor;
        p_circleRGBA circleRGBA;
        p_arcColor arcColor;
        p_arcRGBA arcRGBA;
        p_aacircleColor aacircleColor;
        p_aacircleRGBA aacircleRGBA;
        p_filledCircleColor filledCircleColor;
        p_filledCircleRGBA filledCircleRGBA;
        p_ellipseColor ellipseColor;
        p_ellipseRGBA ellipseRGBA;
        p_aaellipseColor aaellipseColor;
        p_aaellipseRGBA aaellipseRGBA;
        p_filledEllipseColor filledEllipseColor;
        p_filledEllipseRGBA filledEllipseRGBA;
        p_pieColor pieColor;
        p_pieRGBA pieRGBA;
        p_filledPieColor filledPieColor;
        p_filledPieRGBA filledPieRGBA;
        p_trigonColor trigonColor;
        p_trigonRGBA trigonRGBA;
        p_aatrigonColor aatrigonColor;
        p_aatrigonRGBA aatrigonRGBA;
        p_filledTrigonColor filledTrigonColor;
        p_filledTrigonRGBA filledTrigonRGBA;
        p_polygonColor polygonColor;
        p_polygonRGBA polygonRGBA;
        p_aapolygonColor aapolygonColor;
        p_aapolygonRGBA aapolygonRGBA;
        p_filledPolygonColor filledPolygonColor;
        p_filledPolygonRGBA filledPolygonRGBA;
        p_texturedPolygon texturedPolygon;
        //p_filledPolygonColorMT filledPolygonColorMT;
        p_filledPolygonRGBAMT filledPolygonRGBAMT;
        p_texturedPolygonMT texturedPolygonMT;
        p_bezierColor bezierColor;
        p_bezierRGBA bezierRGBA;
        p_gfxPrimitivesSetFont gfxPrimitivesSetFont;
        p_gfxPrimitivesSetFontRotation gfxPrimitivesSetFontRotation;
        p_characterColor characterColor;
        p_characterRGBA characterRGBA;
        p_stringColor stringColor;
        p_stringRGBA stringRGBA;
        //p_SDL_gfxBlitRGBA SDL_gfxBlitRGBA;
        //p_SDL_gfxSetAlpha SDL_gfxSetAlpha;
        //p_SDL_gfxMultiplyAlpha SDL_gfxMultiplyAlpha;
        p_SDL_imageFilterMMXdetect SDL_imageFilterMMXdetect;
        p_SDL_imageFilterMMXoff SDL_imageFilterMMXoff;
        p_SDL_imageFilterMMXon SDL_imageFilterMMXon;
        p_SDL_imageFilterAdd SDL_imageFilterAdd;
        p_SDL_imageFilterMean SDL_imageFilterMean;
        p_SDL_imageFilterSub SDL_imageFilterSub;
        p_SDL_imageFilterAbsDiff SDL_imageFilterAbsDiff;
        p_SDL_imageFilterMult SDL_imageFilterMult;
        p_SDL_imageFilterMultNor SDL_imageFilterMultNor;
        p_SDL_imageFilterMultDivby2 SDL_imageFilterMultDivby2;
        p_SDL_imageFilterMultDivby4 SDL_imageFilterMultDivby4;
        p_SDL_imageFilterBitAnd SDL_imageFilterBitAnd;
        p_SDL_imageFilterBitOr SDL_imageFilterBitOr;
        p_SDL_imageFilterDiv SDL_imageFilterDiv;
        p_SDL_imageFilterBitNegation SDL_imageFilterBitNegation;
        p_SDL_imageFilterAddByte SDL_imageFilterAddByte;
        p_SDL_imageFilterAddUint SDL_imageFilterAddUint;
        p_SDL_imageFilterAddByteToHalf SDL_imageFilterAddByteToHalf;
        p_SDL_imageFilterSubByte SDL_imageFilterSubByte;
        p_SDL_imageFilterSubUint SDL_imageFilterSubUint;
        p_SDL_imageFilterShiftRight SDL_imageFilterShiftRight;
        p_SDL_imageFilterShiftRightUint SDL_imageFilterShiftRightUint;
        p_SDL_imageFilterMultByByte SDL_imageFilterMultByByte;
        p_SDL_imageFilterShiftRightAndMultByByte SDL_imageFilterShiftRightAndMultByByte;
        p_SDL_imageFilterShiftLeftByte SDL_imageFilterShiftLeftByte;
        p_SDL_imageFilterShiftLeftUint SDL_imageFilterShiftLeftUint;
        p_SDL_imageFilterShiftLeft SDL_imageFilterShiftLeft;
        p_SDL_imageFilterBinarizeUsingThreshold SDL_imageFilterBinarizeUsingThreshold;
        p_SDL_imageFilterClipToRange SDL_imageFilterClipToRange;
        p_SDL_imageFilterNormalizeLinear SDL_imageFilterNormalizeLinear;
        p_SDL_imageFilterConvolveKernel3x3Divide SDL_imageFilterConvolveKernel3x3Divide;
        p_SDL_imageFilterConvolveKernel5x5Divide SDL_imageFilterConvolveKernel5x5Divide;
        p_SDL_imageFilterConvolveKernel7x7Divide SDL_imageFilterConvolveKernel7x7Divide;
        p_SDL_imageFilterConvolveKernel9x9Divide SDL_imageFilterConvolveKernel9x9Divide;
        p_SDL_imageFilterConvolveKernel3x3ShiftRight SDL_imageFilterConvolveKernel3x3ShiftRight;
        p_SDL_imageFilterConvolveKernel5x5ShiftRight SDL_imageFilterConvolveKernel5x5ShiftRight;
        p_SDL_imageFilterConvolveKernel7x7ShiftRight SDL_imageFilterConvolveKernel7x7ShiftRight;
        p_SDL_imageFilterConvolveKernel9x9ShiftRight SDL_imageFilterConvolveKernel9x9ShiftRight;
        p_SDL_imageFilterSobelX SDL_imageFilterSobelX;
        p_SDL_imageFilterSobelXShiftRight SDL_imageFilterSobelXShiftRight;
        p_SDL_imageFilterAlignStack SDL_imageFilterAlignStack;
        p_SDL_imageFilterRestoreStack SDL_imageFilterRestoreStack;
        p_rotozoomSurface rotozoomSurface;
        p_rotozoomSurfaceXY rotozoomSurfaceXY;
        p_rotozoomSurfaceSize rotozoomSurfaceSize;
        p_rotozoomSurfaceSizeXY rotozoomSurfaceSizeXY;
        p_zoomSurface zoomSurface;
        p_zoomSurfaceSize zoomSurfaceSize;
        p_shrinkSurface shrinkSurface;
        //p_rotateSurface90Degrees rotateSurface90Degree;
    }
}