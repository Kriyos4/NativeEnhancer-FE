//     _   __      __  _            ______      __
//    / | / /___ _/ /_(_)   _____  / ____/___  / /_  ____ _____  ________  _____
//   /  |/ / __ `/ __/ / | / / _ \/ __/ / __ \/ __ \/ __ `/ __ \/ ___/ _ \/ ___/
//  / /|  / /_/ / /_/ /| |/ /  __/ /___/ / / / / / / /_/ / / / / /__/  __/ /
// /_/ |_/\__,_/\__/_/ |___/\___/_____/_/ /_/_/ /_/\__,_/_/ /_/\___/\___/_/
///////////////////////////////////////////////////////////////////////////
// Film Emulation LUT
// Version 2.5 Closed Public Release
///////////////////////////////////////////////////////////////////////////
// Multi-LUT function, using a texture atlas with multiple LUTs
// by Otis / Infuse Project.
// Based on Marty McFly's LUT shader 1.0 for ReShade 3.0
// Copyright © 2008-2016 Marty McFly
///////////////////////////////////////////////////////////////////////////
//
///////////////////////////////////////////////////////////////////////////

// PRE-PROCESSOR //////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

#define CONFIGURATION_TYPE		3
/* 1 : High-Contrast Visual Based
	 2 : Low-Contrast Visual Based
	 3 : Full Parameter Control */

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

	if (FILM_TYPE_SELECTOR == 0){
		lutcoord.y  /= BNW_LUT_AMOUNT;
		lutcoord.y  += (float(BNW_LUT_SELECTOR) / BNW_LUT_AMOUNT);}
	else if (FILM_TYPE_SELECTOR == 1){
		lutcoord.y  /= INS_LUT_AMOUNT;
		lutcoord.y  += (float(INS_LUT_SELECTOR) / INS_LUT_AMOUNT);}
	else if (FILM_TYPE_SELECTOR == 2){
		lutcoord.y  /= NEG_LUT_AMOUNT;
		lutcoord.y  += (float(NEG_LUT_SELECTOR) / NEG_LUT_AMOUNT);}
	else if (FILM_TYPE_SELECTOR == 3){
		lutcoord.y  /= SLI_LUT_AMOUNT;
		lutcoord.y  += (float(SLI_LUT_SELECTOR) / SLI_LUT_AMOUNT);}
	else if (FILM_TYPE_SELECTOR == 4){
		lutcoord.y  /= VIN_LUT_AMOUNT;
		lutcoord.y  += (float(VIN_LUT_SELECTOR) / VIN_LUT_AMOUNT);}

	lerpfact     = frac(lutcoord.z);
	lutcoord.x  += (lutcoord.z - lerpfact) * texelsize.y;

	if (FILM_TYPE_SELECTOR == 0){
		lutcolor   = lerp(tex2D(NE_BNW_FILM, lutcoord.xy).rgb, tex2D(NE_BNW_FILM, float2(lutcoord.x + texelsize.y, lutcoord.y)).rgb, lerpfact);}
	else if (FILM_TYPE_SELECTOR == 1){
		lutcolor   = lerp(tex2D(NE_INS_FILM, lutcoord.xy).rgb, tex2D(NE_INS_FILM, float2(lutcoord.x + texelsize.y, lutcoord.y)).rgb, lerpfact);}
	else if (FILM_TYPE_SELECTOR == 2){
		lutcolor   = lerp(tex2D(NE_NEG_FILM, lutcoord.xy).rgb, tex2D(NE_NEG_FILM, float2(lutcoord.x + texelsize.y, lutcoord.y)).rgb, lerpfact);}
	else if (FILM_TYPE_SELECTOR == 3){
		lutcolor   = lerp(tex2D(NE_SLI_FILM, lutcoord.xy).rgb, tex2D(NE_SLI_FILM, float2(lutcoord.x + texelsize.y, lutcoord.y)).rgb, lerpfact);}
	else if (FILM_TYPE_SELECTOR == 4){
		lutcolor   = lerp(tex2D(NE_VIN_FILM, lutcoord.xy).rgb, tex2D(NE_VIN_FILM, float2(lutcoord.x + texelsize.y, lutcoord.y)).rgb, lerpfact);}

	color.rgb    = lerp(normalize(color.rgb), normalize(lutcolor.rgb), 1) * lerp(length(color.rgb), length(lutcolor.rgb), 1);
	color.rgb    = FSATURATION(color.rgb, SATURATION);
	color.rgb    = ((color.rgb - 0.5f) * max(CONTRAST, 0)) + 0.5f;
	color.a      = 1.0;
}

void FilmEffects(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 color : SV_Target0)
{
	color = tex2D(ReShade::BackBuffer, texcoord.xy);
	if (USE_RADIAL_BLUR == true){
		color = RadialBlur(texcoord.xy, RAD_BLUR_AMOUNT);
	}
	color.a      = 1.0;
}

