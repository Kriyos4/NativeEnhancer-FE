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
// An simple and basic film emulation using LUT with various overlay
// textures to mimic an old film looks.
///////////////////////////////////////////////////////////////////////////
// Multi-LUT function, using a texture atlas with multiple LUTs
// by Otis / Infuse Project.
// Based on Marty McFly's LUT shader 1.0 for ReShade 3.0
// Copyright © 2008-2016 Marty McFly
///////////////////////////////////////////////////////////////////////////

// PRE-PROCESSOR //////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
#ifndef CONFIGURATION_TYPE
	#define CONFIGURATION_TYPE		3 // 1 : High-Contrast Visual Based | 2 : Low-Contrast Visual Based | 3 : Full Parameter Control
#endif

// INITIAL SETUP //////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
#include "ReShade.fxh"
#include "Macros.fxh"
#include "NativeEnhancer\Common\Miscellaneous.fxh"
#include "NativeEnhancer\Common\Resources.fxh"
#include "NativeEnhancer\Common\UserInterface.fxh"

// PIXEL SHADER ///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
void FilmAdjustment(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 color : SV_Target0)
{
	color      = tex2D(ReShade::BackBuffer, texcoord.xy);
	color.rgb *= pow(2.0f, lerp(-1.0, 1.0, ((EXPOSURE + 1) * 0.5)));
	color.rgb  = pow(abs((color.rgb - float3(0/255.0f, 0/255.0f, 0/255.0f))/(float3(255/255.0f, 255/255.0f, 255/255.0f) - float3(0/255.0f, 0/255.0f, 0/255.0f))), GAMMA) * (WHITE_POINT - BLACK_POINT) + BLACK_POINT;
	color.a    = 1.0;
}

void FilmEmulation(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 color : SV_Target0)
{
	float  lerpfact;
	float2 texelsize;
	float3 lutcoord, lutcolor;

	color        = tex2D(ReShade::BackBuffer, texcoord.xy);

	texelsize    = 1.0 / 64;
	texelsize.x /= 64;
	lutcoord     = float3((color.rg * 64 - color.rg + 0.5) * texelsize.xy, color.b * 64 - color.b);

	switch(FILM_TYPE_SELECTOR)
	{
		case 0:
			lutcoord.y  /= BNW_LUT_AMOUNT;
			lutcoord.y  += (float(BNW_LUT_SELECTOR) / BNW_LUT_AMOUNT);
		break;
		case 1:
			lutcoord.y  /= INS_LUT_AMOUNT;
			lutcoord.y  += (float(INS_LUT_SELECTOR) / INS_LUT_AMOUNT);
		break;
		case 2:
			lutcoord.y  /= NEG_LUT_AMOUNT;
			lutcoord.y  += (float(NEG_LUT_SELECTOR) / NEG_LUT_AMOUNT);
		break;
		case 3:
			lutcoord.y  /= SLI_LUT_AMOUNT;
			lutcoord.y  += (float(SLI_LUT_SELECTOR) / SLI_LUT_AMOUNT);
		break;
		case 4:
			lutcoord.y  /= VIN_LUT_AMOUNT;
			lutcoord.y  += (float(VIN_LUT_SELECTOR) / VIN_LUT_AMOUNT);
		break;
	}

	lerpfact     = frac(lutcoord.z);
	lutcoord.x  += (lutcoord.z - lerpfact) * texelsize.y;

	switch(FILM_TYPE_SELECTOR)
	{
		case 0:
			lutcolor   = lerp(tex2D(NE_BNW_FILM, lutcoord.xy).rgb, tex2D(NE_BNW_FILM, float2(lutcoord.x + texelsize.y, lutcoord.y)).rgb, lerpfact);
		break;
		case 1:
			lutcolor   = lerp(tex2D(NE_INS_FILM, lutcoord.xy).rgb, tex2D(NE_INS_FILM, float2(lutcoord.x + texelsize.y, lutcoord.y)).rgb, lerpfact);
		break;
		case 2:
			lutcolor   = lerp(tex2D(NE_NEG_FILM, lutcoord.xy).rgb, tex2D(NE_NEG_FILM, float2(lutcoord.x + texelsize.y, lutcoord.y)).rgb, lerpfact);
		break;
		case 3:
			lutcolor   = lerp(tex2D(NE_SLI_FILM, lutcoord.xy).rgb, tex2D(NE_SLI_FILM, float2(lutcoord.x + texelsize.y, lutcoord.y)).rgb, lerpfact);
		break;
		case 4:
			lutcolor   = lerp(tex2D(NE_VIN_FILM, lutcoord.xy).rgb, tex2D(NE_VIN_FILM, float2(lutcoord.x + texelsize.y, lutcoord.y)).rgb, lerpfact);
		break;
	}

	color.rgb    = lerp(normalize(color.rgb), normalize(lutcolor.rgb), 1) * lerp(length(color.rgb), length(lutcolor.rgb), 1);
	color.rgb    = FSATURATION(color.rgb, SATURATION);
	color.rgb    = ((color.rgb - 0.5f) * max(CONTRAST, 0)) + 0.5f;
	color.a      = 1.0;
}

