// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:2865,x:32421,y:32620,varname:node_2865,prsc:2|diff-8523-OUT,spec-2571-OUT,gloss-2571-OUT,normal-4598-OUT,lwrap-1238-OUT;n:type:ShaderForge.SFN_Vector1,id:2571,x:32084,y:32714,varname:node_2571,prsc:2,v1:0;n:type:ShaderForge.SFN_Tex2d,id:1596,x:28595,y:32327,ptovrint:False,ptlb:Grass,ptin:_Grass,varname:node_1596,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9b43f68c9ac4c3f42aac19e0f61d6dce,ntxv:0,isnm:False|UVIN-3295-OUT;n:type:ShaderForge.SFN_Multiply,id:9443,x:27749,y:31826,varname:node_9443,prsc:2|A-1719-OUT,B-8177-OUT;n:type:ShaderForge.SFN_Blend,id:2864,x:28838,y:32408,varname:node_2864,prsc:2,blmd:10,clmp:True|SRC-1596-RGB,DST-2401-RGB;n:type:ShaderForge.SFN_Color,id:2401,x:28595,y:32518,ptovrint:False,ptlb:Grass_Y,ptin:_Grass_Y,varname:node_2401,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Tex2d,id:55,x:29610,y:32559,ptovrint:False,ptlb:Mask_Red_Rock,ptin:_Mask_Red_Rock,varname:node_55,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-4080-OUT;n:type:ShaderForge.SFN_Tex2d,id:9782,x:30093,y:33049,ptovrint:False,ptlb:Sand,ptin:_Sand,varname:node_9782,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9520e2a443ad7c848bbf457cd3b24649,ntxv:0,isnm:False|UVIN-9980-OUT;n:type:ShaderForge.SFN_Multiply,id:696,x:27749,y:32089,varname:node_696,prsc:2|A-1719-OUT,B-9986-OUT;n:type:ShaderForge.SFN_Blend,id:8157,x:30376,y:33322,varname:node_8157,prsc:2,blmd:10,clmp:True|SRC-9782-RGB,DST-8487-RGB;n:type:ShaderForge.SFN_Color,id:8487,x:30093,y:33480,ptovrint:False,ptlb:Sand_2,ptin:_Sand_2,varname:node_8487,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Tex2d,id:8381,x:30093,y:33241,ptovrint:False,ptlb:Mask_Snow_Sand,ptin:_Mask_Snow_Sand,varname:node_8381,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-4080-OUT;n:type:ShaderForge.SFN_Tex2d,id:5840,x:29904,y:32699,ptovrint:False,ptlb:Snow,ptin:_Snow,varname:node_5840,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:08b42205c35060e4ab039e72cef680da,ntxv:0,isnm:False|UVIN-4833-OUT;n:type:ShaderForge.SFN_Multiply,id:6348,x:27749,y:32212,varname:node_6348,prsc:2|A-1719-OUT,B-8240-OUT;n:type:ShaderForge.SFN_Color,id:1075,x:29902,y:32885,ptovrint:False,ptlb:Snow_2,ptin:_Snow_2,varname:node_1075,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Blend,id:6628,x:30093,y:32853,varname:node_6628,prsc:2,blmd:10,clmp:True|SRC-5840-RGB,DST-1075-RGB;n:type:ShaderForge.SFN_Tex2d,id:2984,x:28545,y:31781,ptovrint:False,ptlb:Soil,ptin:_Soil,varname:node_2984,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-146-OUT;n:type:ShaderForge.SFN_Multiply,id:2036,x:27749,y:31961,varname:node_2036,prsc:2|A-1719-OUT,B-4065-OUT;n:type:ShaderForge.SFN_Set,id:6704,x:27927,y:31961,varname:Uv_Soil,prsc:2|IN-2036-OUT;n:type:ShaderForge.SFN_Get,id:146,x:28363,y:31781,varname:node_146,prsc:2|IN-6704-OUT;n:type:ShaderForge.SFN_Blend,id:6690,x:28824,y:31843,varname:node_6690,prsc:2,blmd:10,clmp:True|SRC-2984-RGB,DST-3800-RGB;n:type:ShaderForge.SFN_Color,id:3800,x:28545,y:31957,ptovrint:False,ptlb:Soil_2,ptin:_Soil_2,varname:node_3800,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:1711,x:27749,y:32336,varname:node_1711,prsc:2|A-1719-OUT,B-7668-OUT;n:type:ShaderForge.SFN_Lerp,id:1251,x:30344,y:32272,varname:node_1251,prsc:2|A-7250-OUT,B-4013-OUT,T-55-A;n:type:ShaderForge.SFN_Lerp,id:6788,x:29189,y:31813,varname:node_6788,prsc:2|A-2984-RGB,B-6690-OUT,T-3700-G;n:type:ShaderForge.SFN_Lerp,id:8196,x:30666,y:33177,varname:node_8196,prsc:2|A-9782-RGB,B-8157-OUT,T-8381-G;n:type:ShaderForge.SFN_Set,id:7655,x:27927,y:31826,varname:Uv_Grass,prsc:2|IN-9443-OUT;n:type:ShaderForge.SFN_Get,id:3295,x:28348,y:32350,varname:node_3295,prsc:2|IN-7655-OUT;n:type:ShaderForge.SFN_Set,id:4906,x:27927,y:32089,varname:Uv_Sand,prsc:2|IN-696-OUT;n:type:ShaderForge.SFN_Get,id:9980,x:29902,y:33049,varname:node_9980,prsc:2|IN-4906-OUT;n:type:ShaderForge.SFN_Lerp,id:1937,x:30561,y:32871,varname:node_1937,prsc:2|A-5840-RGB,B-6628-OUT,T-8381-R;n:type:ShaderForge.SFN_Lerp,id:5583,x:30811,y:32972,varname:node_5583,prsc:2|A-9883-OUT,B-1937-OUT,T-8381-A;n:type:ShaderForge.SFN_Set,id:4712,x:27927,y:32336,varname:Uv_Red,prsc:2|IN-1711-OUT;n:type:ShaderForge.SFN_Get,id:7537,x:29203,y:32440,varname:node_7537,prsc:2|IN-4712-OUT;n:type:ShaderForge.SFN_Set,id:7300,x:27927,y:32212,varname:Uv_Sonw,prsc:2|IN-6348-OUT;n:type:ShaderForge.SFN_Get,id:4833,x:29580,y:32763,varname:node_4833,prsc:2|IN-7300-OUT;n:type:ShaderForge.SFN_Tex2d,id:3700,x:28437,y:32162,ptovrint:False,ptlb:Mask_Grass_Soil,ptin:_Mask_Grass_Soil,varname:node_3700,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-3214-OUT;n:type:ShaderForge.SFN_Lerp,id:4013,x:29865,y:32285,varname:node_4013,prsc:2|A-7805-OUT,B-2195-RGB,T-55-R;n:type:ShaderForge.SFN_Lerp,id:6542,x:29459,y:31972,varname:node_6542,prsc:2|A-9388-OUT,B-6788-OUT,T-3700-B;n:type:ShaderForge.SFN_Lerp,id:9388,x:29148,y:32257,varname:node_9388,prsc:2|A-2864-OUT,B-1596-RGB,T-3700-R;n:type:ShaderForge.SFN_Lerp,id:7250,x:29700,y:32162,varname:node_7250,prsc:2|A-6542-OUT,B-9388-OUT,T-3700-A;n:type:ShaderForge.SFN_Lerp,id:8699,x:31016,y:32997,varname:node_8699,prsc:2|A-5583-OUT,B-8196-OUT,T-8381-B;n:type:ShaderForge.SFN_Tex2d,id:2195,x:29397,y:32440,ptovrint:False,ptlb:RedRock,ptin:_RedRock,varname:node_2195,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-7537-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:11,x:28300,y:31129,varname:node_11,prsc:2;n:type:ShaderForge.SFN_ObjectPosition,id:9064,x:28327,y:31301,varname:node_9064,prsc:2;n:type:ShaderForge.SFN_Subtract,id:8250,x:28544,y:31274,varname:node_8250,prsc:2|A-11-XYZ,B-9064-XYZ;n:type:ShaderForge.SFN_ComponentMask,id:4011,x:28752,y:31274,varname:node_4011,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-8250-OUT;n:type:ShaderForge.SFN_Subtract,id:8520,x:29008,y:31274,varname:node_8520,prsc:2|A-4011-OUT,B-2628-OUT;n:type:ShaderForge.SFN_Divide,id:8492,x:29263,y:31265,varname:node_8492,prsc:2|A-8520-OUT,B-7577-OUT;n:type:ShaderForge.SFN_Slider,id:7577,x:29106,y:31412,ptovrint:False,ptlb:Blend Intensity,ptin:_BlendIntensity,varname:node_7577,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:1,max:20;n:type:ShaderForge.SFN_Clamp01,id:4485,x:29735,y:31267,varname:node_4485,prsc:2|IN-2191-OUT;n:type:ShaderForge.SFN_Set,id:2450,x:29181,y:31010,varname:WorldUv,prsc:2|IN-3771-OUT;n:type:ShaderForge.SFN_Append,id:5198,x:28543,y:31010,varname:node_5198,prsc:2|A-11-X,B-11-Z;n:type:ShaderForge.SFN_Divide,id:3771,x:29008,y:31010,varname:node_3771,prsc:2|A-7275-OUT,B-8955-OUT;n:type:ShaderForge.SFN_Subtract,id:7275,x:28752,y:31010,varname:node_7275,prsc:2|A-5198-OUT,B-604-OUT;n:type:ShaderForge.SFN_Vector1,id:8955,x:29008,y:31140,varname:node_8955,prsc:2,v1:2900;n:type:ShaderForge.SFN_Get,id:1719,x:27460,y:31935,varname:node_1719,prsc:2|IN-2450-OUT;n:type:ShaderForge.SFN_Vector2,id:604,x:28752,y:31140,varname:node_604,prsc:2,v1:2700,v2:-200;n:type:ShaderForge.SFN_Vector1,id:1238,x:32084,y:32776,varname:node_1238,prsc:2,v1:1;n:type:ShaderForge.SFN_Lerp,id:9883,x:30561,y:32700,varname:node_9883,prsc:2|A-1251-OUT,B-6094-OUT,T-55-G;n:type:ShaderForge.SFN_Blend,id:6094,x:30338,y:32572,varname:node_6094,prsc:2,blmd:10,clmp:True|SRC-2195-RGB,DST-2006-RGB;n:type:ShaderForge.SFN_Color,id:2006,x:29865,y:32435,ptovrint:False,ptlb:RedRock2,ptin:_RedRock2,varname:node_2006,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Set,id:4336,x:29935,y:31267,varname:ModelMask,prsc:2|IN-4485-OUT;n:type:ShaderForge.SFN_Relay,id:7805,x:29046,y:32388,varname:node_7805,prsc:2|IN-2984-RGB;n:type:ShaderForge.SFN_Get,id:3214,x:28132,y:32172,varname:node_3214,prsc:2|IN-2450-OUT;n:type:ShaderForge.SFN_Relay,id:8408,x:28309,y:33236,varname:node_8408,prsc:2|IN-3214-OUT;n:type:ShaderForge.SFN_Relay,id:4080,x:29406,y:33245,varname:node_4080,prsc:2|IN-8408-OUT;n:type:ShaderForge.SFN_Tex2d,id:5646,x:31441,y:32442,ptovrint:False,ptlb:Base color,ptin:_Basecolor,varname:node_293,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:8523,x:31877,y:32435,varname:node_8523,prsc:2|A-8699-OUT,B-5646-RGB,T-6907-OUT;n:type:ShaderForge.SFN_Get,id:6907,x:31668,y:32626,varname:node_6907,prsc:2|IN-4336-OUT;n:type:ShaderForge.SFN_Lerp,id:5988,x:31842,y:32930,varname:node_5988,prsc:2|A-7575-OUT,B-2918-RGB,T-6466-OUT;n:type:ShaderForge.SFN_Tex2d,id:2918,x:31496,y:32942,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:node_2918,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Vector3,id:7575,x:31558,y:32795,varname:node_7575,prsc:2,v1:0,v2:0,v3:1;n:type:ShaderForge.SFN_Slider,id:6466,x:31339,y:33130,ptovrint:False,ptlb:Normal Intensity,ptin:_NormalIntensity,varname:node_6466,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3,max:3;n:type:ShaderForge.SFN_Lerp,id:4598,x:32084,y:32861,varname:node_4598,prsc:2|A-7575-OUT,B-5988-OUT,T-6907-OUT;n:type:ShaderForge.SFN_Set,id:4045,x:31681,y:33088,varname:Normal_Green,prsc:2|IN-2918-G;n:type:ShaderForge.SFN_Get,id:1096,x:29242,y:31480,varname:node_1096,prsc:2|IN-4045-OUT;n:type:ShaderForge.SFN_Lerp,id:2191,x:29512,y:31267,varname:node_2191,prsc:2|A-8492-OUT,B-9322-OUT,T-1096-OUT;n:type:ShaderForge.SFN_Vector1,id:9322,x:29481,y:31454,varname:node_9322,prsc:2,v1:0;n:type:ShaderForge.SFN_Slider,id:2628,x:28607,y:31443,ptovrint:False,ptlb:Blend Height,ptin:_BlendHeight,varname:node_2628,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:0.01,max:1;n:type:ShaderForge.SFN_Vector1,id:8177,x:27487,y:31746,varname:node_8177,prsc:2,v1:65;n:type:ShaderForge.SFN_Vector1,id:9986,x:27481,y:32105,varname:node_9986,prsc:2,v1:60;n:type:ShaderForge.SFN_Vector1,id:8240,x:27481,y:32183,varname:node_8240,prsc:2,v1:65;n:type:ShaderForge.SFN_Vector1,id:7668,x:27481,y:32270,varname:node_7668,prsc:2,v1:85;n:type:ShaderForge.SFN_Vector1,id:4065,x:27481,y:32035,varname:node_4065,prsc:2,v1:50;proporder:1596-9782-2984-5840-2195-2401-8487-1075-3800-2006-55-8381-3700-5646-2628-7577-2918-6466;pass:END;sub:END;*/

