/*
	NATIVENHANCER Film Emulation for ReShade
	Version One
	by dddfault
	Copyright (c) 2020 dddfault

	User interface parameters

	MIT License

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
*/

D_INT_RK(FILM_TYPE_SELECTOR,
  "Color Lookup Table",
  "Film Type",
  "Choose the analog film brand to apply",
  "Agfa Film\0"
  "Fuji Film\0"
  "Kodak Film\0"
  "Polaroid Film\0"
  "Ilford Film\0"
  , 0, 5, 0)

// LUT ////////////////////////////////////////////////////////////////////
D_INT_CK(AGFA_LUT_SELECTOR,
  "Color Lookup Table",
  "Agfa Film",
  "Choose the Agfa Film to apply.",
  "Optima 100 OF\0"
  "Optima 100 WM\0"
  "Optima 100\0"
  "Optima 100II Alt\0"
  "Optima 100II Cool\0"
  "Optima 100II Warm\0"
  "Optima 100II\0"
  "Portrait XPS 160 Alt\0"
  "Portrait XPS 160 Cool\0"
  "Portrait XPS 160 Warm\0"
  "Portrait XPS 160\0"
  "RSX200 II Alt\0"
  "RSX200 II Cool\0"
  "RSX200 II Warm\0"
  "RSX200 II\0"
  "RSX50 II Alt\0"
  "RSX50 II Cool\0"
  "RSX50 II Warm\0"
  "RSX50 II\0"
  "Scala 200 Alt\0"
  "Scala 200\0"
  "Ultra 100 Alt\0"
  "Ultra 100 Cool\0"
  "Ultra 100 Warm\0"
  "Ultra 100\0"
  "Ultra 50 Alt II\0"
  "Ultra 50 Alt\0"
  "Ultra 50 Cool\0"
  "Ultra 50 Warm\0"
  "Ultra 50\0"
  "Vista 400 Night-Tungsten Alt\0"
  "Vista 400 Night-Tungsten\0"
  "Vista 800 Night-Tungsten Alt\0"
  "Vista 800 Night-Tungsten\0"
  "Agfacolor 40s F\0"
  "Agfacolor 40s HC\0"
  "Agfacolor 40s\0"
  "Agfacolor 50s Muted\0"
  "Agfacolor 50s\0"
  "Agfacolor 60s Alt\0"
  "Agfacolor 60s\0"
  , 0, 41, 0)

D_INT_CK(FUJI_LUT_SELECTOR,
  "Color Lookup Table",
  "Fuji Film",
  "Choose the Fuji Film to apply.",
  "Astia 100F - Alt\0"
  "Astia 100F - Balance Cool\0"
  "Astia 100F - Balance Warm\0"
  "Astia 100F - Portrait\0"
  "Astia 100F\0"
  "Fortia SP - Alt\0"
  "Fortia SP - Balance Cool\0"
  "Fortia SP - Balance Landscape\0"
  "Fortia SP - Balance Warm\0"
  "Fortia SP - Portrait\0"
  "Fortia SP\0"
  "FP 100C - Alt\0"
  "FP 100C - Green\0"
  "FP 100C - SK\0"
  "FP 100C - Warm\0"
  "FP 100C\0"
  "Instax Mini - Hard Fade\0"
  "Instax Mini - Soft Fade\0"
  "Instax Mini\0"
  "Neopan 400 - NT\0"
  "Neopan 1600 - Alt\0"
  "Neopan 1600\0"
  "Pro 160C - Alt\0"
  "Pro 160C\0"
  "Pro 160NS - Warm\0"
  "Pro 160NS\0"
  "Pro 160S - Alt II\0"
  "Pro 160S - Alt\0"
  "Pro 160S - Cool\0"
  "Pro 160S - Warm\0"
  "Pro 160S\0"
  "Pro 400H - Alt\0"
  "Pro 400H\0"
  "Pro 800Z - Alt\0"
  "Pro 800Z\0"
  "Provia 100F - Alt\0"
  "Provia 100F - Balance Cool\0"
  "Provia 100F - Balance Warm\0"
  "Provia 100F - Portrait\0"
  "Provia 100F\0"
  "Provia 400X - Alt II\0"
  "Provia 400X - Alt\0"
  "Provia 400X - Balance Cool\0"
  "Provia 400X - Balance Warm\0"
  "Provia 400X - Portrait\0"
  "Provia 400X\0"
  "Sensia 100 - Alt II\0"
  "Sensia 100 - Alt\0"
  "Sensia 100 - Cool\0"
  "Sensia 100 - Warm\0"
  "Sensia 100\0"
  "Superia 100 - Alt\0"
  "Superia 100\0"
  "Superia 200\0"
  "Superia 400 - Alt\0"
  "Superia 400\0"
  "Superia 800 - Alt\0"
  "Superia 800\0"
  "Superia 1600 - Alt\0"
  "Superia 1600\0"
  "t64 - Alt II\0"
  "t64 - Alt\0"
  "t64\0"
  "Velvia 50 - Alt II\0"
  "Velvia 50 - Alt\0"
  "Velvia 50\0"
  "Velvia 100 - Alt\0"
  "Velvia 100\0"
  "Velvia 100F - Alt\0"
  "Velvia 100F - Balance Cool\0"
  "Velvia 100F - Balance Warm\0"
  "Velvia 100F\0"
  , 0, 72, 0)

