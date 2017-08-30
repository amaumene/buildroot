// GLSL shader autogenerated by cg2glsl.py.
#if defined(VERTEX)

#if __VERSION__ >= 130
#define COMPAT_VARYING out
#define COMPAT_ATTRIBUTE in
#define COMPAT_TEXTURE texture
#else
#define COMPAT_VARYING varying
#define COMPAT_ATTRIBUTE attribute
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif
COMPAT_VARYING     vec2 VARpix_no;
COMPAT_VARYING     vec2 VARtex;
struct data {
    vec2 VARtex;
    vec2 VARpix_no;
};
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
};
vec4 _oPosition1;
data _oData1;
input_dummy _IN1;
vec4 _r0009;
COMPAT_ATTRIBUTE vec4 VertexCoord;
COMPAT_ATTRIBUTE vec4 TexCoord;
 
uniform mat4 MVPMatrix;
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    _r0009 = VertexCoord.x*MVPMatrix[0];
    _r0009 = _r0009 + VertexCoord.y*MVPMatrix[1];
    _r0009 = _r0009 + VertexCoord.z*MVPMatrix[2];
    _r0009 = _r0009 + VertexCoord.w*MVPMatrix[3];
    _oPosition1 = _r0009;
    VARtex = TexCoord.xy;
    VARpix_no = TexCoord.xy*TextureSize*(OutputSize/InputSize);
    gl_Position = _r0009;
} 
#elif defined(FRAGMENT)

#if __VERSION__ >= 130
#define COMPAT_VARYING in
#define COMPAT_TEXTURE texture
out vec4 FragColor;
#else
#define COMPAT_VARYING varying
#define FragColor gl_FragColor
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif
COMPAT_VARYING     vec2 VARpix_no;
COMPAT_VARYING     vec2 VARtex;
struct data {
    vec2 VARtex;
    vec2 VARpix_no;
};
struct input_dummy {
    vec2 _video_size;
    vec2 VARtexture_size;
    vec2 _output_dummy_size;
    float _frame_count;
};
vec4 _ret_0;
float _TMP5;
float _TMP4;
float _TMP3;
float _TMP2;
vec4 _TMP0;
input_dummy _IN1;
data _vertex1;
uniform sampler2D Texture;
vec3 _r0018;
float _c0026;
float _a0028;
vec3 _r0038;
 
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    vec3 _yiq;
    float _chroma_phase;
    float _mod_phase;
    float _i_mod;
    float _q_mod;
    _TMP0 = COMPAT_TEXTURE(Texture, VARtex);
    _r0018.x = dot(vec3( 2.98900008E-01, 5.87000012E-01, 1.14000000E-01), _TMP0.xyz);
    _r0018.y = dot(vec3( 5.95899999E-01, -2.74399996E-01, -3.21599990E-01), _TMP0.xyz);
    _r0018.z = dot(vec3( 2.11500004E-01, -5.22899985E-01, 3.11399996E-01), _TMP0.xyz);
    _yiq = _r0018;
    _a0028 = VARpix_no.y/2.00000000E+00;
    _TMP2 = abs(_a0028);
    _TMP3 = fract(_TMP2);
    _TMP4 = abs(2.00000000E+00);
    _c0026 = _TMP3*_TMP4;
    if (VARpix_no.y < 0.00000000E+00) { 
        _TMP5 = -_c0026;
    } else {
        _TMP5 = _c0026;
    } 
    _chroma_phase = 3.14159274E+00*(_TMP5 + float(FrameCount));
    _mod_phase = _chroma_phase + VARpix_no.x*8.37758064E-01;
    _i_mod = cos(_mod_phase);
    _q_mod = sin(_mod_phase);
    _yiq.yz = _r0018.yz*vec2(_i_mod, _q_mod);
    _r0038.x = dot(vec3( 1.00000000E+00, 0.00000000E+00, 0.00000000E+00), _yiq);
    _r0038.y = dot(vec3( 0.00000000E+00, 2.00000000E+00, 0.00000000E+00), _yiq);
    _r0038.z = dot(vec3( 0.00000000E+00, 0.00000000E+00, 2.00000000E+00), _yiq);
    _yiq.yz = _r0038.yz*vec2(_i_mod, _q_mod);
    _ret_0 = vec4(_r0038.x, _yiq.y, _yiq.z, 1.00000000E+00);
    FragColor = _ret_0;
    return;
} 
#endif
