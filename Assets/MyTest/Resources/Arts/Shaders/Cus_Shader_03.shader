// Unity built-in shader source. Copyright (c) 2016 Unity Technologies. MIT license (see license.txt)

// Simplified Diffuse shader. Differences from regular Diffuse one:
// - no Main Color
// - fully supports only 1 directional light. Other lights can affect it, but it will be per-vertex/SH.

Shader "changeColor3" {
    Properties {
        _Diffuse ("Diffuse", 2D) = "white" {}
        _ChageColorMask ("Chage Color Mask", 2D) = "white" {}
        _color ("color", Color) = (1,1,1,1)
        _DiffuseBrightness ("Diffuse Brightness", Range(0.5, 1.5)) = 1
        _Contrast ("Contrast", Range(1, 1.5)) = 1
        _Saturation ("Saturation", Range(1, 1.5)) = 1
        _Gray_Brightness ("Gray_Brightness", Range(0, 3)) = 1
    }
    SubShader {
        Tags { "RenderType"="Opaque" }
        LOD 150
        Pass {
            CGPROGRAM
            //#pragma surface surf Lambert noforwardadd
            #pragma vertex vert
            #pragma fragment frag
            #pragma target 2.0
            #pragma multi_compile_fog

            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            struct appdata_t {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord : TEXCOORD0;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };
            struct v2f {
                float4 vertex : SV_POSITION; 
                float2 texcoord : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                UNITY_FOG_COORDS(5)
                UNITY_VERTEX_OUTPUT_STEREO

            };
            sampler2D _Diffuse;
            sampler2D _ChageColorMask;
            fixed4 _color;
            float _Contrast;//曝光
            float _Gray_Brightness;//mask 图缩放
            float _DiffuseBrightness;//灰度
            float _Saturation;
            struct Input {
                float2 uv_Diffuse;
            };

            float3 desaturate(float3 a,float  saturate)
            {
                return lerp(a,dot(a, float3(0.3,0.59,0.11)),1.0 -saturate);
            }

            
            v2f vert (appdata_t v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.texcoord =v.texcoord;// TRANSFORM_TEX(v.texcoord, _Diffuse);
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                UNITY_TRANSFER_FOG(o,o.vertex);
                //TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag (v2f i) : SV_Target
            {
                i.normalDir = normalize(i.normalDir);
                //float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                //float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 normalDirection = i.normalDir;

                // UnityLight light;
                // float3 lightColor = _LightColor0.rgb;
                // light.color = lightColor;
                // light.dir = lightDirection;
                // light.ndotl = LambertTerm (normalDirection, light.dir);
                
                // UnityGIInput d;
                // d.light = light;
                // d.worldPos = i.posWorld.xyz;
                // d.worldViewDir = viewDirection;
                // d.atten = attenuation;

                // Unity_GlossyEnvironmentData ugls_en_data;
                // ugls_en_data.roughness = 1.0 - gloss;
                // ugls_en_data.reflUVW = viewReflectDirection;
                // UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                //float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                
                fixed4 c = tex2D(_Diffuse, i.texcoord) ;
                
              
                fixed mix  =tex2D(_ChageColorMask, i.texcoord).r;
                float3 a =c.rgb;//左值
                a=pow(a,_Contrast); // 挂1
                a=a*_DiffuseBrightness; // 挂2
                a=desaturate(a,_Saturation); //挂3

                //右值
                float3 b =  a*_color.rgb *_Gray_Brightness;
                
                c.rgb = lerp(a,b,mix);
                
                //直接光照
                float3 directLight =   _LightColor0.rgb*max(0.0,dot( normalDirection, lightDirection ))  ;
                float3 ambientLight = UNITY_LIGHTMODEL_AMBIENT.rgb;
                fixed4 finalRGBA = fixed4(c.rgb * (directLight + ambientLight),1);
                
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }

            ENDCG
        }
    }
    Fallback "Mobile/VertexLit"
}