Shader "Shader Forge/Shader_0915_Terrain" {
    Properties {
        _Grass ("Grass", 2D) = "white" {}
        _Sand ("Sand", 2D) = "white" {}
        _Soil ("Soil", 2D) = "white" {}
        _Snow ("Snow", 2D) = "white" {}
        _RedRock ("RedRock", 2D) = "white" {}
        _Grass_Y ("Grass_Y", Color) = (0.5,0.5,0.5,1)
        _Sand_2 ("Sand_2", Color) = (0.5,0.5,0.5,1)
        _Snow_2 ("Snow_2", Color) = (0.5,0.5,0.5,1)
        _Soil_2 ("Soil_2", Color) = (0.5,0.5,0.5,1)
        _RedRock2 ("RedRock2", Color) = (0.5,0.5,0.5,1)
        _Mask_Red_Rock ("Mask_Red_Rock", 2D) = "white" {}
        _Mask_Snow_Sand ("Mask_Snow_Sand", 2D) = "white" {}
        _Mask_Grass_Soil ("Mask_Grass_Soil", 2D) = "white" {}
        _Basecolor ("Base color", 2D) = "white" {}
        _BlendHeight ("Blend Height", Range(0.01, 1)) = 0.01
        _BlendIntensity ("Blend Intensity", Range(0.01, 20)) = 1
        _Normal ("Normal", 2D) = "bump" {}
        _NormalIntensity ("Normal Intensity", Range(0, 3)) = 0.3
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform sampler2D _Grass; uniform float4 _Grass_ST;
            uniform sampler2D _Mask_Red_Rock; uniform float4 _Mask_Red_Rock_ST;
            uniform sampler2D _Sand; uniform float4 _Sand_ST;
            uniform sampler2D _Mask_Snow_Sand; uniform float4 _Mask_Snow_Sand_ST;
            uniform sampler2D _Snow; uniform float4 _Snow_ST;
            uniform sampler2D _Soil; uniform float4 _Soil_ST;
            uniform sampler2D _Mask_Grass_Soil; uniform float4 _Mask_Grass_Soil_ST;
            uniform sampler2D _RedRock; uniform float4 _RedRock_ST;
            uniform sampler2D _Basecolor; uniform float4 _Basecolor_ST;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _Grass_Y)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Sand_2)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Snow_2)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Soil_2)
                UNITY_DEFINE_INSTANCED_PROP( float, _BlendIntensity)
                UNITY_DEFINE_INSTANCED_PROP( float4, _RedRock2)
                UNITY_DEFINE_INSTANCED_PROP( float, _NormalIntensity)
                UNITY_DEFINE_INSTANCED_PROP( float, _BlendHeight)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD10;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                //UNITY_SETUP_INSTANCE_ID( v );
                //UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #elif UNITY_SHOULD_SAMPLE_SH
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 node_7575 = float3(0,0,1);
                float3 _Normal_var = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(i.uv0, _Normal)));
                float _NormalIntensity_var = UNITY_ACCESS_INSTANCED_PROP( Props, _NormalIntensity );
                float _BlendHeight_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BlendHeight );
                float _BlendIntensity_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BlendIntensity );
                float Normal_Green = _Normal_var.g;
                float ModelMask = saturate(lerp((((i.posWorld.rgb-objPos.rgb).g-_BlendHeight_var)/_BlendIntensity_var),0.0,Normal_Green));
                float node_6907 = ModelMask;
                float3 normalLocal = lerp(node_7575,lerp(node_7575,_Normal_var.rgb,_NormalIntensity_var),node_6907);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float node_2571 = 0.0;
                float gloss = node_2571;
                float specPow = exp2( gloss * 10.0 + 1.0 );
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
                #if UNITY_SPECCUBE_BLENDING || UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMin[0] = unity_SpecCube0_BoxMin;
                    d.boxMin[1] = unity_SpecCube1_BoxMin;
                #endif
                #if UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMax[0] = unity_SpecCube0_BoxMax;
                    d.boxMax[1] = unity_SpecCube1_BoxMax;
                    d.probePosition[0] = unity_SpecCube0_ProbePosition;
                    d.probePosition[1] = unity_SpecCube1_ProbePosition;
                #endif
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float3 specularColor = float3(node_2571,node_2571,node_2571);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 indirectSpecular = (gi.indirect.specular)*specularColor;
                float3 specular = (directSpecular + indirectSpecular);
