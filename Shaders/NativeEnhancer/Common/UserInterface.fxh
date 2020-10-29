//     _   __      __  _            ______      __
//    / | / /___ _/ /_(_)   _____  / ____/___  / /_  ____ _____  ________  _____
//   /  |/ / __ `/ __/ / | / / _ \/ __/ / __ \/ __ \/ __ `/ __ \/ ___/ _ \/ ___/
//  / /|  / /_/ / /_/ /| |/ /  __/ /___/ / / / / / / /_/ / / / / /__/  __/ /
// /_/ |_/\__,_/\__/_/ |___/\___/_____/_/ /_/_/ /_/\__,_/_/ /_/\___/\___/_/
///////////////////////////////////////////////////////////////////////////
// Film Emulation LUT
// Version 2.8 Closed Public Release
// by d3fault
///////////////////////////////////////////////////////////////////////////
// User Interface Parameter
///////////////////////////////////////////////////////////////////////////


// LUT ////////////////////////////////////////////////////////////////////
CAT_RADIO(FILM_TYPE_SELECTOR, "LUT", "Film Type Selection", "Choose the Film Type to apply", 0, 5, 0, "  Black and White  \0  Instant  \0  Negative  \0  Slide  \0  Vintage  \0")
CAT_COMBO(BNW_LUT_SELECTOR,   "LUT", "Black and White Film", "Choose the Black and White Film to apply.", 0, 40, 0, "Agfa Scala 200\0Agfa Scala 200 - Alt\0Agfa Scala 200 - F\0Agfa Scala 200 - HC\0Fomapan 100\0Fomapan 100 - Alt\0Ilford Delta 100\0Ilford Delta 100 - Alt\0Ilford Delta 100 - F\0Ilford Delta 100 - HC\0Ilford Delta 400\0Ilford Delta 400 - Alt\0Ilford Delta 400 - F\0Ilford Delta 400 - HC\0Ilford Delta 800\0Ilford Delta 800 - F\0Ilford Delta 800 - HC\0Ilford Delta 3200\0Ilford Delta 3200 - Alt\0Ilford Delta 3200 - F\0Ilford Delta 3200 - HC\0Ilford FP4\0Ilford FP4 - F\0Ilford HP5\0Ilford HP5 - F\0Ilford Pan F Plus\0Ilford Pan F Plus - F\0Ilford Pan F Plus - HC\0Kodak T-Max 100\0Kodak T-Max 100 - F\0Kodak T-Max 100 - HC\0Kodak T-Max 3200\0Kodak T-Max 3200 - F\0Kodak T-Max 3200 - HC\0Kodak Tri X 100\0Kodak Tri X 100 - F\0Kodak Tri X 100 - HC\0Kodak Tri X 400\0Kodak Tri X 400 - F\0Kodak Tri X 400 - HC")
CAT_COMBO(INS_LUT_SELECTOR,   "LUT", "Instant Film", "Choose the Instant Film to apply.", 0, 12, 0, "Fuji FP 100C\0Fuji FP 100C - Alt\0Fuji FP 100C - AltII\0Fuji FP 100C - SK\0Fuji FP 100C - WM\0Fuji Instax Mini\0Fuji Instax Mini - Alt\0Fuji Instax Mini - HF\0Fuji Instax Mini - SF\0Fuji Instax Mini - SK\0Polaroid 600\0Polaroid 600 - C")
CAT_COMBO(NEG_LUT_SELECTOR,   "LUT", "Negative Film", "Choose the Negative Film to apply.", 0, 54, 0, "Agfa Optima 100\0Agfa Optima 100 - HC\0Agfa Optima 100 - OF\0Agfa Optima 100 - VI\0Agfa Optima 100 - WM\0Agfa Optima 400\0Agfa Vista 100\0Fuji Natura 1600\0Fuji Natura 1600 - HC\0Fuji Natura 1600 - M\0Fuji Pro 160C\0Fuji Pro 160NS\0Fuji Pro 160NS - Alt\0Fuji Pro 160NS - AltII\0Fuji Pro 160NS - V\0Fuji Pro 160NS - W\0Fuji Pro 400H\0Fuji Pro 800Z\0Fuji Pro 800Z - Alt\0Fuji Superia 200\0Fuji Superia 200 - Alt\0Fuji Superia 400\0Fuji Superia 800\0Fuji Superia 1600\0Kodak Color Plus 200\0Kodak Color Plus 200 - Alt\0Kodak Color Plus 400\0Kodak Color Plus 400 - Alt\0Kodak Ektar 100\0Kodak Ektar 100 - Alt\0Kodak Ektar 100 - FG\0Kodak Ektar 100 - FW\0Kodak Ektar 100 - V\0Kodak Gold 100\0Kodak Gold 100 - Alt\0Kodak Gold 100 - O&C\0Kodak Gold 200\0Kodak Gold 200 - Alt\0Kodak Gold 400\0Kodak Portra 160C\0Kodak Portra 160C - Alt\0Kodak Portra 160C - C\0Kodak Portra 160C - FW\0Kodak Portra 160VC\0Kodak Portra 160VC - Alt\0Kodak Portra 160FC - F\0Kodak Portra 400\0Kodak Portra 400 - FG\0Kodak Portra 800\0Kodak Portra 800 - Alt\0Rollei Digibase\0Rollei Digibase - Alt\0Rollei Digibase - AltII\0Rollei Digibase - Lomo\0")
CAT_COMBO(SLI_LUT_SELECTOR,   "LUT", "Slide Film", "Choose the Slide Film to apply.", 0, 23, 0, "Agfa Precisa\0Agfa Precisa - W\0Agfa RSX II 100\0Agfa RSX II 100 - C\0Fuji Astia 100F\0Fuji Fortia SP\0Fuji Fortia SP - W\0Fuji Provia 100F\0Fuji Provia 400X\0Fuji Sensia 100\0Fuji Sensia 100 - Alt\0Fuji Velvia 50\0Fuji Velvia 100\0Kodak E100G\0Kodak E100GX\0Kodak E100VS\0Kodak E200\0Kodak E200 - Alt\0Kodak E200 - C\0Kodak Elite\0Kodak Elite Chrome 100\0Kodak Elite Chrome 100 - Alt\0Kodak Elite Chrome 100 - Exp\0")
CAT_COMBO(VIN_LUT_SELECTOR,   "LUT", "Vintage Film", "Choose the Vintage Film to apply.", 0, 18, 0, "Agfa Color 40s\0Agfa Color 40s - F\0Agfa Color 50s\0Agfa Color 50s - M\0Agfa Color 60s\0Agfa Color XPS 160\0Agfa Color XPS 160 - M\0Kodachrome 40s\0Kodachrome 40s - Alt\0Kodachrome 50s\0Kodachrome 50s - Alt\0Kodachrome 50s - W\0Kodachrome 60s\0Kodachrome 60s - Alt\0Kodachrome 64\0Kodachrome 1958\0Kodachrome 1958 - Alt\0Kodachrome 2000\0")

