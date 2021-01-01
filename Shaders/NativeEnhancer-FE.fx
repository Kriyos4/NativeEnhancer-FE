/*
	NATIVENHANCER Film Emulation for ReShade
	Version One
	by dddfault
	Copyright (c) 2020 dddfault

	A simple and basic film emulation using color lookup table
	combined with various overlay textures to mimic analog film looks.

	Additional credits
	- Based on Otis_Inf's MultiLUT
	  with further modification by prod80
	- Additional shader functions by prod80
	- Fisheye shader by Ice La Glace (ported from a site)

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

// INITIAL SETUP //////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
#include "ReShade.fxh"
#include "dMakro.fxh"
#include "NativeEnhancer\UserInterface.fxh"
#include "NativeEnhancer\Miscellaneous.fxh"
#include "NativeEnhancer\blendingmode.fxh"
#include "NativeEnhancer\Resources.fxh"

// PIXEL SHADER ///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
void FilmEmulation(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 color : SV_Target0)
{
	float  lerpfact;
	float2 texelsize;
	float3 lutcoord, lutcolor;
	color        = tex2D(ReShade::BackBuffer, texcoord.xy);
	color.rgb    = pow(abs((color.rgb - BP)/(WP - BP)), GAMMA) * (float3((255-CLIPPING)/255.0f, (255-CLIPPING)/255.0f, (255-CLIPPING)/255.0f) - float3(CLIPPING/255.0f, CLIPPING/255.0f, CLIPPING/255.0f)) + float3(CLIPPING/255.0f, CLIPPING/255.0f, CLIPPING/255.0f);

	texelsize    = rcp(64);
	texelsize.x /= 64;
	lutcoord     = float3((color.rg * 64 - color.rg + 0.5) * texelsize.xy, color.b * 64 - color.b);

	switch(FILM_TYPE_SELECTOR)
	{
		case 0:
			lutcoord.y  /= AGFA_LUT_AMOUNT;
			lutcoord.y  += (float(AGFA_LUT_SELECTOR) / AGFA_LUT_AMOUNT); break;
		case 1:
			lutcoord.y  /= FUJI_LUT_AMOUNT;
			lutcoord.y  += (float(FUJI_LUT_SELECTOR) / FUJI_LUT_AMOUNT); break;
		case 2:
			lutcoord.y  /= KODAK_LUT_AMOUNT;
			lutcoord.y  += (float(KODAK_LUT_SELECTOR) / KODAK_LUT_AMOUNT); break;
		case 3:
			lutcoord.y  /= POLAROID_LUT_AMOUNT;
			lutcoord.y  += (float(POLAROID_LUT_SELECTOR) / POLAROID_LUT_AMOUNT); break;
		case 4:
			lutcoord.y  /= ILFORD_LUT_AMOUNT;
			lutcoord.y  += (float(ILFORD_LUT_SELECTOR) / ILFORD_LUT_AMOUNT); break;
	}

	lerpfact     = frac(lutcoord.z);
	lutcoord.x  += (lutcoord.z - lerpfact) * texelsize.y;

	switch(FILM_TYPE_SELECTOR)
	{
		case 0:
			lutcolor   = lerp(tex2D(NE_AGFA_FILM, lutcoord.xy).rgb, tex2D(NE_AGFA_FILM, float2(lutcoord.x + texelsize.y, lutcoord.y)).rgb, lerpfact); break;
		case 1:
			lutcolor   = lerp(tex2D(NE_FUJI_FILM, lutcoord.xy).rgb, tex2D(NE_FUJI_FILM, float2(lutcoord.x + texelsize.y, lutcoord.y)).rgb, lerpfact); break;
		case 2:
			lutcolor   = lerp(tex2D(NE_KODAK_FILM, lutcoord.xy).rgb, tex2D(NE_KODAK_FILM, float2(lutcoord.x + texelsize.y, lutcoord.y)).rgb, lerpfact); break;
		case 3:
			lutcolor   = lerp(tex2D(NE_POLAROID_FILM, lutcoord.xy).rgb, tex2D(NE_POLAROID_FILM, float2(lutcoord.x + texelsize.y, lutcoord.y)).rgb, lerpfact); break;
		case 4:
			lutcolor   = lerp(tex2D(NE_ILFORD_FILM, lutcoord.xy).rgb, tex2D(NE_ILFORD_FILM, float2(lutcoord.x + texelsize.y, lutcoord.y)).rgb, lerpfact); break;
	}

	float3 lablut    = pd80_srgb_to_lab(lutcolor.rgb);
	float3 labcol    = pd80_srgb_to_lab(color.rgb);
	float newluma    = lerp(labcol.r, lablut.r, LUT_LUMA_MIX);
	float2 newAB     = lerp(labcol.gb, lablut.gb, LUT_CHROMA_MIX);
	lutcolor.rgb     = pd80_lab_to_srgb(float3(newluma, newAB));
	color.rgb        = lerp(color.rgb, saturate(lutcolor.rgb), LUT_INTENSITY);

	// Post LUT Grading
	color.rgb   		 = exp2(EXPOSURE * saturate(color.rgb)) * color.rgb;
  color.rgb       *= BRIGHTNESS;
	color.rgb	       = 0.5 + (saturate(color.rgb) - 0.5) * CONTRAST;
  color.rgb        = saturation(saturate(color.rgb), SATURATION);
	color.a          = 1.0;
}

/*
void FilmLeaks(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 color : SV_Target0)
{
	float2 lcoord, pcoord;
	float4  leaks, prism;
	color = tex2D(ReShade::BackBuffer, texcoord.xy);

	if (USE_LIGHT_LEAK == true)
	{
		switch(LIGHT_LEAK_VARIATION)
		{
			case 0:
				lcoord.xy = normalCoord(texcoord.xy); break;
			case 1:
				lcoord.xy = flippedCoord(texcoord.xy); break;
		}

		lcoord.xy = rotateUV2(lcoord.xy, LIGHT_LEAK_ROTATION);

		switch(LIGHT_LEAK_TYPE)
		{
			case 0:
				leaks = tex2D(NE_LEAKS_A, lcoord.xy); break;
			case 1:
				leaks = tex2D(NE_LEAKS_B, lcoord.xy); break;
			case 2:
				leaks = tex2D(NE_LEAKS_C, lcoord.xy); break;
			case 3:
				leaks = tex2D(NE_LEAKS_D, lcoord.xy); break;
			case 4:
				leaks = tex2D(NE_LEAKS_E, lcoord.xy); break;
		}

		leaks.rgb = hueslider(leaks.rgb, LIGHT_LEAK_HUE);
		leaks.rgb = saturation(leaks.rgb, LIGHT_LEAK_SATURATE);
		color = blendingmode(leaks, color, LIGHT_LEAK_BLENDMODE, LIGHT_LEAK_OPACITY);
	}

	color.a      = 1.0;
}
*/