/////// Diffuse:
                NdotL = dot( normalDirection, lightDirection );
                float node_1238 = 1.0;
                float3 w = float3(node_1238,node_1238,node_1238)*0.5; // Light wrapping
                float3 NdotLWrap = NdotL * ( 1.0 - w );
                float3 forwardLight = max(float3(0.0,0.0,0.0), NdotLWrap + w );
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = forwardLight * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                float2 WorldUv = ((float2(i.posWorld.r,i.posWorld.b)-float2(2700,-200))/2900.0);
                float2 node_1719 = WorldUv;
                float2 Uv_Grass = (node_1719*65.0);
                float2 node_3295 = Uv_Grass;
                float4 _Grass_var = tex2D(_Grass,TRANSFORM_TEX(node_3295, _Grass));
                float4 _Grass_Y_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Grass_Y );
                float2 node_3214 = WorldUv;
                float4 _Mask_Grass_Soil_var = tex2D(_Mask_Grass_Soil,TRANSFORM_TEX(node_3214, _Mask_Grass_Soil));
                float3 node_9388 = lerp(saturate(( _Grass_Y_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Grass_Y_var.rgb-0.5))*(1.0-_Grass_var.rgb)) : (2.0*_Grass_Y_var.rgb*_Grass_var.rgb) )),_Grass_var.rgb,_Mask_Grass_Soil_var.r);
                float2 Uv_Soil = (node_1719*50.0);
                float2 node_146 = Uv_Soil;
                float4 _Soil_var = tex2D(_Soil,TRANSFORM_TEX(node_146, _Soil));
                float4 _Soil_2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Soil_2 );
                float2 Uv_Red = (node_1719*85.0);
                float2 node_7537 = Uv_Red;
                float4 _RedRock_var = tex2D(_RedRock,TRANSFORM_TEX(node_7537, _RedRock));
                float2 node_4080 = node_3214;
                float4 _Mask_Red_Rock_var = tex2D(_Mask_Red_Rock,TRANSFORM_TEX(node_4080, _Mask_Red_Rock));
                float4 _RedRock2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _RedRock2 );
                float2 Uv_Sonw = (node_1719*65.0);
                float2 node_4833 = Uv_Sonw;
                float4 _Snow_var = tex2D(_Snow,TRANSFORM_TEX(node_4833, _Snow));
                float4 _Snow_2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Snow_2 );
                float4 _Mask_Snow_Sand_var = tex2D(_Mask_Snow_Sand,TRANSFORM_TEX(node_4080, _Mask_Snow_Sand));
                float2 Uv_Sand = (node_1719*60.0);
                float2 node_9980 = Uv_Sand;
                float4 _Sand_var = tex2D(_Sand,TRANSFORM_TEX(node_9980, _Sand));
                float4 _Sand_2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Sand_2 );
                float4 _Basecolor_var = tex2D(_Basecolor,TRANSFORM_TEX(i.uv0, _Basecolor));
                float3 diffuseColor = lerp(lerp(lerp(lerp(lerp(lerp(lerp(node_9388,lerp(_Soil_var.rgb,saturate(( _Soil_2_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Soil_2_var.rgb-0.5))*(1.0-_Soil_var.rgb)) : (2.0*_Soil_2_var.rgb*_Soil_var.rgb) )),_Mask_Grass_Soil_var.g),_Mask_Grass_Soil_var.b),node_9388,_Mask_Grass_Soil_var.a),lerp(_Soil_var.rgb,_RedRock_var.rgb,_Mask_Red_Rock_var.r),_Mask_Red_Rock_var.a),saturate(( _RedRock2_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_RedRock2_var.rgb-0.5))*(1.0-_RedRock_var.rgb)) : (2.0*_RedRock2_var.rgb*_RedRock_var.rgb) )),_Mask_Red_Rock_var.g),lerp(_Snow_var.rgb,saturate(( _Snow_2_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Snow_2_var.rgb-0.5))*(1.0-_Snow_var.rgb)) : (2.0*_Snow_2_var.rgb*_Snow_var.rgb) )),_Mask_Snow_Sand_var.r),_Mask_Snow_Sand_var.a),lerp(_Sand_var.rgb,saturate(( _Sand_2_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Sand_2_var.rgb-0.5))*(1.0-_Sand_var.rgb)) : (2.0*_Sand_2_var.rgb*_Sand_var.rgb) )),_Mask_Snow_Sand_var.g),_Mask_Snow_Sand_var.b),_Basecolor_var.rgb,node_6907);
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform sampler2D _Grass; uniform float4 _Grass_ST;
            uniform sampler2D _Mask_Red_Rock; uniform float4 _Mask_Red_Rock_ST;
            uniform sampler2D _Sand; uniform float4 _Sand_ST;
            uniform sampler2D _Mask_Snow_Sand; uniform float4 _Mask_Snow_Sand_ST;
            uniform sampler2D _Snow; uniform float4 _Snow_ST;
            uniform sampler2D _Soil; uniform float4 _Soil_ST;
            uniform sampler2D _Mask_Grass_Soil; uniform float4 _Mask_Grass_Soil_ST;
            uniform sampler2D _RedRock; uniform float4 _RedRock_ST;
            uniform sampler2D _Basecolor; uniform float4 _Basecolor_ST;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _Grass_Y)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Sand_2)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Snow_2)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Soil_2)
                UNITY_DEFINE_INSTANCED_PROP( float, _BlendIntensity)
                UNITY_DEFINE_INSTANCED_PROP( float4, _RedRock2)
                UNITY_DEFINE_INSTANCED_PROP( float, _NormalIntensity)
                UNITY_DEFINE_INSTANCED_PROP( float, _BlendHeight)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                //UNITY_SETUP_INSTANCE_ID( v );
                //UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 node_7575 = float3(0,0,1);
                float3 _Normal_var = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(i.uv0, _Normal)));
                float _NormalIntensity_var = UNITY_ACCESS_INSTANCED_PROP( Props, _NormalIntensity );
                float _BlendHeight_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BlendHeight );
                float _BlendIntensity_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BlendIntensity );
                float Normal_Green = _Normal_var.g;
                float ModelMask = saturate(lerp((((i.posWorld.rgb-objPos.rgb).g-_BlendHeight_var)/_BlendIntensity_var),0.0,Normal_Green));
                float node_6907 = ModelMask;
                float3 normalLocal = lerp(node_7575,lerp(node_7575,_Normal_var.rgb,_NormalIntensity_var),node_6907);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float node_2571 = 0.0;
                float gloss = node_2571;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float3 specularColor = float3(node_2571,node_2571,node_2571);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = dot( normalDirection, lightDirection );
                float node_1238 = 1.0;
                float3 w = float3(node_1238,node_1238,node_1238)*0.5; // Light wrapping
                float3 NdotLWrap = NdotL * ( 1.0 - w );
                float3 forwardLight = max(float3(0.0,0.0,0.0), NdotLWrap + w );
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = forwardLight * attenColor;
                float2 WorldUv = ((float2(i.posWorld.r,i.posWorld.b)-float2(2700,-200))/2900.0);
                float2 node_1719 = WorldUv;
                float2 Uv_Grass = (node_1719*65.0);
                float2 node_3295 = Uv_Grass;
                float4 _Grass_var = tex2D(_Grass,TRANSFORM_TEX(node_3295, _Grass));
                float4 _Grass_Y_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Grass_Y );
                float2 node_3214 = WorldUv;
                float4 _Mask_Grass_Soil_var = tex2D(_Mask_Grass_Soil,TRANSFORM_TEX(node_3214, _Mask_Grass_Soil));
                float3 node_9388 = lerp(saturate(( _Grass_Y_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Grass_Y_var.rgb-0.5))*(1.0-_Grass_var.rgb)) : (2.0*_Grass_Y_var.rgb*_Grass_var.rgb) )),_Grass_var.rgb,_Mask_Grass_Soil_var.r);
                float2 Uv_Soil = (node_1719*50.0);
                float2 node_146 = Uv_Soil;
                float4 _Soil_var = tex2D(_Soil,TRANSFORM_TEX(node_146, _Soil));
                float4 _Soil_2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Soil_2 );
                float2 Uv_Red = (node_1719*85.0);
                float2 node_7537 = Uv_Red;
                float4 _RedRock_var = tex2D(_RedRock,TRANSFORM_TEX(node_7537, _RedRock));
                float2 node_4080 = node_3214;
                float4 _Mask_Red_Rock_var = tex2D(_Mask_Red_Rock,TRANSFORM_TEX(node_4080, _Mask_Red_Rock));
                float4 _RedRock2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _RedRock2 );
                float2 Uv_Sonw = (node_1719*65.0);
                float2 node_4833 = Uv_Sonw;
                float4 _Snow_var = tex2D(_Snow,TRANSFORM_TEX(node_4833, _Snow));
                float4 _Snow_2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Snow_2 );
                float4 _Mask_Snow_Sand_var = tex2D(_Mask_Snow_Sand,TRANSFORM_TEX(node_4080, _Mask_Snow_Sand));
                float2 Uv_Sand = (node_1719*60.0);
                float2 node_9980 = Uv_Sand;
                float4 _Sand_var = tex2D(_Sand,TRANSFORM_TEX(node_9980, _Sand));
                float4 _Sand_2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Sand_2 );
                float4 _Basecolor_var = tex2D(_Basecolor,TRANSFORM_TEX(i.uv0, _Basecolor));
                float3 diffuseColor = lerp(lerp(lerp(lerp(lerp(lerp(lerp(node_9388,lerp(_Soil_var.rgb,saturate(( _Soil_2_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Soil_2_var.rgb-0.5))*(1.0-_Soil_var.rgb)) : (2.0*_Soil_2_var.rgb*_Soil_var.rgb) )),_Mask_Grass_Soil_var.g),_Mask_Grass_Soil_var.b),node_9388,_Mask_Grass_Soil_var.a),lerp(_Soil_var.rgb,_RedRock_var.rgb,_Mask_Red_Rock_var.r),_Mask_Red_Rock_var.a),saturate(( _RedRock2_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_RedRock2_var.rgb-0.5))*(1.0-_RedRock_var.rgb)) : (2.0*_RedRock2_var.rgb*_RedRock_var.rgb) )),_Mask_Red_Rock_var.g),lerp(_Snow_var.rgb,saturate(( _Snow_2_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Snow_2_var.rgb-0.5))*(1.0-_Snow_var.rgb)) : (2.0*_Snow_2_var.rgb*_Snow_var.rgb) )),_Mask_Snow_Sand_var.r),_Mask_Snow_Sand_var.a),lerp(_Sand_var.rgb,saturate(( _Sand_2_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Sand_2_var.rgb-0.5))*(1.0-_Sand_var.rgb)) : (2.0*_Sand_2_var.rgb*_Sand_var.rgb) )),_Mask_Snow_Sand_var.g),_Mask_Snow_Sand_var.b),_Basecolor_var.rgb,node_6907);
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "Meta"
            Tags {
                "LightMode"="Meta"
            }
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_META 1
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform sampler2D _Grass; uniform float4 _Grass_ST;
            uniform sampler2D _Mask_Red_Rock; uniform float4 _Mask_Red_Rock_ST;
            uniform sampler2D _Sand; uniform float4 _Sand_ST;
            uniform sampler2D _Mask_Snow_Sand; uniform float4 _Mask_Snow_Sand_ST;
            uniform sampler2D _Snow; uniform float4 _Snow_ST;
            uniform sampler2D _Soil; uniform float4 _Soil_ST;
            uniform sampler2D _Mask_Grass_Soil; uniform float4 _Mask_Grass_Soil_ST;
            uniform sampler2D _RedRock; uniform float4 _RedRock_ST;
            uniform sampler2D _Basecolor; uniform float4 _Basecolor_ST;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _Grass_Y)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Sand_2)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Snow_2)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Soil_2)
                UNITY_DEFINE_INSTANCED_PROP( float, _BlendIntensity)
                UNITY_DEFINE_INSTANCED_PROP( float4, _RedRock2)
                UNITY_DEFINE_INSTANCED_PROP( float, _BlendHeight)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                //UNITY_SETUP_INSTANCE_ID( v );
                //UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                UNITY_SETUP_INSTANCE_ID( i );
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                o.Emission = 0;
                
                float2 WorldUv = ((float2(i.posWorld.r,i.posWorld.b)-float2(2700,-200))/2900.0);
                float2 node_1719 = WorldUv;
                float2 Uv_Grass = (node_1719*65.0);
                float2 node_3295 = Uv_Grass;
                float4 _Grass_var = tex2D(_Grass,TRANSFORM_TEX(node_3295, _Grass));
                float4 _Grass_Y_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Grass_Y );
                float2 node_3214 = WorldUv;
                float4 _Mask_Grass_Soil_var = tex2D(_Mask_Grass_Soil,TRANSFORM_TEX(node_3214, _Mask_Grass_Soil));
                float3 node_9388 = lerp(saturate(( _Grass_Y_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Grass_Y_var.rgb-0.5))*(1.0-_Grass_var.rgb)) : (2.0*_Grass_Y_var.rgb*_Grass_var.rgb) )),_Grass_var.rgb,_Mask_Grass_Soil_var.r);
                float2 Uv_Soil = (node_1719*50.0);
                float2 node_146 = Uv_Soil;
                float4 _Soil_var = tex2D(_Soil,TRANSFORM_TEX(node_146, _Soil));
                float4 _Soil_2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Soil_2 );
                float2 Uv_Red = (node_1719*85.0);
                float2 node_7537 = Uv_Red;
                float4 _RedRock_var = tex2D(_RedRock,TRANSFORM_TEX(node_7537, _RedRock));
                float2 node_4080 = node_3214;
                float4 _Mask_Red_Rock_var = tex2D(_Mask_Red_Rock,TRANSFORM_TEX(node_4080, _Mask_Red_Rock));
                float4 _RedRock2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _RedRock2 );
                float2 Uv_Sonw = (node_1719*65.0);
                float2 node_4833 = Uv_Sonw;
                float4 _Snow_var = tex2D(_Snow,TRANSFORM_TEX(node_4833, _Snow));
                float4 _Snow_2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Snow_2 );
                float4 _Mask_Snow_Sand_var = tex2D(_Mask_Snow_Sand,TRANSFORM_TEX(node_4080, _Mask_Snow_Sand));
                float2 Uv_Sand = (node_1719*60.0);
                float2 node_9980 = Uv_Sand;
                float4 _Sand_var = tex2D(_Sand,TRANSFORM_TEX(node_9980, _Sand));
                float4 _Sand_2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Sand_2 );
                float4 _Basecolor_var = tex2D(_Basecolor,TRANSFORM_TEX(i.uv0, _Basecolor));
                float _BlendHeight_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BlendHeight );
                float _BlendIntensity_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BlendIntensity );
                float3 _Normal_var = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(i.uv0, _Normal)));
                float Normal_Green = _Normal_var.g;
                float ModelMask = saturate(lerp((((i.posWorld.rgb-objPos.rgb).g-_BlendHeight_var)/_BlendIntensity_var),0.0,Normal_Green));
                float node_6907 = ModelMask;
                float3 diffColor = lerp(lerp(lerp(lerp(lerp(lerp(lerp(node_9388,lerp(_Soil_var.rgb,saturate(( _Soil_2_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Soil_2_var.rgb-0.5))*(1.0-_Soil_var.rgb)) : (2.0*_Soil_2_var.rgb*_Soil_var.rgb) )),_Mask_Grass_Soil_var.g),_Mask_Grass_Soil_var.b),node_9388,_Mask_Grass_Soil_var.a),lerp(_Soil_var.rgb,_RedRock_var.rgb,_Mask_Red_Rock_var.r),_Mask_Red_Rock_var.a),saturate(( _RedRock2_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_RedRock2_var.rgb-0.5))*(1.0-_RedRock_var.rgb)) : (2.0*_RedRock2_var.rgb*_RedRock_var.rgb) )),_Mask_Red_Rock_var.g),lerp(_Snow_var.rgb,saturate(( _Snow_2_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Snow_2_var.rgb-0.5))*(1.0-_Snow_var.rgb)) : (2.0*_Snow_2_var.rgb*_Snow_var.rgb) )),_Mask_Snow_Sand_var.r),_Mask_Snow_Sand_var.a),lerp(_Sand_var.rgb,saturate(( _Sand_2_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Sand_2_var.rgb-0.5))*(1.0-_Sand_var.rgb)) : (2.0*_Sand_2_var.rgb*_Sand_var.rgb) )),_Mask_Snow_Sand_var.g),_Mask_Snow_Sand_var.b),_Basecolor_var.rgb,node_6907);
                float node_2571 = 0.0;
                float3 specColor = float3(node_2571,node_2571,node_2571);
                float roughness = 1.0 - node_2571;
                o.Albedo = diffColor + specColor * roughness * roughness * 0.5;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
