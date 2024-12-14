#define PI 3.141569

sampler2D Tex0 : register(s0);
sampler2D Tex1 : register(s1);

float radius;
float angle;
float centerX;
float centerY;
bool overlay;

float4 ps_main(in float2 texCoord : TEXCOORD0) : COLOR0
{
    float4 Out;
    float2 output;
    float2 center = float2(centerX,centerY);

    float2 uv = texCoord.xy - center;

    float len = length(uv);
    float _angle = atan2(uv.y,uv.x)+ (angle*PI) * smoothstep(radius,0.0,len);
    float _radius = length(uv);

    output = float2(_radius*cos(_angle),_radius*sin(_angle))+center;

    Out = overlay ? tex2D(Tex1,output) : tex2D(Tex0,output);
    return Out;
}

technique tech_main { pass P0 { PixelShader  = compile ps_2_0 ps_main(); }}