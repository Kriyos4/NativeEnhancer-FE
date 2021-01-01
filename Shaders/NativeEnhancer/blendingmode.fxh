/*
	NATIVENHANCER Film Emulation for ReShade
	Version One
	by dddfault
	Copyright (c) 2020 dddfault

	Blending mode helper file

	Additional credits
	- Photoshop blending modes by Romain Dura
	  further modification inspired by prod80

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

float3 bDarken(float3 b, float3 c)        {return min(b, c);}
float3 bMultiply(float3 b, float3 c)      {return (c * b);}
float3 bColorBurn(float3 b, float3 c)     {return ((b == 0.0) ? b : max((1.0 - ((1.0 - c) / b)), 0.0));}
float3 bLinearDodge(float3 b, float3 c)   {return min(c + b, 1.0);}
float3 bLinearBurn(float3 b, float3 c)    {return max(c + b - 1.0, 0.0);}
float3 bLighten(float3 b, float3 c)       {return max(b, c);}
float3 bScreen(float3 b, float3 c)        {return (1.0 - ((1.0 - c) * (1.0 - b)));}
float3 bColorDodge(float3 b, float3 c)    {return ((b == 1.0) ? b : min(c / (1.0 - b), 1.0));}
float3 bAdd(float3 b, float3 c)           {return min(c + b, 1.0);}
float3 bOverlay(float3 b, float3 c)       {return (c < 0.5 ? (2.0 * c * b) : (1.0 - 2.0 * (1.0 - c) * (1.0 - b)));}
float3 bSoftLight(float3 b, float3 c)     {return ((b < 0.5) ? (2.0 * c * b + c * c * (1.0 - 2.0 * b)) : (sqrt(c) * (2.0 * b - 1.0) + 2.0 * c * (1.0 - b)));}
float3 bVividLight(float3 b, float3 c)    {return ((b < 0.5) ? bColorBurn(c, (2.0 * b)) : bColorDodge(c, (2.0 * (b - 0.5))));}
float3 bLinearLight(float3 b, float3 c)   {return (b < 0.5 ? bLinearBurn(c, (2.0 * b)) : bLinearDodge(c, (2.0 * (b - 0.5))));}
float3 bPinLight(float3 b, float3 c)      {return ((b < 0.5) ? bDarken(c, (2.0 * b)) : bLighten(c, (2.0 *(b - 0.5))));}
float3 bHardMix(float3 b, float3 c)       {return ((bVividLight(b, c) < 0.5) ? 0.0 : 1.0);}
float3 bDifference(float3 b, float3 c)    {return abs(c - b);}
float3 bExclusion(float3 b, float3 c)     {return (c + b - 2.0 * c * b);}
float3 bSubstract(float3 b, float3 c)     {return max(c + b - 1.0, 0.0);}
float3 bReflect(float3 b, float3 c)       {return ((b == 1.0) ? b : min(c * c / (1.0 - b), 1.0));}
float3 bHue(float3 c, float3 b)           {float3 cHSL = RGBToHSL(c);
                                          return HSLToRGB(float3(RGBToHSL(b).r, cHSL.g, cHSL.b));}
float3 bSaturation(float3 c, float3 b)    {float3 cHSL = RGBToHSL(c);
                                          return HSLToRGB(float3(cHSL.r, RGBToHSL(b).g, cHSL.b));}
float3 bColor(float3 c, float3 b)         {float3 bHSL = RGBToHSL(b);
                                        	return HSLToRGB(float3(bHSL.r, bHSL.g, RGBToHSL(c).b));}
float3 bLuminosity(float3 c, float3 b)    {float3 cHSL = RGBToHSL(c);
                                          return HSLToRGB(float3(cHSL.r, cHSL.g, RGBToHSL(b).b));}

float3 blendingmode(float3 b, float3 c, int mode, float o)
{
    float3 ret;
    switch(mode)
    {
        case 0:  // Default
        {ret.xyz = b.xyz;} break;
        case 1:  // Darken
        {ret.xyz = bDarken(b, c);} break;
        case 2:  // Multiply
        {ret.xyz = bMultiply(b, c);} break;
        case 3:  // Colorburn
        {ret.xyz = bColorBurn(b, c);} break;
        case 4:  // Lineardodge
        {ret.xyz = bLinearDodge(b, c);} break;
        case 5:  // Linearburn
        {ret.xyz = bLinearBurn(b, c);} break;
        case 6:  // Lighten
        {ret.xyz = bLighten(b, c);} break;
        case 7:  // Screen
        {ret.xyz = bScreen(b, c);} break;
        case 8:  // Colordodge
        {ret.xyz = bColorDodge(b, c);} break;
        case 9:  // Add
        {ret.xyz = bAdd(b, c);} break;
        case 10:  // Overlay
        {ret.xyz = bOverlay(b, c);} break;
        case 11:  // Softlight
        {ret.xyz = bSoftLight(b, c);} break;
        case 12:  // Vividlight
        {ret.xyz = bVividLight(b, c);} break;
        case 13:  // Linearlight
        {ret.xyz = bLinearLight(b, c);} break;
        case 14:  // Pinlight
        {ret.xyz = bPinLight(b, c);} break;
        case 15:  // Hardmix
        {ret.xyz = bHardMix(b, c);} break;
        case 16:  // Difference
        {ret.xyz = bDifference(b, c);} break;
        case 17:  // Exclusion
        {ret.xyz = bExclusion(b, c);} break;
        case 18:  // Substract
        {ret.xyz = bSubstract(b, c);} break;
        case 19:  // Reflect
        {ret.xyz = bReflect(b, c);} break;
        case 20:  // Hue
        {ret.xyz = bHue(b, c);} break;
        case 21:  // Saturation
        {ret.xyz = bSaturation(b, c);} break;
        case 22:  // Color
        {ret.xyz = bColor(b, c);} break;
        case 23:  // Luminosity
        {ret.xyz = bLuminosity(b, c);} break;

    }
    return saturate(lerp(c.xyz, ret.xyz, o));
}
