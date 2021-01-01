/*         __                __
//    ____/ /___ ___  ____ _/ /___________
//   / __  / __ `__ \/ __ `/ //_/ ___/ __ \
//  / /_/ / / / / / / /_/ / ,< / /  / /_/ /
//  \__,_/_/ /_/ /_/\__,_/_/|_/_/   \____/
//
//  yet another ReShade UI macro function
//  by dddfault
//
/////////////////////////////////////////////
//  How to use :
//  include this file in your shader file
//  make sure it is on top of everything
//  by adding #include "dMakro.fxh"
//
//  Variable Types :
//  D_INT  = Integer
//  D_BOOL  = Boolean
//  D_FLOAT  = float
//  D_FLOAT2 = float2
//  D_FLOAT3 = float3
//  D_COLOR  = Color
//  D_SPC  = Special functions
//
//  UI Widget Types :
//  S   = Slider (any float and integer variables)
//  I   = Input  (any float and integer variables)
//  D   = Drag   (any float and integer variables)
//  R   = Radio  (only integer variables)
//  C   = Combo  (only integer variables)
//  L   = List   (only integer variables)
//
//  Feature :
//  K   = Categorized
//  S   = Simplified
//        (no tooltip and using default step value
//        - useful for self explanatory variables)
//
//
//
//  Cheat Sheet -
//  Boolean
//    D_BOOL(variable, label, tooltip, defvalue)
//  Boolean Categorized
//    D_BOOL_K(variable, category, label, tooltip, defvalue)
//  Boolean Simplified
//    D_BOOL_S(variable, category, label, tooltip, defvalue)
//
//  Color
//    D_COLOR(variable, label, tooltip, defrvalue, defgvalue, defbvalue)
//  Color Categorized
//    D_COLOR_K(variable, category, label, tooltip, defrvalue, defgvalue, defbvalue)
//  Color Simplified
//    D_COLOR_S(variable, category, label, defrvalue, defgvalue, defbvalue)
//
//  Integer Slider
//    D_INT_S(variable, label, tooltip, minvalue, maxvalue, defvalue)
//  Integer Input
//    D_INT_I(variable, label, tooltip, minvalue, maxvalue, defvalue)
//  Integer Drag
//    D_INT_D(variable, label, tooltip, minvalue, maxvalue, defvalue)
//  Integer Radio
//    D_INT_R(variable, label, tooltip, items, minvalue, maxvalue, defvalue)
//  Integer Combo
//    D_INT_C(variable, label, tooltip, items, minvalue, maxvalue, defvalue)
//  Integer List
//    D_INT_L(variable, label, tooltip, items, minvalue, maxvalue, defvalue)
//  Integer Slider Categorized
//    D_INT_SK(variable, category, label, tooltip, minvalue, maxvalue, defvalue)
//  Integer Input Categorized
//    D_INT_IK(variable, category, label, tooltip, minvalue, maxvalue, defvalue)
//  Integer Drag Categorized
//    D_INT_DK(variable, category, label, tooltip, minvalue, maxvalue, defvalue)
//  Integer Radio Categorized
//    D_INT_RK(variable, category, label, tooltip, items, minvalue, maxvalue, defvalue)
//  Integer Combo Categorized
//    D_INT_CK(variable, category, label, tooltip, items, minvalue, maxvalue, defvalue)
//  Integer List Categorized
//    D_INT_LK(variable, category, label, tooltip, items, minvalue, maxvalue, defvalue)
//  Integer Slider Simplified
//    D_INT_SS(variable, category, label, minvalue, maxvalue, defvalue)
//  Integer Input Simplified
//    D_INT_IS(variable, category, label, minvalue, maxvalue, defvalue)
//  Integer Drag Simplified
//    D_INT_DS(variable, category, label, minvalue, maxvalue, defvalue)
//  Integer Radio Simplified
//    D_INT_RS(variable, category, label, items, minvalue, maxvalue, defvalue)
//  Integer Combo Simplified
//    D_INT_CS(variable, category, label, items, minvalue, maxvalue, defvalue)
//  Integer List Simplified
//    D_INT_LS(variable, category, label, items, minvalue, maxvalue, defvalue)
//
//  Float Slider
//    D_FLOAT_S(variable, label, tooltip, stepvalue, minvalue, maxvalue, defvalue)
//  Float Input
//    D_FLOAT_I(variable, label, tooltip, stepvalue, minvalue, maxvalue, defvalue)
//  Float Drag
//    D_FLOAT_D(variable, label, tooltip, stepvalue, minvalue, maxvalue, defvalue)
//  Float Slider Categorized
//    D_FLOAT_SK(variable, category, label, tooltip, stepvalue, minvalue, maxvalue, defvalue)
//  Float Input Categorized
//    D_FLOAT_IK(variable, category, label, tooltip, stepvalue, minvalue, maxvalue, defvalue)
//  Float Drag Categorized
//    D_FLOAT_DK(variable, category, label, tooltip, stepvalue, minvalue, maxvalue, defvalue)
//  Float Slider Simplified
//    D_FLOAT_SS(variable, category, label, minvalue, maxvalue, defvalue)
//  Float Input Simplified
//    D_FLOAT_IS(variable, category, label, minvalue, maxvalue, defvalue)
//  Float Drag Simplified
//    D_FLOAT_DS(variable, category, label, minvalue, maxvalue, defvalue)
//
//  Float2 Slider
//    D_FLOAT2_S(variable, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey)
//  Float2 Input
//    D_FLOAT2_I(variable, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey)
//  Float2 Drag
//    D_FLOAT2_D(variable, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey)
//  Float2 Slider Categorized
//    D_FLOAT2_SK(variable, category, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey)
//  Float2 Input Categorized
//    D_FLOAT2_IK(variable, category, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey)
//  Float2 Drag Categorized
//    D_FLOAT2_DK(variable, category, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey)
//  Float2 Slider Simplified
//    D_FLOAT2_SS(variable, category, label, minvalue, maxvalue, defvaluex, defvaluey)
//  Float2 Input Simplified
//    D_FLOAT2_IS(variable, category, label, minvalue, maxvalue, defvaluex, defvaluey)
//  Float2 Drag Simplified
//    D_FLOAT2_DS(variable, category, label, minvalue, maxvalue, defvaluex, defvaluey)
//
//  Float3 Slider
//    D_FLOAT3_S(variable, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey, defvaluez)
//  Float3 Input
//    D_FLOAT3_I(variable, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey, defvaluez)
//  Float3 Drag
//    D_FLOAT3_D(variable, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey, defvaluez)
//  Float3 Slider Categorized
//    D_FLOAT3_SK(variable, category, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey, defvaluez)
//  Float3 Input Categorized
//    D_FLOAT3_IK(variable, category, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey, defvaluez)
//  Float3 Drag Categorized
//    D_FLOAT3_DK(variable, category, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey, defvaluez)
//  Float3 Slider Simplified
//    D_FLOAT3_SS(variable, category, label, minvalue, maxvalue, defvaluex, defvaluey, defvaluez)
//  Float3 Input Simplified
//    D_FLOAT3_IS(variable, category, label, minvalue, maxvalue, defvaluex, defvaluey, defvaluez)
//  Float3 Drag Simplified
//    D_FLOAT3_DS(variable, category, label, minvalue, maxvalue, defvaluex, defvaluey, defvaluez)
//
//  Text Categorized
//    D_SPC_TK(variables, category, text)
//  Text Simplified
//    D_SPC_TS(variables, text)
//  Category Collapser
//    D_SPC_CC(variable, category)
//
//  Sampler
//    D_SAM(samplrname, textrname)
//  Sampler with boundary option
//    D_SAM_A(samplername, texturename, bound)
//  Texture
//    D_TEX(texname, texsource)
//  Texture with custom dimension size
//    D_TEX_A(texname, texsource, texwidth, texheight)
//  Technique and passes
//    D_TEQ(techniquename, tooltip, passes)
//    PASS(vertexshader, pixelshader)
//
//
*/



