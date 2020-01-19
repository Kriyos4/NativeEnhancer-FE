//     _   __      __  _            ______      __
//    / | / /___ _/ /_(_)   _____  / ____/___  / /_  ____ _____  ________  _____
//   /  |/ / __ `/ __/ / | / / _ \/ __/ / __ \/ __ \/ __ `/ __ \/ ___/ _ \/ ___/
//  / /|  / /_/ / /_/ /| |/ /  __/ /___/ / / / / / / /_/ / / / / /__/  __/ /
// /_/ |_/\__,_/\__/_/ |___/\___/_____/_/ /_/_/ /_/\__,_/_/ /_/\___/\___/_/
///////////////////////////////////////////////////////////////////////////
// Film Emulation LUT
// Version 2.5 Closed Public Release
///////////////////////////////////////////////////////////////////////////
// Miscellaneous / Passes
///////////////////////////////////////////////////////////////////////////

// NUMBER OF LUT AMOUNT ///////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
#define BNW_LUT_AMOUNT	40
#define INS_LUT_AMOUNT	12
#define NEG_LUT_AMOUNT	54
#define SLI_LUT_AMOUNT	23
#define VIN_LUT_AMOUNT	18

// BLENDING MODES /////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
#define Blend(base, blend, funcf)   float3(funcf(base.r, blend.r), funcf(base.g, blend.g), funcf(base.b, blend.b))
#define BlendScreenf(base, blend)   (1.0 - ((1.0 - base) * (1.0 - blend)))
#define BlendKrautzf(base, blend)   (1.0 - ((1.0 - max(base, blend)) * (1.0 - blend)))
#define BlendScreen(base, blend)    Blend(base, blend, BlendScreenf)
#define BlendKrautz(base, blend)    Blend(base, blend, BlendKrautzf)
#define lumaCoeff                   float3(0.212656, 0.715158, 0.072186)

// FUNCTIONS //////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
#define FILL_CONTROL(base, fill)        pow(abs(base), lerp(10, 1, fill))
#define OPACITY_CONTROL(base, opacity)  lerp(0, base, opacity)
#define ALPHA_BLEND(base, blend)        lerp(base, blend, blend.a)
#define FSATURATION(base, sat)          lerp(dot(base, lumaCoeff), base, sat)

#define NORM_COORD(coord) float2(coord.x, coord.y)
#define FLIP_COORD(coord) float2(1.0-coord.x, coord.y)

// PASSES /////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
float3 RadialBlur(float2 uv, float rad_amount)
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

float2 rotateUV(float2 coord, float rotation)
{
  return float2(
    cos(radians(rotation)) * (coord.x - 0.5) + sin(radians(rotation)) * (coord.y - 0.5) + 0.5,
    cos(radians(rotation)) * (coord.y - 0.5) - sin(radians(rotation)) * (coord.x - 0.5) + 0.5);
}