D_INT_CK(KODAK_LUT_SELECTOR,
  "Color Lookup Table",
  "Kodak Film",
  "Choose the Kodak Film to apply.",
  "BW400CN Night-Tungsten Alt\0"
  "BW400CN Night-Tungsten\0"
  "Color Plus 200 Alt\0"
  "Color Plus 200\0"
  "Color Plus 400 Alt\0"
  "Color Plus 400\0"
  "E100g Alt\0"
  "E100g Balance Cool\0"
  "E100g Balance Warm\0"
  "E100g Portrait\0"
  "E100g\0"
  "E100VS Alt\0"
  "E100VS Balance Cool\0"
  "E100VS Balance Landscape\0"
  "E100VS Balance Warm+\0"
  "E100VS Portrait\0"
  "E100VS\0"
  "E200 Alt II\0"
  "E200 Alt\0"
  "E200 Balance Cool\0"
  "E200 Balance warm\0"
  "E200 Portrait\0"
  "E200\0"
  "Ektachrome 64 Alt II\0"
  "Ektachrome 64 Alt\0"
  "Ektachrome 64 Cool\0"
  "Ektachrome 64 Warm\0"
  "Ektachrome 64\0"
  "Ektachrome 64t Alt\0"
  "Ektachrome 64t\0"
  "Ektar 100 Alt\0"
  "Ektar 100 Warm\0"
  "Ektar 100\0"
  "Ektar 25 Alt II\0"
  "Ektar 25 Alt\0"
  "Ektar 25 Cool\0"
  "Ektar 25 Warm\0"
  "Ektar 25\0"
  "Elite 50II Alt\0"
  "Elite 50II Cool\0"
  "Elite 50II Warm\0"
  "Elite 50II\0"
  "Elite Chrome 160t Alt II\0"
  "Elite Chrome 160t Alt\0"
  "Elite Chrome 160t Cool\0"
  "Elite Chrome 160t Warm\0"
  "Elite Chrome 160t\0"
  "Gold 100 Alt\0"
  "Gold 100 Warm\0"
  "Gold 100\0"
  "Max 800 Night-Tungsten Alt\0"
  "Max 800 Night-Tungsten\0"
  "Plus-X 125 Alt\0"
  "Plus-X 125\0"
  "Portra 100 Cool\0"
  "Portra 100 Warm\0"
  "Portra 100t Alt\0"
  "Portra 100t\0"
  "Portra 160 Alt\0"
  "Portra 160 NC Alt\0"
  "Portra 160 NC\0"
  "Portra 160 VC Alt\0"
  "Portra 160 VC+\0"
  "Portra 160 VC\0"
  "Portra 160\0"
  "Portra 400 ++\0"
  "Portra 400 NC+\0"
  "Portra 400 NC\0"
  "Portra 400 UC+\0"
  "Portra 400 UC\0"
  "Portra 400 VC++\0"
  "Portra 400 VC+\0"
  "Portra 400 VC\0"
  "Portra 400\0"
  "Portra 800 ++\0"
  "Portra 800 +\0"
  "Portra 800\0"
  "Royal Gold 400 Night-Tungsten Alt\0"
  "Royal Gold 400 Night-Tungsten+\0"
  "Royal Gold 400 Night-Tungsten\0"
  "T-Max 100\0"
  "T-Max 3200 +\0"
  "T-Max 3200\0"
  "Tri X320++\0"
  "Tri X320-\0"
  "Tri X320\0"
  "Tri-X 100\0"
  "TRI-X 400 ++\0"
  "TRI-X 400\0"
  "UltraMax 400 Night-Tungsten\0"
  "UltraMax 400 Night-TungstenAlt\0"
  "UltraMax 800 Night-Tungsten Alt\0"
  "UltraMax 800 Night-Tungsten\0"
  , 0, 93, 0)