// COLOR ADJUSTMENTS //////////////////////////////////////////////////////
#if (CONFIGURATION_TYPE == 1)   // High-Contrast Visual Based
  #define EXPOSURE     1.05
  #define GAMMA        1.0
  #define SATURATION   1.0
  #define CONTRAST     1.0
  #define BLACK_POINT  float3(12/255.0f, 12/255.0f, 12/255.0f)
  #define WHITE_POINT  float3(248/255.0f, 248/255.0f, 248/255.0f)
#elif (CONFIGURATION_TYPE == 2) // Low-Contrast Visual Based
  #define EXPOSURE     1.05
  #define GAMMA        1.110
  #define SATURATION   1.0
  #define CONTRAST     1.175
  #define BLACK_POINT  float3(14/255.0f, 14/255.0f, 14/255.0f)
  #define WHITE_POINT  float3(244/255.0f, 244/255.0f, 244/255.0f)
#elif (CONFIGURATION_TYPE == 3) // Full Parameter Control
  CAT_FLOAT_D(EXPOSURE,          "Color Adjustment", "Exposure",    "Adjust the exposure", -1.0f, 1.00f, 0.00f)
  CAT_FLOAT_D(GAMMA,             "Color Adjustment", "Gamma",       "Adjust the midtones", 0.33f, 3.00f, 1.00f)
  CAT_FLOAT_D(SATURATION,        "Color Adjustment", "Saturation",  "Adjust the saturation", 0.00f, 2.00f, 1.00f)
  CAT_FLOAT_D(CONTRAST,          "Color Adjustment", "Contrast",    "Adjust the contrast", 0.33f, 3.00f, 1.00f)
  CAT_COLOR(BLACK_POINT,         "Color Adjustment", "Black Point", "The black point is the new black - literally. Everything darker than this will become completely black.", 0/255.0f, 0/255.0f, 0/255.0f)
  CAT_COLOR(WHITE_POINT,         "Color Adjustment", "White Point", "The new white point. Everything brighter than this becomes completely white.", 255/255.0f, 255/255.0f, 255/255.0f)
