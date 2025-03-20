module bindbc.sdlgfx.dynload;

import bindbc.sdlgfx.defs;

version(BindSDLgfx_Static) {}
else version = BindSDLgfx_Dynamic;

version(BindSDLgfx_Dynamic):

import bindbc.loader;

private {
    SharedLib lib;
    SDLgfxSupport loadedVersion;
}

enum SDLgfxSupport {
    noLibrary,
    badLibrary,
    SDLgfx
}

void unloadSDLgfx()
{
    if(lib != invalidHandle) {
        lib.unload();
    }
}

SDLgfxSupport loadedSDLgfxVersion() { return loadedVersion; }

bool isSDLgfxLoaded() { return lib != invalidHandle; }

SDLgfxSupport loadSDLgfx()
{
    version(Windows) {
        const(char)[][1] libNames = ["SDL2_gfx.dll"];
    }
    else version(OSX) {
        const(char)[][3] libNames = [
            "../Frameworks/SDL2_gfx.framework/SDL2_gfx",
            "/Library/Frameworks/SDL2_gfx.framework/SDL2_gfx",
            "/System/Library/Frameworks/SDL2_gfx.framework/SDL2_gfx"
        ];
    }
    else version(Posix) {
        const(char)[][1] libNames = [
            "libSDL2_gfx.so"
        ];
    }
    else static assert(0, "bindbc-SDLgfx is not yet supported on this platform");
    
    SDLgfxSupport ret;
    foreach(name; libNames) {
        ret = loadSDLgfx(name.ptr);
        if(ret != SDLgfxSupport.noLibrary) break;
    }
    return ret;
}