D_INT_CK(POLAROID_LUT_SELECTOR,
  "Color Lookup Table",
  "Polaroid Film",
  "Choose the Polaroid Film to apply.",
  "600\0"
  "600 Cool\0"
  "600 Exp\0"
  "600\0"
  "PX-100UV+ Cold+++\0"
  "PX-100UV+ Cold++\0"
  "PX-100UV+ Cold+\0"
  "PX-100UV+ Cold-\0"
  "PX-100UV+ Cold\0"
  "PX-100UV+ Warm+++\0"
  "PX-100UV+ Warm++\0"
  "PX-100UV+ Warm+\0"
  "PX-100UV+ Warm-\0"
  "PX-100UV+ Warm\0"
  "PX-680 Cold++\0"
  "PX-680 Cold+\0"
  "PX-680 Cold-\0"
  "PX-680 Cold\0"
  "PX-680 Warm++\0"
  "PX-680 Warm+\0"
  "PX-680 Warm-\0"
  "PX-680 Warm\0"
  "PX-680++\0"
  "PX-680+\0"
  "PX-680-\0"
  "PX-680\0"
  "PX-70 Cold+\0"
  "PX-70 Cold-\0"
  "PX-70 Cold\0"
  "PX-70 Warm+\0"
  "PX-70 Warm-\0"
  "PX-70 Warm\0"
  "PX-70+++\0"
  "PX-70++\0"
  "PX-70+\0"
  "PX-70-\0"
  "PX-70\0"
  "Time-Zero (Expired) Cold --\0"
  "Time-Zero (Expired) Cold -\0"
  "Time-Zero (Expired) Cold\0"
  "Time-Zero (Expired)+\0"
  "Time-Zero (Expired)--\0"
  "Time-Zero (Expired)-\0"
  "Time-Zero (Expired)\0"
  , 0, 44, 0)

D_INT_CK(ILFORD_LUT_SELECTOR,
  "Color Lookup Table",
  "Ilford Film",
  "Choose the Ilford Film to apply.",
  "Delta 100 Alt\0"
  "Delta 100\0"
  "Delta 3200 Alt\0"
  "Delta 3200\0"
  "Delta 400 Alt\0"
  "Delta 400\0"
  "Delta 800 Alt\0"
  "Delta 800\0"
  "Delta FP4\0"
  "HP5 Alt\0"
  "HP5\0"
  "Pan F Plas 50 Alt\0"
  "Pan F Plas 50\0"
  , 0, 13, 0)

D_FLOAT_DK(LUT_LUMA_MIX,   "Color Lookup Table", "LUT Luma Mix", "LUT Luminance mixture intensity.\n This affect the contrast and brightness of the image.", 0.001, 0.00f, 100f, 1.00f)
D_FLOAT_DK(LUT_CHROMA_MIX, "Color Lookup Table", "LUT Chroma Mix", "LUT Chromatic mixture intensity.\n This affect the saturation and hue of the image.", 0.001, 0.00f, 1.00f, 1.00f)
D_FLOAT_DK(LUT_INTENSITY,  "Color Lookup Table", "LUT Intensity", "LUT Intensity.\n How strong the LUT will be applied to the image.", 0.001, 0.00f, 2.00f, 1.00f)