// FLOAT ///////////////////////////////////////////////////////////////////////
#define DAS_F(nama, tipe, lbel, ttip, step, minx, maxx, defx) \
    uniform float nama \
    < \
      ui_type    = tipe; \
      ui_label   = lbel; \
      ui_tooltip = ttip; \
      ui_step    = step; \
      ui_min     = minx; \
      ui_max     = maxx; \
    >            = defx;

#define DAS_FK(nama, tipe, kate, lbel, ttip, step, minx, maxx, defx) \
    uniform float nama \
    < \
      ui_type            = tipe; \
      ui_category        = kate; \
      ui_label           = lbel; \
      ui_tooltip         = ttip; \
      ui_step            = step; \
      ui_min             = minx; \
      ui_max             = maxx; \
    >                    = defx;

#define DAS_FS(nama, tipe, kate, lbel, minx, maxx, defx) \
    uniform float nama \
    < \
      ui_type            = tipe; \
      ui_category        = kate; \
      ui_label           = lbel; \
      ui_min             = minx; \
      ui_max             = maxx; \
    >                    = defx;

// FLOAT2 //////////////////////////////////////////////////////////////////////
#define DAS_F2(nama, tipe, lbel, ttip, step, minx, maxx, defx, defy) \
    uniform float2 nama \
    < \
      ui_type    = tipe; \
      ui_label   = lbel; \
      ui_tooltip = ttip; \
      ui_step    = step; \
      ui_min     = minx; \
      ui_max     = maxx; \
    >            = float2(defx, defy);