void FilmOverlay1(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 color : SV_Target0)
{
	float2 lcoord, pcoord;
	float4  leaks, prism;
	color = tex2D(ReShade::BackBuffer, texcoord.xy);

	if (USE_LIGHT_LEAK == true)
	{
		switch(LIGHT_LEAK_VARIATION)
		{
			case 0:
				lcoord.xy = NORM_COORD(texcoord.xy);
			break;
			case 1:
				lcoord.xy = FLIP_COORD(texcoord.xy);
			break;
		}

		lcoord.xy = rotateUV(lcoord.xy, LIGHT_LEAK_ROTATION);

		switch(LIGHT_LEAK_TYPE)
		{
			case 0:
				leaks = tex2D(NE_LEAKS_A, lcoord.xy);
			break;
			case 1:
				leaks = tex2D(NE_LEAKS_B, lcoord.xy);
			break;
			case 2:
				leaks = tex2D(NE_LEAKS_C, lcoord.xy);
			break;
			case 3:
				leaks = tex2D(NE_LEAKS_D, lcoord.xy);
			break;
			case 4:
				leaks = tex2D(NE_LEAKS_E, lcoord.xy);
			break;
		}

		leaks.rgb = hueslider(leaks.rgb, LIGHT_LEAK_HUE);
		leaks.rgb = FSATURATION(leaks.rgb, LIGHT_LEAK_SATURATE);
		leaks = FILL_CONTROL(leaks, LIGHT_LEAK_INTENSITY);

		switch(LIGHT_LEAK_BLEND_MODE)
		{
			case 0:
				color = BlendScreen(color, OPACITY_CONTROL(leaks, LIGHT_LEAK_OPACITY));
			break;
			case 1:
				color = BlendLighten(color, OPACITY_CONTROL(leaks, LIGHT_LEAK_OPACITY));
			break;
			case 2:
				color = BlendModLighten(color, OPACITY_CONTROL(leaks, LIGHT_LEAK_OPACITY));
			break;
		}
	}

	color.a      = 1.0;
}

void FilmOverlay2(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 color : SV_Target0)
{
	float2 dcoord;
	float4 dirt, frame;

	color = tex2D(ReShade::BackBuffer, texcoord.xy);

	if (USE_DIRT == true)
	{
		switch(DIRT_VARIATION)
		{
			case 0:
				dcoord.xy = NORM_COORD(texcoord.xy);
			break;
			case 1:
				dcoord.xy = FLIP_COORD(texcoord.xy);
			break;
		}
			dcoord.xy = rotateUV(dcoord.xy, DIRT_ROTATION);

		switch(DIRT_TYPE)
		{
			case 0:
				dirt = tex2D(NE_DIRT_A, dcoord.xy);
			break;
			case 1:
				dirt = tex2D(NE_DIRT_B, dcoord.xy);
			break;
		}

		dirt  = FILL_CONTROL(dirt, DIRT_INTENSITY);
		color = ALPHA_BLEND(color, dirt);
	}

	if (USE_FRAME == 1)
	{
		switch(POLAROID_TYPE)
		{
			case 0:
				frame = tex2D(NE_POLAROID_A, texcoord.xy);
			break;
			case 1:
				frame = tex2D(NE_POLAROID_B, texcoord.xy);
			break;
			case 2:
				frame = tex2D(NE_POLAROID_C, texcoord.xy);
			break;
			case 3:
				frame = tex2D(NE_POLAROID_D, texcoord.xy);
			break;
			case 4:
				frame = tex2D(NE_POLAROID_E, texcoord.xy);
			break;
			case 5:
				frame = tex2D(NE_POLAROID_F, texcoord.xy);
			break;
		}
	}
	else if (USE_FRAME == 2)
	{
		switch(FRAME_TYPE)
		{
			case 0:
				frame = tex2D(NE_FRAME_A, texcoord.xy);
			break;
			case 1:
				frame = tex2D(NE_FRAME_B, texcoord.xy);
			break;
			case 2:
				frame = tex2D(NE_FRAME_C, texcoord.xy);
			break;
			case 3:
				frame = tex2D(NE_FRAME_D, texcoord.xy);
			break;
			case 4:
				frame = tex2D(NE_FRAME_E, texcoord.xy);
			break;
			case 5:
				frame = tex2D(NE_FRAME_F, texcoord.xy);
			break;
			case 6:
				frame = tex2D(NE_FRAME_G, texcoord.xy);
			break;
			case 7:
				frame = tex2D(NE_FRAME_H, texcoord.xy);
			break;
			case 8:
				frame = tex2D(NE_FRAME_I, texcoord.xy);
			break;
			case 9:
				frame = tex2D(NE_FRAME_J, texcoord.xy);
			break;
		}
	}

	color = ALPHA_BLEND(color, frame);
	color.a = 1.0;
}

// TECHNIQUE //////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

TECHNIQUE(NativeEnhancerFE,
	PASS(1, PostProcessVS, FilmAdjustment)
	PASS(2, PostProcessVS, FilmEmulation)
	PASS(4, PostProcessVS, FilmOverlay1)
	PASS(4, PostProcessVS, FilmOverlay2)
	)