// Color Adjustment ///////////////////////////////////////////////////////
D_FLOAT_DK(EXPOSURE,      "Basic Color Adjustment", "Exposure", "Adjust the Exposure", 0.001, -2.0f, 2.00f, 0.00f)
D_FLOAT_DK(BRIGHTNESS,    "Basic Color Adjustment", "Brightness", "Adjust the Brightness", 0.001, -0.0f, 2.00f, 1.00f)
D_FLOAT_DK(GAMMA,         "Basic Color Adjustment", "Gamma", "Adjust the midtones", 0.001, 0.33f, 3.00f, 1.00f)
D_FLOAT_DK(SATURATION,    "Basic Color Adjustment", "Saturation", "Adjust the saturation", 0.001, 0.00f, 2.00f, 1.00f)
D_FLOAT_DK(CONTRAST,      "Basic Color Adjustment", "Contrast", "Adjust the contrast", 0.001, 0.33f, 3.00f, 1.00f)
D_FLOAT_DK(CLIPPING,      "Basic Color Adjustment", "Clipping", "Adjust the clipping", 0.1, 0, 128, 0)

D_BOOL_K(USE_LENS_SOFT,            "Film Effect", "Enable Film Lens softness", "Simulate cheap soft lens blur", false)
D_FLOAT_DK(FILM_SMOOTH,            "Film Effect", "Film Blur", "Adjust the Screen Film Blur", 0.001, 0.0, 0.5, 0.183)

D_BOOL_K(USE_VIGNETTE,             "Film Effect", "Enable Vignette", "Vignette darkens/tints the image at the corners", false)
D_FLOAT_DK(VIGNETTE_INTENSITY,     "Film Effect", "Vignette Intensity", "Vignette intensity applied to final image.", 0.001, 0.0, 5.0, 1.0)
D_FLOAT_DK(VIGNETTE_RADIUS,        "Film Effect", "Vignette Radius", "Radius from center where vignette change.", 0.001, 0.0, 5.0, 0.85)
D_FLOAT_DK(VIGNETTE_CURVE,         "Film Effect", "Vignette Curve",  "Vignette blending amount with the image.", 0.001, 0.0, 5.0, 1.0)
D_COLOR_K(VIGNETTE_COLOR,          "Film Effect", "Vignette Color", "Color of the vignette.", 0.0, 0.0, 0.0)

D_BOOL_K(USE_FISHEYE,              "Film Effect", "Enable Fisheye", "Simulate fisheye lens distortion", false)
D_FLOAT_DK(FISHEYE_ZOOM,           "Film Effect", "Fisheye Zoom", "Lens zoom to hide bugged edges due to texcoord modification", 0.001, 0.0, 1.0, 0.55)
D_FLOAT_DK(FISHEYE_DISTORT,        "Film Effect", "Fisheye Distortion", "Distortion of image", 0.001, -0.5, -.5, 0.01)
D_FLOAT_DK(FISHEYE_CUBICDISTORT,   "Film Effect", "Fisheye Cubic Distortion", "Distortion of image, cube based", 0.001, -0.5, -.5, 0.07)
D_INT_CK(ORIENTATION,
  "Film Effect",
  "Fisheye Axis",
  "switch fisheye axis orientation.",
  "Vertical & Horizontal\0"
  "Vertical\0"
  "Horizontal\0", 0, 2, 0)

