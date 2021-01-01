/*
	NATIVENHANCER Film Emulation for ReShade
	Version One
	by dddfault
	Copyright (c) 2020 dddfault

	textures and other resources
  
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

// LUTs ///////////////////////////////////////////////////////////////////
D_TEX_A(NE_AGFA_FILM_T, "NativeEnhancer/LUT/NE_LUT_AGFA.png", 4096, 64 * AGFA_LUT_AMOUNT)
D_TEX_A(NE_FUJI_FILM_T, "NativeEnhancer/LUT/NE_LUT_FUJI.png", 4096, 64 * FUJI_LUT_AMOUNT)
D_TEX_A(NE_KODAK_FILM_T, "NativeEnhancer/LUT/NE_LUT_KODAK.png", 4096, 64 * KODAK_LUT_AMOUNT)
D_TEX_A(NE_POLAROID_FILM_T, "NativeEnhancer/LUT/NE_LUT_POLAROID.png", 4096, 64 * POLAROID_LUT_AMOUNT)
D_TEX_A(NE_ILFORD_FILM_T, "NativeEnhancer/LUT/NE_LUT_ILFORD.png", 4096, 64 * ILFORD_LUT_AMOUNT)
D_SAM(NE_AGFA_FILM, NE_AGFA_FILM_T)
D_SAM(NE_FUJI_FILM, NE_FUJI_FILM_T)
D_SAM(NE_KODAK_FILM, NE_KODAK_FILM_T)
D_SAM(NE_POLAROID_FILM, NE_POLAROID_FILM_T)
D_SAM(NE_ILFORD_FILM, NE_ILFORD_FILM_T)

// LIGHT LEAKS ////////////////////////////////////////////////////////////
/*D_TEX(NE_LEAKS_1, "NativeEnhancer/Leaks/leak1.jpg")
D_TEX(NE_LEAKS_2, "NativeEnhancer/Leaks/leak2.jpg")
D_TEX(NE_LEAKS_3, "NativeEnhancer/Leaks/leak3.jpg")
D_TEX(NE_LEAKS_4, "NativeEnhancer/Leaks/leak4.jpg")
D_TEX(NE_LEAKS_5, "NativeEnhancer/Leaks/leak5.jpg")
D_SAM_A(NE_LEAKS_A, NE_LEAKS_1, MIRROR)
D_SAM_A(NE_LEAKS_B, NE_LEAKS_2, MIRROR)
D_SAM_A(NE_LEAKS_C, NE_LEAKS_3, MIRROR)
D_SAM_A(NE_LEAKS_D, NE_LEAKS_4, MIRROR)
D_SAM_A(NE_LEAKS_E, NE_LEAKS_5, MIRROR)
*/

// DIRT ///////////////////////////////////////////////////////////////////
D_TEX(NE_DIRT_1, "NativeEnhancer/Dirt/dirt013.png")
D_TEX(NE_DIRT_2, "NativeEnhancer/Dirt/dirt012.png")
D_TEX(NE_DIRT_3, "NativeEnhancer/Dirt/decay011.png")
D_SAM(NE_DIRT_A, NE_DIRT_1)
D_SAM(NE_DIRT_B, NE_DIRT_2)
D_SAM(NE_DIRT_C, NE_DIRT_3)

// FRAME //////////////////////////////////////////////////////////////////
D_TEX(NE_FRAME_1, "NativeEnhancer/Frame/frame1.png")
D_TEX(NE_FRAME_2, "NativeEnhancer/Frame/frame2.png")
D_TEX(NE_FRAME_3, "NativeEnhancer/Frame/frame3.png")
D_TEX(NE_FRAME_4, "NativeEnhancer/Frame/frame4.png")
D_TEX(NE_FRAME_5, "NativeEnhancer/Frame/frame5.png")
D_TEX(NE_FRAME_6, "NativeEnhancer/Frame/frame6.png")
D_TEX(NE_FRAME_7, "NativeEnhancer/Frame/frame7.png")
D_TEX(NE_FRAME_8, "NativeEnhancer/Frame/frame8.png")
D_TEX(NE_FRAME_9, "NativeEnhancer/Frame/frame9.png")
D_TEX(NE_FRAME_10, "NativeEnhancer/Frame/frame10.png")
D_TEX(NE_FRAME_11, "NativeEnhancer/Frame/frame11.png")
D_TEX(NE_FRAME_12, "NativeEnhancer/Frame/frame12.png")
D_TEX(NE_FRAME_13, "NativeEnhancer/Frame/frame13.png")
D_SAM(NE_FRAME_A, NE_FRAME_1)
D_SAM(NE_FRAME_B, NE_FRAME_2)
D_SAM(NE_FRAME_C, NE_FRAME_3)
D_SAM(NE_FRAME_D, NE_FRAME_4)
D_SAM(NE_FRAME_E, NE_FRAME_5)
D_SAM(NE_FRAME_F, NE_FRAME_6)
D_SAM(NE_FRAME_G, NE_FRAME_7)
D_SAM(NE_FRAME_H, NE_FRAME_8)
D_SAM(NE_FRAME_I, NE_FRAME_9)
D_SAM(NE_FRAME_J, NE_FRAME_10)
D_SAM(NE_FRAME_K, NE_FRAME_11)
D_SAM(NE_FRAME_L, NE_FRAME_12)
D_SAM(NE_FRAME_M, NE_FRAME_13)

// POLAROID ///////////////////////////////////////////////////////////////
D_TEX(NE_POLAROID_1, "NativeEnhancer/Frame/Polaroid1.png")
D_TEX(NE_POLAROID_2, "NativeEnhancer/Frame/Polaroid2.png")
D_TEX(NE_POLAROID_3, "NativeEnhancer/Frame/Polaroid3.png")
D_TEX(NE_POLAROID_4, "NativeEnhancer/Frame/Polaroid4.png")
D_TEX(NE_POLAROID_5, "NativeEnhancer/Frame/Polaroid5.png")
D_TEX(NE_POLAROID_6, "NativeEnhancer/Frame/Polaroid6.png")
D_SAM(NE_POLAROID_A, NE_POLAROID_1)
D_SAM(NE_POLAROID_B, NE_POLAROID_2)
D_SAM(NE_POLAROID_C, NE_POLAROID_3)
D_SAM(NE_POLAROID_D, NE_POLAROID_4)
D_SAM(NE_POLAROID_E, NE_POLAROID_5)
D_SAM(NE_POLAROID_F, NE_POLAROID_6)