#define DAS_F2K(nama, tipe, kate, lbel, ttip, step, minx, maxx, defx, defy) \
    uniform float2 nama \
    < \
      ui_type            = tipe; \
      ui_category        = kate; \
      ui_label           = lbel; \
      ui_tooltip         = ttip; \
      ui_step            = step; \
      ui_min             = minx; \
      ui_max             = maxx; \
    >                  = float2(defx, defy);

#define DAS_F2S(nama, tipe, kate, lbel, minx, maxx, defx, defy) \
    uniform float2 nama \
    < \
      ui_type            = tipe; \
      ui_category        = kate; \
      ui_label           = lbel; \
      ui_min             = minx; \
      ui_max             = maxx; \
    >                  = float2(defx, defy);

// FLOAT3 //////////////////////////////////////////////////////////////////////
#define DAS_F3(nama, tipe, lbel, ttip, step, minx, maxx, defx, defy, defz) \
    uniform float3 nama \
    < \
      ui_type    = tipe; \
      ui_label   = lbel; \
      ui_tooltip = ttip; \
      ui_step    = step; \
      ui_min     = minx; \
      ui_max     = maxx; \
    >            = float3(defx, defy, defz);

#define DAS_F3K(nama, tipe, kate, lbel, ttip, step, minx, maxx, defx, defy, defz) \
    uniform float3 nama \
    < \
      ui_type            = tipe; \
      ui_category        = kate; \
      ui_label           = lbel; \
      ui_tooltip         = ttip; \
      ui_step            = step; \
      ui_min             = minx; \
      ui_max             = maxx; \
    >                    = float3(defx, defy, defz);

#define DAS_F3S(nama, tipe, kate, lbel, minx, maxx, defx, defy, defz) \
    uniform float3 nama \
    < \
      ui_type            = tipe; \
      ui_category        = kate; \
      ui_label           = lbel; \
      ui_min             = minx; \
      ui_max             = maxx; \
    >                    = float3(defx, defy, defz);

// INTEGER /////////////////////////////////////////////////////////////////////
#define DAS_I(nama, tipe, lbel, ttip, minx, maxx, defx) \
    uniform int nama \
    < \
      ui_type    = tipe; \
      ui_label   = lbel; \
      ui_tooltip = ttip; \
      ui_min     = minx; \
      ui_max     = maxx; \
    >            = defx;