/////////////
D_INT_CK(USE_FRAME ,            "Film Frame Overlay", "Enable Film Frame", "Simulate a film frame by overlaying a texture.", " Disabled \0 Polaroid \0 Film \0", 0, 2, 0)
D_INT_CK(FRAME_TYPE,            "Film Frame Overlay", "Film Frame Texture Selection", "Choose the Film Frame Texture to apply", " Fuji RVP 100 \0 Kodak Ektachrome \0 Kodak 160NC \0 Hasselblad \0 Kodak 400 VC \0 Fuji RVP \0 Kodak Portra 400 \0 Fuji RVP (potrait) \0 Kodak Portra 400BW \0 Fuji RVP (alt) \0 Ilford FP4 Plus \0 Kodak TMX \0 Kodak TX \0", 0, 12, 0)
D_INT_CK(POLAROID_TYPE,         "Film Frame Overlay", "Polaroid Frame Texture Selection", "Choose the Polaroid Frame Texture to apply", " Polaroid A \0 Polaroid B \0 Polaroid C \0 Polaroid D \0 Polaroid E \0 Polaroid F \0",0, 5, 0)

///////////
D_BOOL_K(USE_DIRT,              "Film Dirt Texture", "Enable Film Dirt", "Simulate dirty lens, or damaged film frame by overlaying a texture", false)
D_INT_CK(DIRT_TYPE,             "Film Dirt Texture", "Film Dirt Texture Selection", "Choose the Film Dirt Texture to apply", " Amoeba \0 Benaru \0 Crosian \0 Dravun \0 Eklair \0 Flori \0 Gafama \0 Hromb \0 Ivrok \0",0, 9, 0)
D_INT_CK(DIRT_VARIATION,        "Film Dirt Texture", "Film Dirt Variation", "Choose the variation for the Film Dirt to apply."," Normal Axis \0 Flipped Axis \0", 0, 1, 0)
D_FLOAT_DK(DIRT_ROTATION,       "Film Dirt Texture", "Film Dirt Rotation", "Adjust the Rotation", 1.0, 0, 8, 0)
D_FLOAT_DK(DIRT_OPACITY,        "Film Dirt Texture", "Film Dirt Intensity", "Adjust the Intensity", 0.01, 0.0f, 1.00f, 1.00f)
D_FLOAT_DK(DIRT_CURVE,          "Film Dirt Texture", "Film Dirt Curve", "Adjust the Intensity", 0.01, 0.0f, 2.00f, 1.00f)
D_INT_CK(DIRT_BLENDMODE,
  "Film Dirt Texture",
  "Blending Mode",
  "Choose the blending mode to apply",
  "Default\0"
  "Darken\0"
  "Multiply\0"
  "Color Burn\0"
  "Linear Dodge\0"
  "Linear Burn\0"
  "Lighten\0"
  "Screen\0"
  "Color Dodge\0"
  "Add\0"
  "Overlay\0"
  "Softlight\0"
  "Vividlight\0"
  "Linearlight\0"
  "Pinlight\0"
  "Hardmix\0"
  "Difference\0"
  "Exclusion\0"
  "Subtract\0"
  "Reflect\0"
  "Hue\0"
  "Saturation\0"
  "Color\0"
  "Luminosity\0"
  , 0, 24, 0)

