// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ASE_Water_Shader"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_Normal("Normal", 2D) = "bump" {}
		_NoramlIntensity("Noraml Intensity", Range( 0 , 5)) = 1
		_Uv_1_Tiling("Uv_1_Tiling", Range( 0 , 10)) = 1
		_Uv_2_Tiling("Uv_2_Tiling", Range( 0 , 10)) = 1
		_NoramlSpeed_2("NoramlSpeed_2", Range( 0 , 1)) = 1
		_NoramlSpeed_1("NoramlSpeed_1", Range( 0 , 1)) = 1
		_SpecularRoughness("Specular Roughness", Range( 0 , 20)) = 1
		_SpecualrScope("Specualr Scope", Range( 0 , 1)) = 1
		_Specularbrightness("Specular brightness", Range( 0.2 , 2)) = 1
		_WaterColor("Water Color", Color) = (0,0,0,0)
		_Frecolor("Fre color", Color) = (0,0,0,0)
		_DepthDistance("Depth Distance", Range( 0 , 20)) = 0
		_FreColorScope("Fre Color Scope", Range( 0 , 20)) = 0
		_WaterDarkColor("Water Dark Color", Range( 0 , 1)) = 0
		_refractionintnesity("refraction intnesity", Range( 0 , 0.01)) = 0.16
		_AoScope("Ao Scope", Range( 0 , 10)) = 0
		_EdgeScope("Edge Scope", Range( 0 , 1)) = 0
		_EdgeBrightness("Edge Brightness", Range( 0 , 1)) = 0
		_EdgeOpacity("Edge Opacity", Range( 0 , 1)) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "AlphaTest+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Off
		GrabPass{ }
		CGPROGRAM
		#include "UnityPBSLighting.cginc"
		#include "UnityStandardUtils.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#pragma target 5.0
		#if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex);
		#else
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex)
		#endif
		#pragma surface surf StandardCustomLighting keepalpha noshadow 
		#pragma skip_variants SHADOWS_SHADOWMASK LIGHTMAP_SHADOW_MIXING SHADOWS_DEPTH SHADOWS_CUBE VERTEXLIGHT_ON LIGHTPROBE_SH POINT POINT_COOKIE
		struct Input
		{
			float4 screenPos;
			float2 uv_texcoord;
			float3 worldPos;
			float3 worldNormal;
		};

		struct SurfaceOutputCustomLightingCustom
		{
			half3 Albedo;
			half3 Normal;
			half3 Emission;
			half Metallic;
			half Smoothness;
			half Occlusion;
			half Alpha;
			Input SurfInput;
			UnityGIInput GIData;
		};

		ASE_DECLARE_SCREENSPACE_TEXTURE( _GrabTexture )
		uniform sampler2D _Normal;
		uniform float _NoramlSpeed_1;
		uniform float _Uv_1_Tiling;
		uniform float _NoramlSpeed_2;
		uniform float _Uv_2_Tiling;
		uniform float _NoramlIntensity;
		uniform float _refractionintnesity;
		UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
		uniform float4 _CameraDepthTexture_TexelSize;
		uniform float _AoScope;
		uniform float _WaterDarkColor;
		uniform float4 _WaterColor;
		uniform float _Specularbrightness;
		uniform float _SpecularRoughness;
		uniform float _SpecualrScope;
		uniform float4 _Frecolor;
		uniform float _FreColorScope;
		uniform float _DepthDistance;
		uniform float _EdgeBrightness;
		uniform float _EdgeScope;
		uniform float _EdgeOpacity;
		uniform float _Cutoff = 0.5;

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float temp_output_73_0 = 1.0;
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float2 temp_cast_2 = (_Uv_1_Tiling).xx;
			float2 uv_TexCoord11 = i.uv_texcoord * temp_cast_2;
			float2 panner12 = ( ( _Time.y * _NoramlSpeed_1 ) * float2( 0.025,-0.0142 ) + uv_TexCoord11);
			float2 temp_cast_3 = (_Uv_2_Tiling).xx;
			float2 uv_TexCoord8 = i.uv_texcoord * temp_cast_3;
			float2 panner14 = ( ( _Time.y * _NoramlSpeed_2 ) * float2( 0.212,-0.142 ) + uv_TexCoord8);
			float3 normalizeResult18 = normalize( BlendNormals( UnpackNormal( tex2D( _Normal, panner12 ) ) , UnpackNormal( tex2D( _Normal, panner14 ) ) ) );
			float3 lerpResult20 = lerp( float3(0,0,1) , normalizeResult18 , _NoramlIntensity);
			float3 Normal25 = lerpResult20;
			float4 screenColor57 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_GrabTexture,( ase_screenPosNorm + float4( ( Normal25 * _refractionintnesity ) , 0.0 ) ).xy);
			float screenDepth40 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
			float distanceDepth40 = abs( ( screenDepth40 - LinearEyeDepth( ase_screenPosNorm.z ) ) / ( _AoScope ) );
			float clampResult55 = clamp( ( 1.0 - distanceDepth40 ) , 0.0 , 1.0 );
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float temp_output_21_0 = (lerpResult20).y;
			float clampResult27 = clamp( temp_output_21_0 , 0.0 , 1.0 );
			float4 lerpResult42 = lerp( ( _WaterDarkColor * _WaterColor ) , _WaterColor , clampResult27);
			float4 temp_cast_6 = (_Specularbrightness).xxxx;
			float clampResult38 = clamp( ( pow( temp_output_21_0 , _SpecularRoughness ) * _SpecualrScope ) , 0.0 , 1.0 );
			float4 lerpResult48 = lerp( lerpResult42 , temp_cast_6 , clampResult38);
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = i.worldNormal;
			float fresnelNdotV47 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode47 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV47, _FreColorScope ) );
			float4 lerpResult54 = lerp( lerpResult48 , _Frecolor , fresnelNode47);
			float screenDepth52 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
			float distanceDepth52 = abs( ( screenDepth52 - LinearEyeDepth( ase_screenPosNorm.z ) ) / ( _DepthDistance ) );
			float clampResult61 = clamp( distanceDepth52 , 0.0 , 1.0 );
			float4 lerpResult67 = lerp( ( screenColor57 * clampResult55 ) , ( ase_lightColor * lerpResult54 ) , clampResult61);
			float screenDepth56 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
			float distanceDepth56 = abs( ( screenDepth56 - LinearEyeDepth( ase_screenPosNorm.z ) ) / ( _EdgeScope ) );
			float clampResult68 = clamp( ( ( 1.0 - distanceDepth56 ) - pow( (lerpResult20).x , _EdgeOpacity ) ) , 0.0 , 1.0 );
			float4 lerpResult71 = lerp( lerpResult67 , ( ase_lightColor * _EdgeBrightness ) , clampResult68);
			c.rgb = lerpResult71.rgb;
			c.a = temp_output_73_0;
			clip( temp_output_73_0 - _Cutoff );
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
			float temp_output_72_0 = 0.0;
			float3 temp_cast_0 = (temp_output_72_0).xxx;
			o.Albedo = temp_cast_0;
			float3 temp_cast_1 = (temp_output_72_0).xxx;
			o.Emission = temp_cast_1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