void FilmOverlay1(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 color : SV_Target0)
{
	float2 lcoord, pcoord;
	float4  leaks, prism;
	color = tex2D(ReShade::BackBuffer, texcoord.xy);

	if (USE_LIGHT_LEAK == true){
		if (LIGHT_LEAK_VARIATION == 0){
			lcoord.xy = NORM_COORD(texcoord.xy);}
		else if (LIGHT_LEAK_VARIATION == 1){
			lcoord.xy = FLIP_COORD(texcoord.xy);}
		  lcoord.xy = rotateUV(lcoord.xy, LIGHT_LEAK_ROTATION);

		if (LIGHT_LEAK_TYPE == 0){
			leaks = tex2D(NE_LEAKS_A, lcoord.xy);}
		else if (LIGHT_LEAK_TYPE == 1){
			leaks = tex2D(NE_LEAKS_B, lcoord.xy);}
		else if (LIGHT_LEAK_TYPE == 2){
			leaks = tex2D(NE_LEAKS_C, lcoord.xy);}
		else if (LIGHT_LEAK_TYPE == 3){
			leaks = tex2D(NE_LEAKS_D, lcoord.xy);}
		else if (LIGHT_LEAK_TYPE == 4){
			leaks = tex2D(NE_LEAKS_E, lcoord.xy);}

		leaks.rgb = hueslider(leaks.rgb, LIGHT_LEAK_HUE);
		leaks.rgb = FSATURATION(leaks.rgb, LIGHT_LEAK_SATURATE);
		leaks = FILL_CONTROL(leaks, LIGHT_LEAK_INTENSITY);

		if (LIGHT_LEAK_BLEND_MODE == 0){
			color = BlendScreen(color, OPACITY_CONTROL(leaks, LIGHT_LEAK_OPACITY));}
		else if (LIGHT_LEAK_BLEND_MODE == 1){
			color = BlendKrautz(color, OPACITY_CONTROL(leaks, LIGHT_LEAK_OPACITY));}
	}

	if (USE_PRISM == true){
		if (PRISM_VARIATION == 0){
			pcoord.xy = NORM_COORD(texcoord.xy);}
		else if (PRISM_VARIATION == 1){
			pcoord.xy = FLIP_COORD(texcoord.xy);}
			pcoord.xy = rotateUV(pcoord.xy, PRISM_ROTATION);

		if (PRISM_TYPE == 0){
			prism = tex2D(NE_PRISM_A, pcoord.xy);}
		else if (PRISM_TYPE == 1){
			prism = tex2D(NE_PRISM_B, pcoord.xy);}
		else if (PRISM_TYPE == 2){
			prism = tex2D(NE_PRISM_C, pcoord.xy);}
		else if (PRISM_TYPE == 3){
			prism = tex2D(NE_PRISM_D, pcoord.xy);}
		else if (PRISM_TYPE == 4){
			prism = tex2D(NE_PRISM_E, pcoord.xy);}

		prism = FILL_CONTROL(prism, PRISM_INTENSITY);
		color = BlendScreen(color, OPACITY_CONTROL(prism, PRISM_OPACITY));
	}

	color.a      = 1.0;
}

void FilmOverlay2(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 color : SV_Target0)
{
	float2 dcoord;
	float4  dirt, frame;

	color = tex2D(ReShade::BackBuffer, texcoord.xy);

	if (USE_DIRT == true){
		if (DIRT_VARIATION == 0){
			dcoord.xy = NORM_COORD(texcoord.xy);}
		else if (DIRT_VARIATION == 1){
			dcoord.xy = FLIP_COORD(texcoord.xy);}
			dcoord.xy = rotateUV(dcoord.xy, DIRT_ROTATION);

		if (DIRT_TYPE == 0){
			dirt = tex2D(NE_DIRT_A, dcoord.xy);}
		else if (DIRT_TYPE == 1){
			dirt = tex2D(NE_DIRT_B, dcoord.xy);}
		dirt  = FILL_CONTROL(dirt, DIRT_INTENSITY);
		color = ALPHA_BLEND(color, dirt);
	}

	if (USE_FRAME == true){
		if (FRAME_TYPE == 0){
			frame = tex2D(NE_FRAME_A, texcoord.xy);}
		else if (FRAME_TYPE == 1){
			frame = tex2D(NE_FRAME_B, texcoord.xy);}
		else if (FRAME_TYPE == 2){
			frame = tex2D(NE_FRAME_C, texcoord.xy);}
		else if (FRAME_TYPE == 3){
			frame = tex2D(NE_FRAME_D, texcoord.xy);}
		else if (FRAME_TYPE == 4){
			frame = tex2D(NE_FRAME_E, texcoord.xy);}
		else if (FRAME_TYPE == 5){
			frame = tex2D(NE_FRAME_F, texcoord.xy);}
		else if (FRAME_TYPE == 6){
			frame = tex2D(NE_FRAME_G, texcoord.xy);}
		else if (FRAME_TYPE == 7){
			frame = tex2D(NE_FRAME_H, texcoord.xy);}
		else if (FRAME_TYPE == 8){
			frame = tex2D(NE_FRAME_I, texcoord.xy);}
		else if (FRAME_TYPE == 9){
			frame = tex2D(NE_FRAME_J, texcoord.xy);}

		color = ALPHA_BLEND(color, frame);
	}

	color.a      = 1.0;
}

// TECHNIQUE //////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

TECHNIQUE(NativeEnhancerFE,
	PASS(1, PostProcessVS, FilmAdjustment)
	PASS(2, PostProcessVS, FilmEmulation)
	PASS(3, PostProcessVS, FilmEffects)
	PASS(4, PostProcessVS, FilmOverlay1)
	PASS(5, PostProcessVS, FilmOverlay2)
	)