#define DAS_IK(nama, tipe, kate, lbel, ttip, minx, maxx, defx) \
    uniform int nama \
    < \
      ui_type            = tipe; \
      ui_category        = kate; \
      ui_label           = lbel; \
      ui_tooltip         = ttip; \
      ui_min             = minx; \
      ui_max             = maxx; \
    >                    = defx;

#define DAS_IS(nama, tipe, kate, lbel, minx, maxx, defx) \
    uniform int nama \
    < \
      ui_type            = tipe; \
      ui_category        = kate; \
      ui_label           = lbel; \
      ui_min             = minx; \
      ui_max             = maxx; \
    >                    = defx;

#define DAS_IX(nama, tipe, lbel, ttip, item, minx, maxx, defx) \
    uniform int nama \
    < \
      ui_type    = tipe; \
      ui_label   = lbel; \
      ui_tooltip = ttip; \
      ui_items   = item; \
      ui_min     = minx; \
      ui_max     = maxx; \
    >            = defx;

#define DAS_IXK(nama, tipe, kate, lbel, ttip, item, minx, maxx, defx) \
    uniform int nama \
    < \
      ui_type            = tipe; \
      ui_category        = kate; \
      ui_label           = lbel; \
      ui_tooltip         = ttip; \
      ui_items           = item; \
      ui_min             = minx; \
      ui_max             = maxx; \
    >                    = defx;

#define DAS_IXS(nama, tipe, kate, lbel, item, minx, maxx, defx) \
    uniform int nama \
    < \
      ui_type            = tipe; \
      ui_category        = kate; \
      ui_label           = lbel; \
      ui_items           = item; \
      ui_min             = minx; \
      ui_max             = maxx; \
    >                    = defx;

// BOOELAN /////////////////////////////////////////////////////////////////////
#define DAS_B(nama, lbel, ttip, defx) \
    uniform bool nama \
    < \
      ui_label   = lbel; \
      ui_tooltip = ttip; \
    >            = bool(defx);

#define DAS_BK(nama, kate, lbel, ttip, defx) \
    uniform bool nama \
    < \
      ui_category        = kate; \
      ui_label           = lbel; \
      ui_tooltip         = ttip; \
    >                    = bool(defx);

#define DAS_BS(nama, kate, lbel, defx) \
    uniform bool nama \
    < \
      ui_category        = kate; \
      ui_label           = lbel; \
    >                    = bool(defx);

// OTHERS //////////////////////////////////////////////////////////////////////
#define DAS_C(nama, lbel, ttip, defx, defy, defz) \
    uniform float3 nama \
    < \
      ui_type    = "color"; \
      ui_label   = lbel; \
      ui_tooltip = ttip; \
    >            = float3(defx, defy, defz);

#define DAS_CK(nama, kate, lbel, ttip, defx, defy, defz) \
    uniform float3 nama \
    < \
      ui_type            = "color"; \
      ui_category        = kate; \
      ui_label           = lbel; \
      ui_tooltip         = ttip; \
    >                    = float3(defx, defy, defz);

#define DAS_CS(nama, kate, lbel, defx, defy, defz) \
    uniform float3 nama \
    < \
      ui_type            = "color"; \
      ui_category        = kate; \
      ui_label           = lbel; \\
    >                    = float3(defx, defy, defz);

#define DAS_TK(nama, kate, teks) \
    uniform int nama \
    < \
      ui_type            = "radio"; \
      ui_label           = " "; \
      ui_category        = kate; \
      ui_text            = teks; \
    >                    = 0;

#define DAS_TS(nama, teks) \
    uniform int nama \
    < \
      ui_type            = "radio"; \
      ui_label           = " "; \
      ui_text            = teks; \
    >                    = 0;

#define DAS_CC(nama, kate) \
    uniform int nama \
    < \
      ui_type            = "radio"; \
      ui_category        = kate; \
      ui_category_closed = true; \
      ui_label           = " "; \
    >                    = 0;