2560;714.6667;1920;1019;6399.326;1621.39;3.649895;True;False
Node;AmplifyShaderEditor.CommentaryNode;1;-5631.345,-32.81541;Inherit;False;3043.086;1003.802;Normal;28;53;38;31;29;27;26;25;23;21;20;19;18;17;16;15;14;13;12;11;10;9;8;7;6;5;4;3;2;;0,0.1707103,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-5549.345,33.1846;Inherit;False;Property;_Uv_1_Tiling;Uv_1_Tiling;3;0;Create;True;0;0;0;False;0;False;1;7;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2;-5558.854,529.2665;Inherit;False;Property;_Uv_2_Tiling;Uv_2_Tiling;4;0;Create;True;0;0;0;False;0;False;1;5;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3;-5312.345,285.1845;Inherit;False;Property;_NoramlSpeed_1;NoramlSpeed_1;6;0;Create;True;0;0;0;False;0;False;1;0.03;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TimeNode;6;-5457.345,681.1846;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TimeNode;7;-5467.345,132.1846;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;4;-5303.345,836.1849;Inherit;False;Property;_NoramlSpeed_2;NoramlSpeed_2;5;0;Create;True;0;0;0;False;0;False;1;0.03;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-5183.345,157.1846;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;8;-5261.345,561.1847;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-5195.345,725.1848;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;11;-5277.345,17.1846;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;12;-4837.345,127.1846;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0.025,-0.0142;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;13;-4895.086,278.7476;Inherit;True;Property;_Normal;Normal;1;0;Create;True;0;0;0;False;0;False;01d4fe3b608abe64083211f5691184b5;01d4fe3b608abe64083211f5691184b5;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.PannerNode;14;-4821.345,510.1847;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0.212,-0.142;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;15;-4554.345,495.1844;Inherit;True;Property;_TextureSample0;Texture Sample 0;2;0;Create;True;0;0;0;False;0;False;-1;01d4fe3b608abe64083211f5691184b5;01d4fe3b608abe64083211f5691184b5;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;16;-4570.345,223.1846;Inherit;True;Property;_Water_Texture_normal;Water_Texture_normal;2;0;Create;True;0;0;0;False;0;False;-1;01d4fe3b608abe64083211f5691184b5;01d4fe3b608abe64083211f5691184b5;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BlendNormalsNode;17;-4215.345,285.1845;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;18;-3995.847,287.7344;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;81;-3972.387,116.7929;Inherit;False;Constant;_Vector0;Vector 0;21;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;19;-3989.439,405.1765;Inherit;False;Property;_NoramlIntensity;Noraml Intensity;2;0;Create;True;0;0;0;False;0;False;1;2;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;20;-3742.93,257.5424;Inherit;False;3;0;FLOAT3;0,0,1;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;21;-3524.145,243.244;Inherit;False;False;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;22;-3497.032,-1411.468;Inherit;False;2127.765;1347.898;Water color;28;67;63;61;60;57;55;54;52;51;50;49;48;47;46;45;42;41;40;39;37;36;35;34;33;32;30;28;24;;0,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;23;-3180.075,360.0894;Inherit;False;Property;_SpecularRoughness;Specular Roughness;7;0;Create;True;0;0;0;False;0;False;1;20;0;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;25;-3509.418,128.9082;Inherit;False;Normal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-2846.358,350.6234;Inherit;False;Property;_SpecualrScope;Specualr Scope;8;0;Create;True;0;0;0;False;0;False;1;0.046;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;27;-3210.837,107.7351;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;24;-3410.911,-1057.482;Inherit;False;Property;_WaterDarkColor;Water Dark Color;14;0;Create;True;0;0;0;False;0;False;0;0.86;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;26;-3089.074,244.0895;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;28;-3348.158,-898.9548;Inherit;False;Property;_WaterColor;Water Color;10;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.1921569,0.4980392,0.8235294,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;33;-3118.911,-1036.482;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0.4622642,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;35;-2639.888,-1203.231;Inherit;False;25;Normal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;30;-2738.541,-1121.121;Inherit;False;Property;_refractionintnesity;refraction intnesity;15;0;Create;True;0;0;0;False;0;False;0.16;0.00408;0;0.01;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-2727.357,239.6235;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;32;-2739.378,-1005.996;Inherit;False;Property;_AoScope;Ao Scope;16;0;Create;True;0;0;0;False;0;False;0;4.25;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;34;-3105.771,-757.4616;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;42;-2934.297,-918.4009;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;41;-2418.083,-1169.233;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-2519.235,-236.3455;Inherit;False;Property;_FreColorScope;Fre Color Scope;13;0;Create;True;0;0;0;False;0;False;0;1.8;0;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;36;-2854.635,-768.7117;Inherit;False;Property;_Specularbrightness;Specular brightness;9;0;Create;True;0;0;0;False;0;False;1;1;0.2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;37;-2646.274,-1388.924;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;43;-2134.436,155.9094;Inherit;False;1747.467;509.3918;Edge;11;71;69;68;66;65;64;62;59;58;56;44;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ClampOpNode;38;-2740.072,98.0894;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade;40;-2422.463,-1006.535;Inherit;False;True;False;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;47;-2521.348,-458.4799;Inherit;True;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;48;-2550.348,-810.5039;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;46;-1840.001,-423.1192;Inherit;False;Property;_DepthDistance;Depth Distance;12;0;Create;True;0;0;0;False;0;False;0;5.1;0;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;49;-2548.284,-675.9265;Inherit;False;Property;_Frecolor;Fre color;11;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.1411765,0.3333333,0.5411765,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;45;-2212.343,-1261;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.OneMinusNode;50;-2152.358,-1006.834;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;44;-2003.436,320.799;Inherit;False;Property;_EdgeScope;Edge Scope;17;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade;52;-1808.001,-519.1192;Inherit;False;True;False;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade;56;-1988.436,226.7989;Inherit;False;True;False;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;53;-3499.618,465.411;Inherit;False;True;False;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;55;-1966.638,-1010.417;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;51;-2191.651,-874.8989;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;58;-1989.104,566.5073;Inherit;False;Property;_EdgeOpacity;Edge Opacity;19;0;Create;True;0;0;0;False;0;False;1;0.288;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenColorNode;57;-2005.335,-1326.158;Inherit;False;Global;_GrabScreen1;Grab Screen 1;15;0;Create;True;0;0;0;False;0;False;Object;-1;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;54;-2195.895,-690.1494;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;63;-1732.222,-1121.24;Inherit;False;2;2;0;COLOR;1,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;62;-1874.146,465.0402;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;59;-1720.063,228.4226;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;61;-1731.987,-651.0563;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;60;-1959.322,-871.657;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;66;-1546.623,439.4578;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;65;-1349.518,201.4533;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.LerpOp;67;-1529.204,-855.3199;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;64;-1163.192,276.2022;Inherit;False;Property;_EdgeBrightness;Edge Brightness;18;0;Create;True;0;0;0;False;0;False;0;0.42;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;70;-719.4568,-695.6766;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;69;-842.6096,205.2223;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;68;-1290.359,438.809;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;71;-552.4868,205.9095;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;72;-221.72,47.0799;Inherit;False;Constant;_Float0;Float 0;20;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;73;-224.72,145.0799;Inherit;False;Constant;_Float1;Float 1;20;0;Create;True;0;0;0;False;0;False;1;1.4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;7;ASEMaterialInspector;0;0;CustomLighting;ASE_Water_Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;1;Custom;0.5;True;False;0;True;Opaque;;AlphaTest;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;0;5;False;-1;10;False;-1;0;5;False;-1;10;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;10;0;7;2
WireConnection;10;1;3;0
WireConnection;8;0;2;0
WireConnection;9;0;6;2
WireConnection;9;1;4;0
WireConnection;11;0;5;0
WireConnection;12;0;11;0
WireConnection;12;1;10;0
WireConnection;14;0;8;0
WireConnection;14;1;9;0
WireConnection;15;0;13;0
WireConnection;15;1;14;0
WireConnection;16;0;13;0
WireConnection;16;1;12;0
WireConnection;17;0;16;0
WireConnection;17;1;15;0
WireConnection;18;0;17;0
WireConnection;20;0;81;0
WireConnection;20;1;18;0
WireConnection;20;2;19;0
WireConnection;21;0;20;0
WireConnection;25;0;20;0
WireConnection;27;0;21;0
WireConnection;26;0;21;0
WireConnection;26;1;23;0
WireConnection;33;0;24;0
WireConnection;33;1;28;0
WireConnection;31;0;26;0
WireConnection;31;1;29;0
WireConnection;34;0;27;0
WireConnection;42;0;33;0
WireConnection;42;1;28;0
WireConnection;42;2;34;0
WireConnection;41;0;35;0
WireConnection;41;1;30;0
WireConnection;38;0;31;0
WireConnection;40;0;32;0
WireConnection;47;3;39;0
WireConnection;48;0;42;0
WireConnection;48;1;36;0
WireConnection;48;2;38;0
WireConnection;45;0;37;0
WireConnection;45;1;41;0
WireConnection;50;0;40;0
WireConnection;52;0;46;0
WireConnection;56;0;44;0
WireConnection;53;0;20;0
WireConnection;55;0;50;0
WireConnection;57;0;45;0
WireConnection;54;0;48;0
WireConnection;54;1;49;0
WireConnection;54;2;47;0
WireConnection;63;0;57;0
WireConnection;63;1;55;0
WireConnection;62;0;53;0
WireConnection;62;1;58;0
WireConnection;59;0;56;0
WireConnection;61;0;52;0
WireConnection;60;0;51;0
WireConnection;60;1;54;0
WireConnection;66;0;59;0
WireConnection;66;1;62;0
WireConnection;67;0;63;0
WireConnection;67;1;60;0
WireConnection;67;2;61;0
WireConnection;70;0;67;0
WireConnection;69;0;65;0
WireConnection;69;1;64;0
WireConnection;68;0;66;0
WireConnection;71;0;70;0
WireConnection;71;1;69;0
WireConnection;71;2;68;0
WireConnection;0;0;72;0
WireConnection;0;2;72;0
WireConnection;0;9;73;0
WireConnection;0;10;73;0
WireConnection;0;13;71;0
ASEEND*/
//CHKSM=5514E48F97D7881BFE9B8B9B0C980EE980B23220