void FilmFrame(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 color : SV_Target0)
{
	float2 dcoord, fcoord;
	float4 dirt, frame;
	color = tex2D(ReShade::BackBuffer, texcoord.xy);

	if (aspekRasio == wideRasio)
	{
		fcoord.xy = texcoord.xy;
	} else {
		fcoord.xy = fitTex(texcoord.xy);
	}

	if (USE_DIRT == true)
	{
		switch(DIRT_VARIATION)
		{
			case 0:
				dcoord.xy = normalCoord(texcoord.xy); break;
			case 1:
				dcoord.xy = flippedCoord(texcoord.xy); break;
		}
			dcoord.xy = rotateUV2(dcoord.xy, DIRT_ROTATION);

		switch(DIRT_TYPE)
		{
			case 0:
				dirt = 1-tex2D(NE_DIRT_A, dcoord.xy).r; break;
			case 1:
				dirt = 1-tex2D(NE_DIRT_A, dcoord.xy).g; break;
			case 2:
				dirt = 1-tex2D(NE_DIRT_A, dcoord.xy).b; break;
			case 3:
				dirt = 1-tex2D(NE_DIRT_B, dcoord.xy).r; break;
			case 4:
				dirt = 1-tex2D(NE_DIRT_B, dcoord.xy).g; break;
			case 5:
				dirt = 1-tex2D(NE_DIRT_B, dcoord.xy).b; break;
			case 6:
				dirt = tex2D(NE_DIRT_C, dcoord.xy).r; break;
			case 7:
				dirt = tex2D(NE_DIRT_C, dcoord.xy).g; break;
			case 8:
				dirt = tex2D(NE_DIRT_C, dcoord.xy).b; break;
		}

		//color = alphaBlend(color, opacityValue(dirt, DIRT_OPACITY));
		color = blendingmode(fillValue(dirt, DIRT_CURVE), color, DIRT_BLENDMODE, DIRT_OPACITY);
	}

	if (USE_FRAME == 1)
	{
		switch(POLAROID_TYPE)
		{
			case 0:
				frame = tex2D(NE_POLAROID_A, fcoord.xy);
			break;
			case 1:
				frame = tex2D(NE_POLAROID_B, fcoord.xy);
			break;
			case 2:
				frame = tex2D(NE_POLAROID_C, fcoord.xy);
			break;
			case 3:
				frame = tex2D(NE_POLAROID_D, fcoord.xy);
			break;
			case 4:
				frame = tex2D(NE_POLAROID_E, fcoord.xy);
			break;
			case 5:
				frame = tex2D(NE_POLAROID_F, fcoord.xy);
			break;
		}
	}
	else if (USE_FRAME == 2)
	{
		switch(FRAME_TYPE)
		{
			case 0:
				frame = tex2D(NE_FRAME_A, fcoord.xy);
			break;
			case 1:
				frame = tex2D(NE_FRAME_B, fcoord.xy);
			break;
			case 2:
				frame = tex2D(NE_FRAME_C, fcoord.xy);
			break;
			case 3:
				frame = tex2D(NE_FRAME_D, fcoord.xy);
			break;
			case 4:
				frame = tex2D(NE_FRAME_E, fcoord.xy);
			break;
			case 5:
				frame = tex2D(NE_FRAME_F, fcoord.xy);
			break;
			case 6:
				frame = tex2D(NE_FRAME_G, fcoord.xy);
			break;
			case 7:
				frame = tex2D(NE_FRAME_H, fcoord.xy);
			break;
			case 8:
				frame = tex2D(NE_FRAME_I, fcoord.xy);
			break;
			case 9:
				frame = tex2D(NE_FRAME_J, fcoord.xy);
			break;
			case 10:
				frame = tex2D(NE_FRAME_K, fcoord.xy);
			break;
			case 11:
				frame = tex2D(NE_FRAME_L, fcoord.xy);
			break;
			case 12:
				frame = tex2D(NE_FRAME_M, fcoord.xy);
			break;
		}
	}

	color = alphaBlend(color, frame);
	color.a = 1.0;
}