// SAMPLERS TEXTURES TECHNIQUES PASSES /////////////////////////////////////////
#define DAS_SM(nama, turs, addU, addV, addW, magf, minf, mipf, srgb) \
    sampler nama \
    { \
        Texture     = turs; \
        AddressU    = addU; \
        AddressV    = addV; \
        AddressW    = addW; \
        MagFilter   = magf; \
        MinFilter   = minf; \
        MipFilter   = mipf; \
        SRGBTexture = srgb; \
    };

#define DAS_TX(nama, sumb, widt, heig, form) \
    texture nama < source = sumb; > \
    { \
        Width  = widt; \
        Height = heig; \
        Format = form; \
    };

#define DAS_TXB(nama, widt, heig, form, mipm) \
    texture nama \
    { \
        Width  = widt; \
        Height = heig; \
        Format = form; \
        MipLevels = mipm; \
    };

#define DAS_TQ(nama, teks, pass) \
    technique nama < ui_tooltip = teks; > \
    { \
        pass \
    }

#define PASS(vert, pixe) pass \
    { \
        VertexShader = vert; \
        PixelShader  = pixe; \
    }

#define PASSA(vert, pixe, rdn1) pass \
    { \
        VertexShader = vert; \
        PixelShader  = pixe; \
        RenderTarget = rdn1; \
    }


/*
// All those magic happened here
*/

// Boolean macros
#define D_BOOL(variable, label, tooltip, defvalue) \
  DAS_B(variable, label, tooltip, defvalue)

#define D_BOOL_K(variable, category, label, tooltip, defvalue) \
  DAS_BK(variable, category, label, tooltip, defvalue)

#define D_BOOL_S(variable, category, label, tooltip, defvalue) \
  DAS_BK(variable, category, label, tooltip, defvalue)

// Color macros
#define D_COLOR(variable, label, tooltip, defrvalue, defgvalue, defbvalue) \
  DAS_C(variable, label, tooltip, defrvalue, defgvalue, defbvalue)

#define D_COLOR_K(variable, category, label, tooltip, defrvalue, defgvalue, defbvalue) \
  DAS_CK(variable, category, label, tooltip, defrvalue, defgvalue, defbvalue)

#define D_COLOR_S(variable, category, label, defrvalue, defgvalue, defbvalue) \
  DAS_CS(variable, category, label, defrvalue, defgvalue, defbvalue)

// Integer macros
#define D_INT_S(variable, label, tooltip, minvalue, maxvalue, defvalue) \
  DAS_I(variable, "slider", label, tooltip, minvalue, maxvalue, defvalue)

#define D_INT_I(variable, label, tooltip, minvalue, maxvalue, defvalue) \
  DAS_I(variable, "input", label, tooltip, minvalue, maxvalue, defvalue)

#define D_INT_D(variable, label, tooltip, minvalue, maxvalue, defvalue) \
  DAS_I(variable, "drag", label, tooltip, minvalue, maxvalue, defvalue)

#define D_INT_R(variable, label, tooltip, items, minvalue, maxvalue, defvalue) \
  DAS_IX(variable, "radio", label, tooltip, items, minvalue, maxvalue, defvalue)

#define D_INT_C(variable, label, tooltip, items, minvalue, maxvalue, defvalue) \
  DAS_IX(variable, "combo", label, tooltip, items, minvalue, maxvalue, defvalue)

#define D_INT_L(variable, label, tooltip, items, minvalue, maxvalue, defvalue) \
  DAS_IX(variable, "list", label, tooltip, items, minvalue, maxvalue, defvalue)

#define D_INT_SK(variable, category, label, tooltip, minvalue, maxvalue, defvalue) \
  DAS_IK(variable, "slider", category, label, tooltip, minvalue, maxvalue, defvalue)

#define D_INT_IK(variable, category, label, tooltip, minvalue, maxvalue, defvalue) \
  DAS_IK(variable, "input", category, label, tooltip, minvalue, maxvalue, defvalue)

#define D_INT_DK(variable, category, label, tooltip, minvalue, maxvalue, defvalue) \
  DAS_IK(variable, "drag", category, label, tooltip, minvalue, maxvalue, defvalue)