#endif

// LIGHT LEAKS ////////////////////////////////////////////////////////////
CAT_BOOL(USE_LIGHT_LEAK,         "Light Leak", "Enable Light Leaks",           "A light leak is a hole or gap in the body of a camera,\nwhere light is able to 'leak' into the normally light-tight chamber,\nexposing the film or sensor with extra light. ", false)
CAT_COMBO(LIGHT_LEAK_TYPE,       "Light Leak", "Light Leak Texture Selection", "Choose the Light Leak texture to apply", 0, 3, 0, " Anoa \0 Bramuna \0 Cressan \0 Drytia \0")
CAT_COMBO(LIGHT_LEAK_VARIATION,  "Light Leak", "Light Leak Variation",         "Choose the variation for the Light Leak to apply.", 0, 1, 0, " Normal Axis \0 Flipped Axis \0")
CAT_COMBO(LIGHT_LEAK_BLEND_MODE, "Light Leak", "Light Leak Blend Mode",        "Choose the blend mode for the Light Leak to apply.", 0, 2, 0, " Screen \0 Lighten \0 Modded Lighten\0")
CAT_INT_D(LIGHT_LEAK_ROTATION,   "Light Leak", "Light Leak Rotation",          "Adjust the Rotation", 0, 360, 0)
CAT_INT_D(LIGHT_LEAK_HUE,        "Light Leak", "Light Leak Color",             "Adjust the Color", -100, 100, 0)
CAT_FLOAT_D(LIGHT_LEAK_SATURATE, "Light Leak", "Light Leak Saturation",        "Adjust the saturation", 0.0f, 2.0f, 1.0f)
CAT_FLOAT_D(LIGHT_LEAK_OPACITY,  "Light Leak", "Light Leak Opacity",           "Adjust the Opacity", 0.0f, 1.00f, 1.00f)
CAT_FLOAT_D(LIGHT_LEAK_INTENSITY,"Light Leak", "Light Leak Intensity",         "Adjust the Intensity", 0.0f, 1.00f, 1.00f)

// FRAME //////////////////////////////////////////////////////////////////
CAT_COMBO(USE_FRAME ,            "Film Frame", "Enable Film Frame",            "Simulate a film frame by overlaying a texture.", 0, 2, 0, " Disabled \0 Polaroid \0 Film \0")
CAT_COMBO(FRAME_TYPE,            "Film Frame", "Film Frame Texture Selection", "Choose the Film Frame Texture to apply", 0, 9, 0, " Fuji RVP 100 \0 Kodak Ektachrome \0 Kodak 160NC \0 Hasselblad \0 Kodak 400 VC \0 Fuji RVP \0 Kodak Portra 400 \0 Fuji RVP (potrait) \0 Kodak Portra 400BW \0 Fuji RVP (alt) \0")
CAT_COMBO(POLAROID_TYPE,         "Film Frame", "Polaroid Frame Texture Selection", "Choose the Polaroid Frame Texture to apply", 0, 5, 0, " Polaroid A \0 Polaroid B \0 Polaroid C \0 Polaroid D \0 Polaroid E \0 Polaroid F \0")

// DIRT ///////////////////////////////////////////////////////////////////
CAT_BOOL(USE_DIRT,               "Film Dirt", "Enable Film Dirt",            "Simulate dirty lens, or damaged film frame by overlaying a texture", false)
CAT_COMBO(DIRT_TYPE,             "Film Dirt", "Film Dirt Texture Selection", "Choose the Film Dirt Texture to apply", 0, 1, 0, " Amoeba \0 Benaru \0")
CAT_COMBO(DIRT_VARIATION,        "Film Dirt", "Film Dirt Variation",         "Choose the variation for the Film Dirt to apply.", 0, 1, 0, " Normal Axis \0 Flipped Axis \0")
CAT_INT_D(DIRT_ROTATION,         "Film Dirt", "Film Dirt Rotation",          "Adjust the Rotation", 0, 360, 0)
CAT_FLOAT_D(DIRT_INTENSITY,      "Film Dirt", "Film Dirt Intensity",         "Adjust the Intensity", 0.0f, 1.00f, 1.00f)
