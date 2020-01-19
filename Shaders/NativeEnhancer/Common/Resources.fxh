//     _   __      __  _            ______      __
//    / | / /___ _/ /_(_)   _____  / ____/___  / /_  ____ _____  ________  _____
//   /  |/ / __ `/ __/ / | / / _ \/ __/ / __ \/ __ \/ __ `/ __ \/ ___/ _ \/ ___/
//  / /|  / /_/ / /_/ /| |/ /  __/ /___/ / / / / / / /_/ / / / / /__/  __/ /
// /_/ |_/\__,_/\__/_/ |___/\___/_____/_/ /_/_/ /_/\__,_/_/ /_/\___/\___/_/
///////////////////////////////////////////////////////////////////////////
// Film Emulation LUT
// Version 2.5 Closed Public Release
///////////////////////////////////////////////////////////////////////////
// Textures and other resources
///////////////////////////////////////////////////////////////////////////

// LUTs ///////////////////////////////////////////////////////////////////
TEXTURE_FULL(NE_BNW_FILM_T, "NativeEnhancer/LUT/NE_LUT_BNW.png", 4096, 64 * BNW_LUT_AMOUNT, RGBA8)
TEXTURE_FULL(NE_INS_FILM_T, "NativeEnhancer/LUT/NE_LUT_INS.png", 4096, 64 * INS_LUT_AMOUNT, RGBA8)
TEXTURE_FULL(NE_NEG_FILM_T, "NativeEnhancer/LUT/NE_LUT_NEG.png", 4096, 64 * NEG_LUT_AMOUNT, RGBA8)
TEXTURE_FULL(NE_SLI_FILM_T, "NativeEnhancer/LUT/NE_LUT_SLI.png", 4096, 64 * SLI_LUT_AMOUNT, RGBA8)
TEXTURE_FULL(NE_VIN_FILM_T, "NativeEnhancer/LUT/NE_LUT_VIN.png", 4096, 64 * VIN_LUT_AMOUNT, RGBA8)
SAMPLER(NE_BNW_FILM, NE_BNW_FILM_T)
SAMPLER(NE_INS_FILM, NE_INS_FILM_T)
SAMPLER(NE_NEG_FILM, NE_NEG_FILM_T)
SAMPLER(NE_SLI_FILM, NE_SLI_FILM_T)
SAMPLER(NE_VIN_FILM, NE_VIN_FILM_T)

// LIGHT LEAKS ////////////////////////////////////////////////////////////
TEXTURE(NE_LEAKS_1, "NativeEnhancer/Leaks/leak1.jpg")
TEXTURE(NE_LEAKS_2, "NativeEnhancer/Leaks/leak2.jpg")
TEXTURE(NE_LEAKS_3, "NativeEnhancer/Leaks/leak3.jpg")
TEXTURE(NE_LEAKS_4, "NativeEnhancer/Leaks/leak4.jpg")
TEXTURE(NE_LEAKS_5, "NativeEnhancer/Leaks/leak5.jpg")
SAMPLER_UV(NE_LEAKS_A, NE_LEAKS_1, MIRROR)
SAMPLER_UV(NE_LEAKS_B, NE_LEAKS_2, MIRROR)
SAMPLER_UV(NE_LEAKS_C, NE_LEAKS_3, MIRROR)
SAMPLER_UV(NE_LEAKS_D, NE_LEAKS_4, MIRROR)
SAMPLER_UV(NE_LEAKS_E, NE_LEAKS_5, MIRROR)

// DIRT ///////////////////////////////////////////////////////////////////
TEXTURE(NE_DIRT_1, "NativeEnhancer/Dirt/drita.png")
TEXTURE(NE_DIRT_2, "NativeEnhancer/Dirt/bruta.png")
SAMPLER(NE_DIRT_A, NE_DIRT_1)
SAMPLER(NE_DIRT_B, NE_DIRT_2)

// FRAME //////////////////////////////////////////////////////////////////
TEXTURE(NE_FRAME_1, "NativeEnhancer/Frame/frame1.png")
TEXTURE(NE_FRAME_2, "NativeEnhancer/Frame/frame2.png")
TEXTURE(NE_FRAME_3, "NativeEnhancer/Frame/frame3.png")
TEXTURE(NE_FRAME_4, "NativeEnhancer/Frame/frame4.png")
TEXTURE(NE_FRAME_5, "NativeEnhancer/Frame/frame5.png")
TEXTURE(NE_FRAME_6, "NativeEnhancer/Frame/frame6.png")
TEXTURE(NE_FRAME_7, "NativeEnhancer/Frame/frame7.png")
TEXTURE(NE_FRAME_8, "NativeEnhancer/Frame/frame8.png")
TEXTURE(NE_FRAME_9, "NativeEnhancer/Frame/frame9.png")
TEXTURE(NE_FRAME_10, "NativeEnhancer/Frame/frame10.png")
SAMPLER(NE_FRAME_A, NE_FRAME_1)
SAMPLER(NE_FRAME_B, NE_FRAME_2)
SAMPLER(NE_FRAME_C, NE_FRAME_3)
SAMPLER(NE_FRAME_D, NE_FRAME_4)
SAMPLER(NE_FRAME_E, NE_FRAME_5)
SAMPLER(NE_FRAME_F, NE_FRAME_6)
SAMPLER(NE_FRAME_G, NE_FRAME_7)
SAMPLER(NE_FRAME_H, NE_FRAME_8)
SAMPLER(NE_FRAME_I, NE_FRAME_9)
SAMPLER(NE_FRAME_J, NE_FRAME_10)

// PRISM ///////////////////////////////////////////////////////////////////
TEXTURE(NE_PRISM_1, "NativeEnhancer/Prism/prism1.jpg")
TEXTURE(NE_PRISM_2, "NativeEnhancer/Prism/prism2.jpg")
TEXTURE(NE_PRISM_3, "NativeEnhancer/Prism/prism3.jpg")
TEXTURE(NE_PRISM_4, "NativeEnhancer/Prism/prism4.jpg")
TEXTURE(NE_PRISM_5, "NativeEnhancer/Prism/prism5.jpg")
SAMPLER(NE_PRISM_A, NE_PRISM_1)
SAMPLER(NE_PRISM_B, NE_PRISM_2)
SAMPLER(NE_PRISM_C, NE_PRISM_3)
SAMPLER(NE_PRISM_D, NE_PRISM_4)
SAMPLER(NE_PRISM_E, NE_PRISM_5)