#define D_INT_RK(variable, category, label, tooltip, items, minvalue, maxvalue, defvalue) \
  DAS_IXK(variable, "radio", category, label, tooltip, items, minvalue, maxvalue, defvalue)

#define D_INT_CK(variable, category, label, tooltip, items, minvalue, maxvalue, defvalue) \
  DAS_IXK(variable, "combo", category, label, tooltip, items, minvalue, maxvalue, defvalue)

#define D_INT_LK(variable, category, label, tooltip, items, minvalue, maxvalue, defvalue) \
  DAS_IXK(variable, "list", category, label, tooltip, items, minvalue, maxvalue, defvalue)

#define D_INT_SS(variable, category, label, minvalue, maxvalue, defvalue) \
  DAS_IS(variable, "slider", category, label, minvalue, maxvalue, defvalue)

#define D_INT_IS(variable, category, label, minvalue, maxvalue, defvalue) \
  DAS_IS(variable, "input", category, label, minvalue, maxvalue, defvalue)

#define D_INT_DS(variable, category, label, minvalue, maxvalue, defvalue) \
  DAS_IS(variable, "drag", category, label, minvalue, maxvalue, defvalue)

#define D_INT_RS(variable, category, label, items, minvalue, maxvalue, defvalue) \
  DAS_IXS(variable, "radio", category, label, items, minvalue, maxvalue, defvalue)

#define D_INT_CS(variable, category, label, items, minvalue, maxvalue, defvalue) \
  DAS_IXS(variable, "combo", category, label, items, minvalue, maxvalue, defvalue)

#define D_INT_LS(variable, category, label, items, minvalue, maxvalue, defvalue) \
  DAS_IXS(variable, "list", category, label, items, minvalue, maxvalue, defvalue)

// Float macros
#define D_FLOAT_S(variable, label, tooltip, stepvalue, minvalue, maxvalue, defvalue) \
  DAS_F(variable, "slider", label, tooltip, stepvalue, minvalue, maxvalue, defvalue)

#define D_FLOAT_I(variable, label, tooltip, stepvalue, minvalue, maxvalue, defvalue) \
  DAS_F(variable, "input", label, tooltip, stepvalue, minvalue, maxvalue, defvalue)

#define D_FLOAT_D(variable, label, tooltip, stepvalue, minvalue, maxvalue, defvalue) \
  DAS_F(variable, "drag", label, tooltip, stepvalue, minvalue, maxvalue, defvalue)

#define D_FLOAT_SK(variable, category, label, tooltip, stepvalue, minvalue, maxvalue, defvalue) \
  DAS_FK(variable, "slider", category, label, tooltip, stepvalue, minvalue, maxvalue, defvalue)

#define D_FLOAT_IK(variable, category, label, tooltip, stepvalue, minvalue, maxvalue, defvalue) \
  DAS_FK(variable, "input", category, label, tooltip, stepvalue, minvalue, maxvalue, defvalue)

#define D_FLOAT_DK(variable, category, label, tooltip, stepvalue, minvalue, maxvalue, defvalue) \
  DAS_FK(variable, "drag", category, label, tooltip, stepvalue, minvalue, maxvalue, defvalue)

#define D_FLOAT_SS(variable, category, label, minvalue, maxvalue, defvalue) \
  DAS_FS(variable, "slider", category, label, minvalue, maxvalue, defvalue)

#define D_FLOAT_IS(variable, category, label, minvalue, maxvalue, defvalue) \
  DAS_FS(variable, "input", category, label, minvalue, maxvalue, defvalue)

#define D_FLOAT_DS(variable, category, label, minvalue, maxvalue, defvalue) \
  DAS_FS(variable, "drag", category, label, minvalue, maxvalue, defvalue)

// Float 2 macros
#define D_FLOAT2_S(variable, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey) \
  DAS_F2(variable, "slider", label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey)

#define D_FLOAT2_I(variable, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey) \
  DAS_F2(variable, "input", label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey)

#define D_FLOAT2_D(variable, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey) \
  DAS_F2(variable, "drag", label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey)