// LIGHT LEAKS ////////////////////////////////////////////////////////////
// currently disabled due to uncompatible texture
/*
D_BOOL_K(USE_LIGHT_LEAK,         "-Light Leak Overlay-", "Enable Light Leaks",           "A light leak is a hole or gap in the body of a camera,\nwhere light is able to 'leak' into the normally light-tight chamber,\nexposing the film or sensor with extra light. ", false)
D_INT_CK(LIGHT_LEAK_TYPE,        "-Light Leak Overlay-", "Light Leak Texture Selection", "Choose the Light Leak texture to apply", " Anoa \0 Bramuna \0 Cressan \0 Drytia \0", 0, 3, 0)
D_INT_CK(LIGHT_LEAK_VARIATION,   "-Light Leak Overlay-", "Light Leak Variation",         "Choose the variation for the Light Leak to apply.", " Normal Axis \0 Flipped Axis \0", 0, 1, 0)
D_INT_CK(LIGHT_LEAK_BLEND_MODE,  "-Light Leak Overlay-", "Light Leak Blend Mode",        "Choose the blend mode for the Light Leak to apply.", " Screen \0 Lighten \0 Modded Lighten\0", 0, 2, 0)
D_INT_DK(LIGHT_LEAK_ROTATION,    "-Light Leak Overlay-", "Light Leak Rotation",          "Adjust the Rotation", 0, 8, 0)
D_INT_DK(LIGHT_LEAK_HUE,         "-Light Leak Overlay-", "Light Leak Color",             "Adjust the Color", -100, 100, 0)
D_FLOAT_DK(LIGHT_LEAK_SATURATE,  "-Light Leak Overlay-", "Light Leak Saturation",        "Adjust the saturation", 0.01, 0.0f, 2.0f, 1.0f)
D_FLOAT_DK(LIGHT_LEAK_OPACITY,   "-Light Leak Overlay-", "Light Leak Opacity",           "Adjust the Opacity", 0.01, 0.0f, 1.00f, 1.00f)
D_FLOAT_DK(LIGHT_LEAK_INTENSITY, "-Light Leak Overlay-", "Light Leak Intensity",         "Adjust the Intensity", 0.01, 0.0f, 1.00f, 1.00f)
D_INT_CK(LIGHT_LEAK_BLENDMODE,
  "-Light Leak Overlay-",
  "Blending Mode",
  "Choose the blending mode to apply",
  "Default\0"
  "Darken\0"
  "Multiply\0"
  "Color Burn\0"
  "Linear Dodge\0"
  "Linear Burn\0"
  "Lighten\0"
  "Screen\0"
  "Color Dodge\0"
  "Add\0"
  "Overlay\0"
  "Softlight\0"
  "Vividlight\0"
  "Linearlight\0"
  "Pinlight\0"
  "Hardmix\0"
  "Difference\0"
  "Exclusion\0"
  "Subtract\0"
  "Reflect\0"
  "Hue\0"
  "Saturation\0"
  "Color\0"
  "Luminosity\0"
  , 0, 24, 0)

/*
D_INT_CK(BLENDING_MODE,
  "-Film Dirt Texture-",
  "Blending Mode",
  "Choose the blending mode to apply",
  "Default\0"
  "Darken\0"
  "Multiply\0"
  "Color Burn\0"
  "Linear Dodge\0"
  "Linear Burn\0"
  "Lighten\0"
  "Screen\0"
  "Color Dodge\0"
  "Add\0"
  "Overlay\0"
  "Softlight\0"
  "Vividlight\0"
  "Linearlight\0"
  "Pinlight\0"
  "Hardmix\0"
  "Difference\0"
  "Exclusion\0"
  "Subtract\0"
  "Reflect\0"
  "Hue\0"
  "Saturation\0"
  "Color\0"
  "Luminosity\0"
  , 0, 24, 0)
  */
  /* AGFA
  "Agfa Optima 100 OF\0"
  "Agfa Optima 100 WM\0"
  "Agfa Optima 100\0"
  "Agfa Optima 100II Alt\0"
  "Agfa Optima 100II Cool\0"
  "Agfa Optima 100II Warm\0"
  "Agfa Optima 100II\0"
  "Agfa Portrait XPS 160 Alt\0"
  "Agfa Portrait XPS 160 Cool\0"
  "Agfa Portrait XPS 160 Warm\0"
  "Agfa Portrait XPS 160\0"
  "Agfa RSX200 II Alt\0"
  "Agfa RSX200 II Cool\0"
  "Agfa RSX200 II Warm\0"
  "Agfa RSX200 II\0"
  "Agfa RSX50 II Alt\0"
  "Agfa RSX50 II Cool\0"
  "Agfa RSX50 II Warm\0"
  "Agfa RSX50 II\0"
  "Agfa Scala 200 Alt\0"
  "Agfa Scala 200\0"
  "Agfa Ultra 100 Alt\0"
  "Agfa Ultra 100 Cool\0"
  "Agfa Ultra 100 Warm\0"
  "Agfa Ultra 100\0"
  "Agfa Ultra 50 Alt II\0"
  "Agfa Ultra 50 Alt\0"
  "Agfa Ultra 50 Cool\0"
  "Agfa Ultra 50 Warm\0"
  "Agfa Ultra 50\0"
  "Agfa Vista 400 Night-Tungsten Alt\0"
  "Agfa Vista 400 Night-Tungsten\0"
  "Agfa Vista 800 Night-Tungsten Alt\0"
  "Agfa Vista 800 Night-Tungsten\0"
  "Agfacolor 40s F\0"
  "Agfacolor 40s HC\0"
  "Agfacolor 40s\0"
  "Agfacolor 50s Muted\0"
  "Agfacolor 50s\0"
  "Agfacolor 60s Alt\0"
  "Agfacolor 60s\0"


  // ILFORD
  "Ilford Delta 100 Alt\0"
  "Ilford Delta 100\0"
  "Ilford Delta 3200 Alt\0"
  "Ilford Delta 3200\0"
  "Ilford Delta 400 Alt\0"
  "Ilford Delta 400\0"
  "Ilford Delta 800 Alt\0"
  "Ilford Delta 800\0"
  "Ilford Delta FP4\0"
  "Ilford HP5 Alt\0"
  "Ilford HP5\0"
  "Ilford Pan F Plas 50 Alt\0"
  "Ilford Pan F Plas 50\0"


  // Kodak
  "Kodak BW400CN Night-Tungsten Alt\0"
  "Kodak BW400CN Night-Tungsten\0"
  "Kodak Color Plus 200 Alt\0"
  "Kodak Color Plus 200\0"
  "Kodak Color Plus 400 Alt\0"
  "Kodak Color Plus 400\0"
  "Kodak E100g Alt\0"
  "Kodak E100g Balance Cool\0"
  "Kodak E100g Balance Warm\0"
  "Kodak E100g Portrait\0"
  "Kodak E100g\0"
  "Kodak E100VS Alt\0"
  "Kodak E100VS Balance Cool\0"
  "Kodak E100VS Balance Landscape\0"
  "Kodak E100VS Balance Warm+\0"
  "Kodak E100VS Portrait\0"
  "Kodak E100VS\0"
  "Kodak E200 Alt II\0"
  "Kodak E200 Alt\0"
  "Kodak E200 Balance Cool\0"
  "Kodak E200 Balance warm\0"
  "Kodak E200 Portrait\0"
  "Kodak E200\0"
  "Kodak Ektachrome 64 Alt II\0"
  "Kodak Ektachrome 64 Alt\0"
  "Kodak Ektachrome 64 Cool\0"
  "Kodak Ektachrome 64 Warm\0"
  "Kodak Ektachrome 64\0"
  "Kodak Ektachrome 64t Alt\0"
  "Kodak Ektachrome 64t\0"
  "Kodak Ektar 100 Alt\0"
  "Kodak Ektar 100 Warm\0"
  "Kodak Ektar 100\0"
  "Kodak Ektar 25 Alt II\0"
  "Kodak Ektar 25 Alt\0"
  "Kodak Ektar 25 Cool\0"
  "Kodak Ektar 25 Warm\0"
  "Kodak Ektar 25\0"
  "Kodak Elite 50II Alt\0"
  "Kodak Elite 50II Cool\0"
  "Kodak Elite 50II Warm\0"
  "Kodak Elite 50II\0"
  "Kodak Elite Chrome 160t Alt II\0"
  "Kodak Elite Chrome 160t Alt\0"
  "Kodak Elite Chrome 160t Cool\0"
  "Kodak Elite Chrome 160t Warm\0"
  "Kodak Elite Chrome 160t\0"
  "Kodak Gold 100 Alt\0"
  "Kodak Gold 100 Warm\0"
  "Kodak Gold 100\0"
  "Kodak Max 800 Night-Tungsten Alt\0"
  "Kodak Max 800 Night-Tungsten\0"
  "Kodak Plus-X 125 Alt\0"
  "Kodak Plus-X 125\0"
  "Kodak Portra 100 Cool\0"
  "Kodak Portra 100 Warm\0"
  "Kodak Portra 100t Alt\0"
  "Kodak Portra 100t\0"
  "Kodak Portra 160 Alt\0"
  "Kodak Portra 160 NC Alt\0"
  "Kodak Portra 160 NC\0"
  "Kodak Portra 160 VC Alt\0"
  "Kodak Portra 160 VC+\0"
  "Kodak Portra 160 VC\0"
  "Kodak Portra 160\0"
  "Kodak Portra 400 ++\0"
  "Kodak Portra 400 NC+\0"
  "Kodak Portra 400 NC\0"
  "Kodak Portra 400 UC+\0"
  "Kodak Portra 400 UC\0"
  "Kodak Portra 400 VC++\0"
  "Kodak Portra 400 VC+\0"
  "Kodak Portra 400 VC\0"
  "Kodak Portra 400\0"
  "Kodak Portra 800 ++\0"
  "Kodak Portra 800 +\0"
  "Kodak Portra 800\0"
  "Kodak Royal Gold 400 Night-Tungsten Alt\0"
  "Kodak Royal Gold 400 Night-Tungsten+\0"
  "Kodak Royal Gold 400 Night-Tungsten\0"
  "Kodak T-Max 100\0"
  "Kodak T-Max 3200 +\0"
  "Kodak T-Max 3200\0"
  "Kodak Tri X320++\0"
  "Kodak Tri X320-\0"
  "Kodak Tri X320\0"
  "Kodak Tri-X 100\0"
  "Kodak TRI-X 400 ++\0"
  "Kodak TRI-X 400\0"
  "Kodak UltraMax 400 Night-Tungsten\0"
  "Kodak UltraMax 400 Night-TungstenAlt\0"
  "Kodak UltraMax 800 Night-Tungsten Alt\0"
  "Kodak UltraMax 800 Night-Tungsten\0"


  // POLAROID
  "Polaroid 600 Alt\0"
  "Polaroid 600 Cool\0"
  "Polaroid 600 Exp\0"
  "Polaroid 600\0"
  "Polaroid PX-100UV+ Cold+++\0"
  "Polaroid PX-100UV+ Cold++\0"
  "Polaroid PX-100UV+ Cold+\0"
  "Polaroid PX-100UV+ Cold-\0"
  "Polaroid PX-100UV+ Cold\0"
  "Polaroid PX-100UV+ Warm+++\0"
  "Polaroid PX-100UV+ Warm++\0"
  "Polaroid PX-100UV+ Warm+\0"
  "Polaroid PX-100UV+ Warm-\0"
  "Polaroid PX-100UV+ Warm\0"
  "Polaroid PX-680 Cold++\0"
  "Polaroid PX-680 Cold+\0"
  "Polaroid PX-680 Cold-\0"
  "Polaroid PX-680 Cold\0"
  "Polaroid PX-680 Warm++\0"
  "Polaroid PX-680 Warm+\0"
  "Polaroid PX-680 Warm-\0"
  "Polaroid PX-680 Warm\0"
  "Polaroid PX-680++\0"
  "Polaroid PX-680+\0"
  "Polaroid PX-680-\0"
  "Polaroid PX-680\0"
  "Polaroid PX-70 Cold+\0"
  "Polaroid PX-70 Cold-\0"
  "Polaroid PX-70 Cold\0"
  "Polaroid PX-70 Warm+\0"
  "Polaroid PX-70 Warm-\0"
  "Polaroid PX-70 Warm\0"
  "Polaroid PX-70+++\0"
  "Polaroid PX-70++\0"
  "Polaroid PX-70+\0"
  "Polaroid PX-70-\0"
  "Polaroid PX-70\0"
  "Time-Zero Polaroid (Expired) Cold --\0"
  "Time-Zero Polaroid (Expired) Cold -\0"
  "Time-Zero Polaroid (Expired) Cold\0"
  "Time-Zero Polaroid (Expired)+\0"
  "Time-Zero Polaroid (Expired)--\0"
  "Time-Zero Polaroid (Expired)-\0"
  "Time-Zero Polaroid (Expired)\0"

  //extra
  "Fomapan\0"
  "Kodachrome 1958\0"
  "Kodachrome 40s Alt II\0"
  "Kodachrome 40s Alt\0"
  "Kodachrome 40s\0"
  "Kodachrome 50s Alt\0"
  "Kodachrome 50s\0"

  */
