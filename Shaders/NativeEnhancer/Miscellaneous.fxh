/*
	NATIVENHANCER Film Emulation for ReShade
	Version One
	by dddfault
	Copyright (c) 2020 dddfault

	Helper function file to assist the main shader

	Additional credits
	- Perfect Fit Fill image function by Otis_Inf
	- sRGB conversion function by prod80

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

// NUMBER OF LUT AMOUNT ///////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
#define AGFA_LUT_AMOUNT      41
#define FUJI_LUT_AMOUNT      72
#define KODAK_LUT_AMOUNT     93
#define POLAROID_LUT_AMOUNT  44
#define ILFORD_LUT_AMOUNT    13

// FUNCTIONS //////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
#define lumaCoeff         float3(0.212656, 0.715158, 0.072186)
#define WP                float3(255/255.0f, 255/255.0f, 255/255.0f)
#define BP                float3(0/255.0f, 0/255.0f, 0/255.0f)
// Otis' Perfect Fit Fill Image
#define aspekRasio         (float(BUFFER_WIDTH)/float(BUFFER_HEIGHT))
#define wideRasio          1.77777777778 //Widescreen (16:9) Aspect Ratio
#define idealRatio         float2(float(BUFFER_HEIGHT) * 1.61803399, float(BUFFER_WIDTH) / 1.61803399) //x. width, y. height
#define sourceCoord        float4(float(BUFFER_WIDTH)/idealRatio.x, 1.0, idealRatio.x/float(BUFFER_WIDTH), 1.0)
#define fitTex(tex)        float2((tex.x * sourceCoord.x) - ((1.0-sourceCoord.z)/2.0), (tex.y * sourceCoord.y) - ((1.0-sourceCoord.w)/2.0))

float4 opacityValue(float4 base, float opacity)   {return lerp(0, base, opacity);}
float4 alphaBlend(float4 base, float4 blend)      {return lerp(base, blend, blend.a);}
float3 saturation(float3 base, float sat)         {return lerp(dot(base, lumaCoeff), base, sat);}
float3 fillValue(float3 base, float fill)         {return pow(abs(base), lerp(2, 0, fill));}
float2 normalCoord(float2 coord)                  {return float2(coord.x, coord.y);}
float2 flippedCoord(float2 coord)                 {return float2(1.0-coord.x, coord.y);}

// passes and functions ///////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
float3 radialBlur(float2 uv, float rad_amount)
{
  float4 color;

  float b   = 0;
  for (int i = 1; i <= 32; i++)
  {
    uv -= b;
    uv *= 1.0+(rad_amount * 0.01);
    b = (1-(1*pow(abs(1.0+(rad_amount * 0.01)), i))) / 2;
    uv += b;
    color += tex2Dlod(ReShade::BackBuffer, float4(uv.x, uv.y, 10, 10));
  }
  color = color / 32;
  return color.rgb;
}

float4 LUTFunction(sampler2D LUT_TEXTURE, float4 color, int LUT_AMOUNT, int LUT_SELECTOR, float LUMA_STRENGTH, float CHROMA_STRENGTH)
{
  	float  lerpfact;
  	float2 texelsize;
  	float3 lutcoord, lutcolor;

  	texelsize    = 1.0 / 64;
  	texelsize.x /= 64;
  	lutcoord     = float3((color.rg * 64 - color.rg + 0.5) * texelsize.xy, color.b * 64 - color.b);
  	lutcoord.y  /= LUT_AMOUNT;
  	lutcoord.y  += (float(LUT_SELECTOR) / LUT_AMOUNT);

  	lerpfact     = frac(lutcoord.z);
  	lutcoord.x  += (lutcoord.z - lerpfact) * texelsize.y;

    lutcolor   = lerp(tex2D(LUT_TEXTURE, lutcoord.xy).rgb, tex2D(LUT_TEXTURE, float2(lutcoord.x + texelsize.y, lutcoord.y)).rgb, lerpfact);

  	color.rgb    = lerp(normalize(color.rgb), normalize(lutcolor.rgb), CHROMA_STRENGTH) * lerp(length(color.rgb), length(lutcolor.rgb), LUMA_STRENGTH);
    return color;
}

float4 FisheyeFunction(float4 color, float2 texcoord, int axis, float zoom, float fe_distort, float fe_cubdistort)
{
  float r2, f;

  if(axis == 0)
  {
    r2 = (texcoord.x-0.5) * (texcoord.x-0.5) + (texcoord.y-0.5) * (texcoord.y-0.5);
  }
  else if (axis == 1)
  {
    r2 = (texcoord.x-0.5) * (texcoord.x-0.5);
  }
  else if (axis == 2)
  {
      r2 = (texcoord.y-0.5) * (texcoord.y-0.5);
  }


  if( fe_cubdistort == 0.0)
  {
      f = 1 + r2 * fe_distort;
  }
  else
  {
      f = 1 + r2 * (fe_distort + fe_cubdistort * sqrt(r2));
  };

  float2 rCoords = (f) * (1.0 / zoom) * (float2(texcoord.x - .5, texcoord.y - .5) * 0.5) + 0.5;

  color.rgb = tex2D(ReShade::BackBuffer, rCoords).rgb;
  color.a = 1.0;

  return color;
}

float4 BoxBlur(float4 color, float2 texcoord, sampler2D BackBuffer, float bluramount)
{
  float4 blurcolor = 0;
  float2 blurmult = ReShade::PixelSize * bluramount;

  float weights[6] = { 1.0, 0.85, 0.7, 0.55, 0.4, 0.25};

  for (float x = -5; x <= 5; x++)
  {
    for (float y = -5; y <= 5; y++)
    {
      float2 offset = float2(x, y);
      float offsetweight = weights[abs(int(x))] * weights[abs(int(y))];
      blurcolor.rgb += tex2D(BackBuffer, texcoord + offset.xy * blurmult).rgb * offsetweight;
      blurcolor.a += offsetweight;
    }
  }

  color = blurcolor.rgb / blurcolor.a;
  return color;
}

// collected from
// http://lolengine.net/blog/2013/07/27/rgb-to-hsv-in-glsl
float3 rgb2hsv(float3 c)
{
    float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    float4 p = lerp(float4(c.bg, K.wz), float4(c.gb, K.xy), step(c.b, c.g));
    float4 q = lerp(float4(p.xyw, c.r), float4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return float3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

float3 hsv2rgb(float3 c)
{
    float4 K = float4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    float3 p = abs(frac(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * lerp(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

float3 hueslider(float3 base, float hue_value)
{
  base.rgb = rgb2hsv(base.rgb);
  base.r   = frac((hue_value  * 0.005) + base.r);
  base.rgb = hsv2rgb(base.rgb);
  return base.rgb;
}

float3 clipCheck(float3 color)
{
	float3 clipped_colors;
	clipped_colors = any(color > saturate(color)) // any colors whiter than white?
		? float3(1.0, 0.0, 0.0)
		: color;
	clipped_colors = all(color > saturate(color)) // all colors whiter than white?
		? float3(1.0, 1.0, 0.0)
		: clipped_colors;
	clipped_colors = any(color < saturate(color)) // any colors blacker than black?
		? float3(0.0, 0.0, 1.0)
		: clipped_colors;
	clipped_colors = all(color < saturate(color)) // all colors blacker than black?
		? float3(0.0, 1.0, 1.0)
		: clipped_colors;
	color = clipped_colors;
  return color;
}

float2 rotateUV(float2 coord, float rotation)
{
  return float2(
    cos(radians(rotation)) * (coord.x - 0.5) + sin(radians(rotation)) * (coord.y - 0.5) + 0.5,
    cos(radians(rotation)) * (coord.y - 0.5) - sin(radians(rotation)) * (coord.x - 0.5) + 0.5);
}


float2 rotateUV2(float2 coord, int rotation)
{
  return float2(
    cos(radians(45*rotation)) * (coord.x - 0.5) + sin(radians(45*rotation)) * (coord.y - 0.5) + 0.5,
    cos(radians(45*rotation)) * (coord.y - 0.5) - sin(radians(45*rotation)) * (coord.x - 0.5) + 0.5);
}

float3 HUEToRGB( in float H )
{
    return saturate( float3( abs( H * 6.0f - 3.0f ) - 1.0f,
                                  2.0f - abs( H * 6.0f - 2.0f ),
                                  2.0f - abs( H * 6.0f - 4.0f )));
}

float3 RGBToHCV(in float3 RGB)
{
    // Based on work by Sam Hocevar and Emil Persson
    float4 P         = (RGB.g < RGB.b ) ? float4(RGB.bg, -1.0f, 2.0f/3.0f) : float4(RGB.gb, 0.0f, -1.0f/3.0f);
    float4 Q1        = (RGB.r < P.x ) ? float4(P.xyw, RGB.r) : float4(RGB.r, P.yzx);
    float C          = Q1.x - min(Q1.w, Q1.y);
    float H          = abs((Q1.w - Q1.y) / (6.0f * C + 0.000001f) + Q1.z);
    return float3(H, C, Q1.x);
}

float3 RGBToHSL(in float3 RGB)
{
    RGB.xyz          = max(RGB.xyz, 0.000001f);
    float3 HCV       = RGBToHCV(RGB);
    float L          = HCV.z - HCV.y * 0.5f;
    float S          = HCV.y / (1.0f - abs(L * 2.0f - 1.0f) + 0.000001f);
    return float3(HCV.x, S, L);
}

float3 HSLToRGB(in float3 HSL)
{
    float3 RGB       = HUEToRGB(HSL.x);
    float C          = (1.0f - abs(2.0f * HSL.z - 1.0f)) * HSL.y;
    return (RGB - 0.5f) * C + HSL.z;
}

// SRGB <--> CIELAB CONVERSIONS
// Reference white D65
#define reference_white     float3(0.95047, 1.0, 1.08883)

// Source
// http://www.brucelindbloom.com/index.html?Eqn_RGB_to_XYZ.html
#define K_val               float(24389.0 / 27.0)
#define E_val               float(216.0 / 24389.0)

float3 pd80_xyz_to_lab(float3 c)
{
    // .xyz output contains .lab
    float3 w       = c / reference_white;
    float3 v;
    v.x            = (w.x >  E_val) ? pow(abs(w.x), 1.0 / 3.0) : (K_val * w.x + 16.0) / 116.0;
    v.y            = (w.y >  E_val) ? pow(abs(w.y), 1.0 / 3.0) : (K_val * w.y + 16.0) / 116.0;
    v.z            = (w.z >  E_val) ? pow(abs(w.z), 1.0 / 3.0) : (K_val * w.z + 16.0) / 116.0;
    return float3(116.0 * v.y - 16.0,
                   500.0 * (v.x - v.y),
                   200.0 * (v.y - v.z));
}

float3 pd80_lab_to_xyz(float3 c)
{
    float3 v;
    v.y            = (c.x + 16.0) / 116.0;
    v.x            = c.y / 500.0 + v.y;
    v.z            = v.y - c.z / 200.0;
    return float3((v.x * v.x * v.x > E_val) ? v.x * v.x * v.x : (116.0 * v.x - 16.0) / K_val,
                  (c.x > K_val * E_val) ? v.y * v.y * v.y : c.x / K_val,
                  (v.z * v.z * v.z > E_val) ? v.z * v.z * v.z : (116.0 * v.z - 16.0) / K_val) *
                  reference_white;
}

float3 pd80_srgb_to_xyz(float3 c)
{
    // Source: http://www.brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html
    // sRGB to XYZ (D65) - Standard sRGB reference white ( 0.95047, 1.0, 1.08883 )
    const float3x3 mat = float3x3(
    0.4124564, 0.3575761, 0.1804375,
    0.2126729, 0.7151522, 0.0721750,
    0.0193339, 0.1191920, 0.9503041
    );
    return mul(mat, c);
}

float3 pd80_xyz_to_srgb(float3 c)
{
    // Source: http://www.brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html
    // XYZ to sRGB (D65) - Standard sRGB reference white ( 0.95047, 1.0, 1.08883 )
    const float3x3 mat = float3x3(
    3.2404542,-1.5371385,-0.4985314,
   -0.9692660, 1.8760108, 0.0415560,
    0.0556434,-0.2040259, 1.0572252
    );
    return mul(mat, c);
}

// Maximum value in LAB, B channel is pure blue with 107.8602... divide by 108 to get 0..1 range values
// Maximum value in LAB, L channel is pure white with 100
float3 pd80_srgb_to_lab(float3 c)
{
    float3 lab = pd80_srgb_to_xyz(c);
    lab        = pd80_xyz_to_lab(lab);
    return lab / float3( 100.0, 108.0, 108.0 );
}

float3 pd80_lab_to_srgb( float3 c )
{
    float3 rgb = pd80_lab_to_xyz(c * float3(100.0, 108.0, 108.0));
    rgb        = pd80_xyz_to_srgb(max(min(rgb, reference_white), 0.0));
    return saturate(rgb);
}