#define D_FLOAT2_SK(variable, category, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey) \
  DAS_F2K(variable, "slider", category, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey)

#define D_FLOAT2_IK(variable, category, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey) \
  DAS_F2K(variable, "input", category, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey)

#define D_FLOAT2_DK(variable, category, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey) \
  DAS_F2K(variable, "drag", category, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey)

#define D_FLOAT2_SS(variable, category, label, minvalue, maxvalue, defvaluex, defvaluey) \
  DAS_F2S(variable, "slider", category, label, minvalue, maxvalue, defvaluex, defvaluey)

#define D_FLOAT2_IS(variable, category, label, minvalue, maxvalue, defvaluex, defvaluey) \
  DAS_F2S(variable, "input", category, label, minvalue, maxvalue, defvaluex, defvaluey)

#define D_FLOAT2_DS(variable, category, label, minvalue, maxvalue, defvaluex, defvaluey) \
  DAS_F2S(variable, "drag", category, label, minvalue, maxvalue, defvaluex, defvaluey)

// float 3 macros
#define D_FLOAT3_S(variable, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey, defvaluez) \
  DAS_F3(variable, "slider", label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey, defvaluez)

#define D_FLOAT3_I(variable, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey, defvaluez) \
  DAS_F3(variable, "input", label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey, defvaluez)

#define D_FLOAT3_D(variable, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey, defvaluez) \
  DAS_F3(variable, "drag", label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey, defvaluez)

#define D_FLOAT3_SK(variable, category, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey, defvaluez) \
  DAS_F3K(variable, "slider", category, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey, defvaluez)

#define D_FLOAT3_IK(variable, category, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey, defvaluez) \
  DAS_F3K(variable, "input", category, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey, defvaluez)

#define D_FLOAT3_DK(variable, category, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey, defvaluez) \
  DAS_F3K(variable, "drag", category, label, tooltip, stepvalue, minvalue, maxvalue, defvaluex, defvaluey, defvaluez)

#define D_FLOAT3_SS(variable, category, label, minvalue, maxvalue, defvaluex, defvaluey, defvaluez) \
  DAS_F3S(variable, "slider", category, label, minvalue, maxvalue, defvaluex, defvaluey, defvaluez)

#define D_FLOAT3_IS(variable, category, label, minvalue, maxvalue, defvaluex, defvaluey, defvaluez) \
  DAS_F3S(variable, "input", category, label, minvalue, maxvalue, defvaluex, defvaluey, defvaluez)

#define D_FLOAT3_DS(variable, category, label, minvalue, maxvalue, defvaluex, defvaluey, defvaluez) \
  DAS_F3S(variable, "drag", category, label, minvalue, maxvalue, defvaluex, defvaluey, defvaluez)

// Others
#define D_SPC_TK(variables, category, text) \
  DAS_TK(variables, category, text)

#define D_SPC_TS(variables, text) \
  DAS_TS(variables, text)

#define D_SPC_CC(variable, category) \
  DAS_CC(variable, category)

#define D_SAM(samplername, texturename) \
  DAS_SM(samplername, texturename, CLAMP, CLAMP, CLAMP, LINEAR, LINEAR, LINEAR, false)

#define D_SAM_A(samplername, texturename, bound) \
  DAS_SM(samplername, texturename, bound, bound, bound, LINEAR, LINEAR, LINEAR, false)

#define D_TEX(texname, texsource) \
  DAS_TX(texname, texsource, BUFFER_WIDTH, BUFFER_HEIGHT, RGBA8)

#define D_TEX_A(texname, texsource, texwidth, texheight) \
  DAS_TX(texname, texsource, texwidth, texheight, RGBA8)

#define D_TEX_B(texname, texwidth, texheight, miplevs) \
  DAS_TXB(texname, texwidth, texheight, RGBA8, miplevs)

#define D_TEQ(techniquename, tooltip, passes) \
  DAS_TQ(techniquename, tooltip, passes)