SDLgfxSupport loadSDLgfx(const(char)* libName)
{
    // If the library isn't yet loaded, load it now.
    if(lib == invalidHandle) {
        lib = load(libName);
        if(lib == invalidHandle) {
            return SDLgfxSupport.noLibrary;
        }
    }

    auto errCount = errorCount();

    lib.bindSymbol(cast(void**)&pixelColor, "pixelColor");
    lib.bindSymbol(cast(void**)&pixelRGBA, "pixelRGBA");
    lib.bindSymbol(cast(void**)&hlineColor, "hlineColor");
    lib.bindSymbol(cast(void**)&hlineRGBA, "hlineRGBA");
    lib.bindSymbol(cast(void**)&vlineColor, "vlineColor");
    lib.bindSymbol(cast(void**)&vlineRGBA, "vlineRGBA");
    lib.bindSymbol(cast(void**)&rectangleColor, "rectangleColor");
    lib.bindSymbol(cast(void**)&rectangleRGBA, "rectangleRGBA");
    lib.bindSymbol(cast(void**)&roundedRectangleColor, "roundedRectangleColor");
    lib.bindSymbol(cast(void**)&roundedRectangleRGBA, "roundedRectangleRGBA");
    lib.bindSymbol(cast(void**)&boxColor, "boxColor");
    lib.bindSymbol(cast(void**)&boxRGBA, "boxRGBA");
    lib.bindSymbol(cast(void**)&roundedBoxColor, "roundedBoxColor");
    lib.bindSymbol(cast(void**)&roundedBoxRGBA, "roundedBoxRGBA");
    lib.bindSymbol(cast(void**)&lineColor, "lineColor");
    lib.bindSymbol(cast(void**)&lineRGBA, "lineRGBA");
    lib.bindSymbol(cast(void**)&aalineColor, "aalineColor");
    lib.bindSymbol(cast(void**)&aalineRGBA, "aalineRGBA");
    lib.bindSymbol(cast(void**)&thickLineColor, "thickLineColor");
    lib.bindSymbol(cast(void**)&thickLineRGBA, "thickLineRGBA");
    lib.bindSymbol(cast(void**)&circleColor, "circleColor");
    lib.bindSymbol(cast(void**)&circleRGBA, "circleRGBA");
    lib.bindSymbol(cast(void**)&arcColor, "arcColor");
    lib.bindSymbol(cast(void**)&arcRGBA, "arcRGBA");
    lib.bindSymbol(cast(void**)&aacircleColor, "aacircleColor");
    lib.bindSymbol(cast(void**)&aacircleRGBA, "aacircleRGBA");
    lib.bindSymbol(cast(void**)&filledCircleColor, "filledCircleColor");
    lib.bindSymbol(cast(void**)&filledCircleRGBA, "filledCircleRGBA");
    lib.bindSymbol(cast(void**)&ellipseColor, "ellipseColor");
    lib.bindSymbol(cast(void**)&ellipseRGBA, "ellipseRGBA");
    lib.bindSymbol(cast(void**)&aaellipseColor, "aaellipseColor");
    lib.bindSymbol(cast(void**)&aaellipseRGBA, "aaellipseRGBA");
    lib.bindSymbol(cast(void**)&filledEllipseColor, "filledEllipseColor");
    lib.bindSymbol(cast(void**)&filledEllipseRGBA, "filledEllipseRGBA");
    lib.bindSymbol(cast(void**)&pieColor, "pieColor");
    lib.bindSymbol(cast(void**)&pieRGBA, "pieRGBA");
    lib.bindSymbol(cast(void**)&filledPieColor, "filledPieColor");
    lib.bindSymbol(cast(void**)&filledPieRGBA, "filledPieRGBA");
    lib.bindSymbol(cast(void**)&trigonColor, "trigonColor");
    lib.bindSymbol(cast(void**)&trigonRGBA, "trigonRGBA");
    lib.bindSymbol(cast(void**)&aatrigonColor, "aatrigonColor");
    lib.bindSymbol(cast(void**)&aatrigonRGBA, "aatrigonRGBA");
    lib.bindSymbol(cast(void**)&filledTrigonColor, "filledTrigonColor");
    lib.bindSymbol(cast(void**)&filledTrigonRGBA, "filledTrigonRGBA");
    lib.bindSymbol(cast(void**)&polygonColor, "polygonColor");
    lib.bindSymbol(cast(void**)&polygonRGBA, "polygonRGBA");
    lib.bindSymbol(cast(void**)&aapolygonColor, "aapolygonColor");
    lib.bindSymbol(cast(void**)&aapolygonRGBA, "aapolygonRGBA");
    lib.bindSymbol(cast(void**)&filledPolygonColor, "filledPolygonColor");
    lib.bindSymbol(cast(void**)&filledPolygonRGBA, "filledPolygonRGBA");
    lib.bindSymbol(cast(void**)&texturedPolygon, "texturedPolygon");
    //lib.bindSymbol(cast(void**)&filledPolygonColorMT, "filledPolygonColorMT");
    lib.bindSymbol(cast(void**)&filledPolygonRGBAMT, "filledPolygonRGBAMT");
    lib.bindSymbol(cast(void**)&texturedPolygonMT, "texturedPolygonMT");
    lib.bindSymbol(cast(void**)&bezierColor, "bezierColor");
    lib.bindSymbol(cast(void**)&bezierRGBA, "bezierRGBA");
    lib.bindSymbol(cast(void**)&gfxPrimitivesSetFont, "gfxPrimitivesSetFont");
    lib.bindSymbol(cast(void**)&gfxPrimitivesSetFontRotation, "gfxPrimitivesSetFontRotation");
    lib.bindSymbol(cast(void**)&characterColor, "characterColor");
    lib.bindSymbol(cast(void**)&characterRGBA, "characterRGBA");
    lib.bindSymbol(cast(void**)&stringColor, "stringColor");
    lib.bindSymbol(cast(void**)&stringRGBA, "stringRGBA");
    //lib.bindSymbol(cast(void**)&SDL_gfxBlitRGBA, "SDL_gfxBlitRGBA");
    //lib.bindSymbol(cast(void**)&SDL_gfxSetAlpha, "SDL_gfxSetAlpha");
    //lib.bindSymbol(cast(void**)&SDL_gfxMultiplyAlpha, "SDL_gfxMultiplyAlpha");
    lib.bindSymbol(cast(void**)&SDL_imageFilterMMXdetect, "SDL_imageFilterMMXdetect");
    lib.bindSymbol(cast(void**)&SDL_imageFilterMMXoff, "SDL_imageFilterMMXoff");
    lib.bindSymbol(cast(void**)&SDL_imageFilterMMXon, "SDL_imageFilterMMXon");
    lib.bindSymbol(cast(void**)&SDL_imageFilterAdd, "SDL_imageFilterAdd");
    lib.bindSymbol(cast(void**)&SDL_imageFilterMean, "SDL_imageFilterMean");
    lib.bindSymbol(cast(void**)&SDL_imageFilterSub, "SDL_imageFilterSub");
    lib.bindSymbol(cast(void**)&SDL_imageFilterAbsDiff, "SDL_imageFilterAbsDiff");
    lib.bindSymbol(cast(void**)&SDL_imageFilterMult, "SDL_imageFilterMult");
    lib.bindSymbol(cast(void**)&SDL_imageFilterMultNor, "SDL_imageFilterMultNor");
    lib.bindSymbol(cast(void**)&SDL_imageFilterMultDivby2, "SDL_imageFilterMultDivby2");
    lib.bindSymbol(cast(void**)&SDL_imageFilterMultDivby4, "SDL_imageFilterMultDivby4");
    lib.bindSymbol(cast(void**)&SDL_imageFilterBitAnd, "SDL_imageFilterBitAnd");
    lib.bindSymbol(cast(void**)&SDL_imageFilterBitOr, "SDL_imageFilterBitOr");
    lib.bindSymbol(cast(void**)&SDL_imageFilterDiv, "SDL_imageFilterDiv");
    lib.bindSymbol(cast(void**)&SDL_imageFilterBitNegation, "SDL_imageFilterBitNegation");
    lib.bindSymbol(cast(void**)&SDL_imageFilterAddByte, "SDL_imageFilterAddByte");
    lib.bindSymbol(cast(void**)&SDL_imageFilterAddUint, "SDL_imageFilterAddUint");
    lib.bindSymbol(cast(void**)&SDL_imageFilterAddByteToHalf, "SDL_imageFilterAddByteToHalf");
    lib.bindSymbol(cast(void**)&SDL_imageFilterSubByte, "SDL_imageFilterSubByte");
    lib.bindSymbol(cast(void**)&SDL_imageFilterSubUint, "SDL_imageFilterSubUint");
    lib.bindSymbol(cast(void**)&SDL_imageFilterShiftRight, "SDL_imageFilterShiftRight");
    lib.bindSymbol(cast(void**)&SDL_imageFilterShiftRightUint, "SDL_imageFilterShiftRightUint");
    lib.bindSymbol(cast(void**)&SDL_imageFilterMultByByte, "SDL_imageFilterMultByByte");
    lib.bindSymbol(cast(void**)&SDL_imageFilterShiftRightAndMultByByte, "SDL_imageFilterShiftRightAndMultByByte");
    lib.bindSymbol(cast(void**)&SDL_imageFilterShiftLeftByte, "SDL_imageFilterShiftLeftByte");
    lib.bindSymbol(cast(void**)&SDL_imageFilterShiftLeftUint, "SDL_imageFilterShiftLeftUint");
    lib.bindSymbol(cast(void**)&SDL_imageFilterShiftLeft, "SDL_imageFilterShiftLeft");
    lib.bindSymbol(cast(void**)&SDL_imageFilterBinarizeUsingThreshold, "SDL_imageFilterBinarizeUsingThreshold");
    lib.bindSymbol(cast(void**)&SDL_imageFilterClipToRange, "SDL_imageFilterClipToRange");
    lib.bindSymbol(cast(void**)&SDL_imageFilterNormalizeLinear, "SDL_imageFilterNormalizeLinear");
    lib.bindSymbol(cast(void**)&SDL_imageFilterConvolveKernel3x3Divide, "SDL_imageFilterConvolveKernel3x3Divide");
    lib.bindSymbol(cast(void**)&SDL_imageFilterConvolveKernel5x5Divide, "SDL_imageFilterConvolveKernel5x5Divide");
    lib.bindSymbol(cast(void**)&SDL_imageFilterConvolveKernel7x7Divide, "SDL_imageFilterConvolveKernel7x7Divide");
    lib.bindSymbol(cast(void**)&SDL_imageFilterConvolveKernel9x9Divide, "SDL_imageFilterConvolveKernel9x9Divide");
    lib.bindSymbol(cast(void**)&SDL_imageFilterConvolveKernel3x3ShiftRight, "SDL_imageFilterConvolveKernel3x3ShiftRight");
    lib.bindSymbol(cast(void**)&SDL_imageFilterConvolveKernel5x5ShiftRight, "SDL_imageFilterConvolveKernel5x5ShiftRight");
    lib.bindSymbol(cast(void**)&SDL_imageFilterConvolveKernel7x7ShiftRight, "SDL_imageFilterConvolveKernel7x7ShiftRight");
    lib.bindSymbol(cast(void**)&SDL_imageFilterConvolveKernel9x9ShiftRight, "SDL_imageFilterConvolveKernel9x9ShiftRight");
    lib.bindSymbol(cast(void**)&SDL_imageFilterSobelX, "SDL_imageFilterSobelX");
    lib.bindSymbol(cast(void**)&SDL_imageFilterSobelXShiftRight, "SDL_imageFilterSobelXShiftRight");
    lib.bindSymbol(cast(void**)&SDL_imageFilterAlignStack, "SDL_imageFilterAlignStack");
    lib.bindSymbol(cast(void**)&SDL_imageFilterRestoreStack, "SDL_imageFilterRestoreStack");
    lib.bindSymbol(cast(void**)&rotozoomSurface, "rotozoomSurface");
    lib.bindSymbol(cast(void**)&rotozoomSurfaceXY, "rotozoomSurfaceXY");
    lib.bindSymbol(cast(void**)&rotozoomSurfaceSize, "rotozoomSurfaceSize");
    lib.bindSymbol(cast(void**)&rotozoomSurfaceSizeXY, "rotozoomSurfaceSizeXY");
    lib.bindSymbol(cast(void**)&zoomSurface, "zoomSurface");
    lib.bindSymbol(cast(void**)&zoomSurfaceSize, "zoomSurfaceSize");
    lib.bindSymbol(cast(void**)&shrinkSurface, "shrinkSurface");
    //lib.bindSymbol(cast(void**)&rotateSurface90Degree, "rotateSurface90Degree");
    
    if(errorCount() != errCount) loadedVersion = SDLgfxSupport.badLibrary;
    else loadedVersion = SDLgfxSupport.SDLgfx;

    return loadedVersion;
}