void FilmEffect(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 color : SV_Target0)
{
	color = tex2D(ReShade::BackBuffer, texcoord);
	if (USE_LENS_SOFT == true)
	{
		color = BoxBlur(color, texcoord, ReShade::BackBuffer, FILM_SMOOTH);
	}
}

void FilmEffect2(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 color : SV_Target0)
{
	color = tex2D(ReShade::BackBuffer, texcoord);
	if (USE_VIGNETTE == true)
	{
		float2 coord = (texcoord.xy - 0.5) * VIGNETTE_RADIUS;
		float vignette = saturate(dot(coord.xy, coord.xy));
		vignette = pow(vignette, VIGNETTE_CURVE);
		color.rgb = lerp(color.rgb, VIGNETTE_COLOR, vignette * VIGNETTE_INTENSITY);
	}

	if (USE_FISHEYE == true)
	{
		color = FisheyeFunction(color, texcoord, ORIENTATION, FISHEYE_ZOOM, FISHEYE_DISTORT, FISHEYE_CUBICDISTORT);
	}
}

// TECHNIQUE //////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
D_TEQ(NE_FilmEmulation,
			   "            - NativeEnhancer Film Emulation -\n\n"
			   "A simple and basic film emulation using color lookup table\n"
         "combined with various overlay textures to mimic analog film looks.\n\n"
         "This shader better combined with prod80's shaders.\n"
         "(Film Grain, Chromatic Abberation, etc.) \n"
         "\nMake sure to put this technique after any color grading\n"
         "for better result and compatibility with other shaders.\n",
			PASS(PostProcessVS, FilmEmulation)
			PASS(PostProcessVS, FilmEffect))

D_TEQ(NE_FilmOverlays,
			   "            - NativeEnhancer Film Emulation -\n\n"
			   "A simple and basic film emulation LUT shader\n"
         "with various overlay textures to mimic an old film looks.\n\n"
         "This is a overlay technique part\n"
         "\nMake sure to put this technique after any screen, lens, filmic effects\n"
				 "such as Film Grain, Chromatic Abberation, Lens Flare, Bloom, etc\n"
         "for better result and compatibility with other shaders.\n",
			 PASS(PostProcessVS, FilmEffect2)
			 PASS(PostProcessVS, FilmFrame))
