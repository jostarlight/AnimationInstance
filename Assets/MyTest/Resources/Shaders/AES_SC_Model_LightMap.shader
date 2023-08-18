// Upgrade NOTE: replaced 'defined FOG_COMBINED_WITH_WORLD_POS' with 'defined (FOG_COMBINED_WITH_WORLD_POS)'

// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "AES_SC_Model_LightMap_VS"
{
	Properties
	{
		_Cutoff("Mask Clip Value", Float) = 0.5
		_Diffuse("Diffuse", 2D) = "white" {}
		[Toggle(_USEOPACITYCUT_ON)] _UseOpacityCut("Use Opacity Cut?", Float) = 0
		_DiffuseBrightness("Diffuse Brightness", Range(0 , 2)) = 0
		_TextureSample4("Texture Sample 3", 2D) = "white" {}
		_Color1("Color 0", Color) = (0,0,0,0)
		[HideInInspector] _texcoord2("", 2D) = "white" {}
		[HideInInspector] _texcoord("", 2D) = "white" {}
		[HideInInspector] __dirty("", Int) = 1
	}

		SubShader
		{
			Tags{ "RenderType" = "Opaque"  "Queue" = "AlphaTest+0" }
			Cull Back

			// ------------------------------------------------------------
			// Surface shader code generated out of a CGPROGRAM block:


			// ---- forward rendering base pass:
			Pass {
				Name "FORWARD"
				Tags { "LightMode" = "ForwardBase" }

		CGPROGRAM
			// compile directives
			#pragma vertex vert_surf
			#pragma fragment frag_surf
			#pragma target 3.0
			#pragma shader_feature_local _USEOPACITYCUT_ON
			#pragma multi_compile_instancing
			#pragma multi_compile_fog
			#pragma multi_compile_fwdbase
			#pragma skip_variants SHADOWS_SHADOWMASK LIGHTMAP_SHADOW_MIXING SHADOWS_DEPTH SHADOWS_CUBE VERTEXLIGHT_ON LIGHTPROBE_SH POINT POINT_COOKIE

			#include "HLSLSupport.cginc"
			#define UNITY_INSTANCED_LOD_FADE
			#define UNITY_INSTANCED_SH
			#define UNITY_INSTANCED_LIGHTMAPSTS
			#include "UnityShaderVariables.cginc"
			#include "UnityShaderUtilities.cginc"
			// -------- variant for: <when no other keywords are defined>
			#if !defined(INSTANCING_ON) && !defined(_USEOPACITYCUT_ON)

			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			#include "AutoLight.cginc"

			#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
			#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
			#define WorldNormalVector(data,normal) fixed3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))

			// Original surface shader snippet:
			#line 20 ""
			#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
			#endif
			/* UNITY: Original start of shader */
					//#pragma target 3.0
					//#pragma shader_feature_local _USEOPACITYCUT_ON
					//#pragma surface surf StandardSpecular keepalpha addshadow fullforwardshadows 
					struct Input
					{
						float2 uv_texcoord;
						float2 uv2_texcoord2;
					};

					uniform sampler2D _Diffuse;
					uniform float4 _Diffuse_ST;
					uniform float _DiffuseBrightness;
					uniform sampler2D _TextureSample4;
					uniform float4 _Color1;
					uniform float _Cutoff = 0.5;

					void surf(Input i , inout SurfaceOutputStandardSpecular o)
					{
						o.Normal = float3(0,0,1);
						float2 uv_Diffuse = i.uv_texcoord * _Diffuse_ST.xy + _Diffuse_ST.zw;
						float4 tex2DNode6 = tex2D(_Diffuse, uv_Diffuse);
						o.Albedo = ((tex2DNode6 * _DiffuseBrightness) * (tex2D(_TextureSample4, i.uv2_texcoord2) * _Color1)).rgb;
						o.Smoothness = 0.0;
						o.Alpha = 1;
						#ifdef _USEOPACITYCUT_ON
							float staticSwitch174 = 1.0;
						#else
							float staticSwitch174 = tex2DNode6.a;
						#endif
						clip(staticSwitch174 - _Cutoff);
					}



					// vertex-to-fragment interpolation data
					// no lightmaps:
					#ifndef LIGHTMAP_ON
					// half-precision fragment shader registers:
					#ifdef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
					#define FOG_COMBINED_WITH_TSPACE
					struct v2f_surf {
					  UNITY_POSITION(pos);
					  float4 pack0 : TEXCOORD0; // _texcoord _texcoord2
					  float4 tSpace0 : TEXCOORD1;
					  float4 tSpace1 : TEXCOORD2;
					  float4 tSpace2 : TEXCOORD3;
					  #if UNITY_SHOULD_SAMPLE_SH
					  half3 sh : TEXCOORD4; // SH
					  #endif
					  UNITY_LIGHTING_COORDS(5,6)
					  #if SHADER_TARGET >= 30
					  float4 lmap : TEXCOORD7;
					  #endif
					  UNITY_VERTEX_INPUT_INSTANCE_ID
					  UNITY_VERTEX_OUTPUT_STEREO
					};
					#endif
					// high-precision fragment shader registers:
					#ifndef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
					struct v2f_surf {
					  UNITY_POSITION(pos);
					  float4 pack0 : TEXCOORD0; // _texcoord _texcoord2
					  float4 tSpace0 : TEXCOORD1;
					  float4 tSpace1 : TEXCOORD2;
					  float4 tSpace2 : TEXCOORD3;
					  #if UNITY_SHOULD_SAMPLE_SH
					  half3 sh : TEXCOORD4; // SH
					  #endif
					  UNITY_FOG_COORDS(5)
					  UNITY_SHADOW_COORDS(6)
					  #if SHADER_TARGET >= 30
					  float4 lmap : TEXCOORD7;
					  #endif
					  UNITY_VERTEX_INPUT_INSTANCE_ID
					  UNITY_VERTEX_OUTPUT_STEREO
					};
					#endif
					#endif
					// with lightmaps:
					#ifdef LIGHTMAP_ON
					// half-precision fragment shader registers:
					#ifdef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
					#define FOG_COMBINED_WITH_TSPACE
					struct v2f_surf {
					  UNITY_POSITION(pos);
					  float4 pack0 : TEXCOORD0; // _texcoord _texcoord2
					  float4 tSpace0 : TEXCOORD1;
					  float4 tSpace1 : TEXCOORD2;
					  float4 tSpace2 : TEXCOORD3;
					  float4 lmap : TEXCOORD4;
					  UNITY_LIGHTING_COORDS(5,6)
					  UNITY_VERTEX_INPUT_INSTANCE_ID
					  UNITY_VERTEX_OUTPUT_STEREO
					};
					#endif
					// high-precision fragment shader registers:
					#ifndef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
					struct v2f_surf {
					  UNITY_POSITION(pos);
					  float4 pack0 : TEXCOORD0; // _texcoord _texcoord2
					  float4 tSpace0 : TEXCOORD1;
					  float4 tSpace1 : TEXCOORD2;
					  float4 tSpace2 : TEXCOORD3;
					  float4 lmap : TEXCOORD4;
					  UNITY_FOG_COORDS(5)
					  UNITY_SHADOW_COORDS(6)
					  UNITY_VERTEX_INPUT_INSTANCE_ID
					  UNITY_VERTEX_OUTPUT_STEREO
					};
					#endif
					#endif
					float4 _texcoord_ST;
					float4 _texcoord2_ST;

					// vertex shader
					v2f_surf vert_surf(appdata_full v) {
					  UNITY_SETUP_INSTANCE_ID(v);
					  v2f_surf o;
					  UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
					  UNITY_TRANSFER_INSTANCE_ID(v,o);
					  UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
					  o.pos = UnityObjectToClipPos(v.vertex);
					  o.pack0.xy = TRANSFORM_TEX(v.texcoord, _texcoord);
					  o.pack0.zw = TRANSFORM_TEX(v.texcoord1, _texcoord2);
					  float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
					  float3 worldNormal = UnityObjectToWorldNormal(v.normal);
					  fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
					  fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
					  fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
					  o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
					  o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
					  o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
					  #ifdef DYNAMICLIGHTMAP_ON
					  o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
					  #endif
					  #ifdef LIGHTMAP_ON
					  o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					  #endif

					  // SH/ambient and vertex lights
					  #ifndef LIGHTMAP_ON
						#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
						  o.sh = 0;
						  // Approximated illumination from non-important point lights
						  #ifdef VERTEXLIGHT_ON
							o.sh += Shade4PointLights(
							  unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
							  unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
							  unity_4LightAtten0, worldPos, worldNormal);
						  #endif
						  o.sh = ShadeSHPerVertex(worldNormal, o.sh);
						#endif
					  #endif // !LIGHTMAP_ON

					  UNITY_TRANSFER_LIGHTING(o,v.texcoord1.xy); // pass shadow and, possibly, light cookie coordinates to pixel shader
					  #ifdef FOG_COMBINED_WITH_TSPACE
						UNITY_TRANSFER_FOG_COMBINED_WITH_TSPACE(o,o.pos); // pass fog coordinates to pixel shader
					  #elif defined (FOG_COMBINED_WITH_WORLD_POS)
						UNITY_TRANSFER_FOG_COMBINED_WITH_WORLD_POS(o,o.pos); // pass fog coordinates to pixel shader
					  #else
						UNITY_TRANSFER_FOG(o,o.pos); // pass fog coordinates to pixel shader
					  #endif
					  return o;
					}

					// fragment shader
					fixed4 frag_surf(v2f_surf IN) : SV_Target {
					  UNITY_SETUP_INSTANCE_ID(IN);
					  UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);
					  // prepare and unpack data
					  Input surfIN;
					  #ifdef FOG_COMBINED_WITH_TSPACE
						UNITY_EXTRACT_FOG_FROM_TSPACE(IN);
					  #elif defined (FOG_COMBINED_WITH_WORLD_POS)
						UNITY_EXTRACT_FOG_FROM_WORLD_POS(IN);
					  #else
						UNITY_EXTRACT_FOG(IN);
					  #endif
					  #ifdef FOG_COMBINED_WITH_TSPACE
						UNITY_RECONSTRUCT_TBN(IN);
					  #else
						UNITY_EXTRACT_TBN(IN);
					  #endif
					  UNITY_INITIALIZE_OUTPUT(Input,surfIN);
					  surfIN.uv_texcoord.x = 1.0;
					  surfIN.uv2_texcoord2.x = 1.0;
					  surfIN.uv_texcoord = IN.pack0.xy;
					  surfIN.uv2_texcoord2 = IN.pack0.zw;
					  float3 worldPos = float3(IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w);
					  #ifndef USING_DIRECTIONAL_LIGHT
						fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
					  #else
						fixed3 lightDir = _WorldSpaceLightPos0.xyz;
					  #endif
					  float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
					  #ifdef UNITY_COMPILER_HLSL
					  SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
					  #else
					  SurfaceOutputStandardSpecular o;
					  #endif
					  o.Albedo = 0.0;
					  o.Emission = 0.0;
					  o.Specular = 0.0;
					  o.Alpha = 0.0;
					  o.Occlusion = 1.0;
					  fixed3 normalWorldVertex = fixed3(0,0,1);
					  o.Normal = fixed3(0,0,1);

					  // call surface function
					  surf(surfIN, o);

					  // compute lighting & shadowing factor
					  UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
					  fixed4 c = 0;
					  float3 worldN;
					  worldN.x = dot(_unity_tbn_0, o.Normal);
					  worldN.y = dot(_unity_tbn_1, o.Normal);
					  worldN.z = dot(_unity_tbn_2, o.Normal);
					  worldN = normalize(worldN);
					  o.Normal = worldN;

					  // Setup lighting environment
					  UnityGI gi;
					  UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
					  gi.indirect.diffuse = 0;
					  gi.indirect.specular = 0;
					  gi.light.color = _LightColor0.rgb;
					  gi.light.dir = lightDir;
					  // Call GI (lightmaps/SH/reflections) lighting function
					  UnityGIInput giInput;
					  UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
					  giInput.light = gi.light;
					  giInput.worldPos = worldPos;
					  giInput.worldViewDir = worldViewDir;
					  giInput.atten = atten;
					  #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
						giInput.lightmapUV = IN.lmap;
					  #else
						giInput.lightmapUV = 0.0;
					  #endif
					  #if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
						giInput.ambient = IN.sh;
					  #else
						giInput.ambient.rgb = 0.0;
					  #endif
					  giInput.probeHDR[0] = unity_SpecCube0_HDR;
					  giInput.probeHDR[1] = unity_SpecCube1_HDR;
					  #if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
						giInput.boxMin[0] = unity_SpecCube0_BoxMin; // .w holds lerp value for blending
					  #endif
					  #ifdef UNITY_SPECCUBE_BOX_PROJECTION
						giInput.boxMax[0] = unity_SpecCube0_BoxMax;
						giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
						giInput.boxMax[1] = unity_SpecCube1_BoxMax;
						giInput.boxMin[1] = unity_SpecCube1_BoxMin;
						giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
					  #endif
					  LightingStandardSpecular_GI(o, giInput, gi);

					  // realtime lighting: call lighting function
					  c += LightingStandardSpecular(o, worldViewDir, gi);
					  UNITY_APPLY_FOG(_unity_fogCoord, c); // apply fog
					  return c;
					}


					#endif

						// -------- variant for: _USEOPACITYCUT_ON 
						#if defined(_USEOPACITYCUT_ON) && !defined(INSTANCING_ON)
						// Surface shader code generated based on:
						// writes to per-pixel normal: YES
						// writes to emission: no
						// writes to occlusion: no
						// needs world space reflection vector: no
						// needs world space normal vector: no
						// needs screen space position: no
						// needs world space position: no
						// needs view direction: no
						// needs world space view direction: no
						// needs world space position for lighting: YES
						// needs world space view direction for lighting: YES
						// needs world space view direction for lightmaps: no
						// needs vertex color: no
						// needs VFACE: no
						// needs SV_IsFrontFace: no
						// passes tangent-to-world matrix to pixel shader: YES
						// reads from normal: no
						// 2 texcoords actually used
						//   float2 _texcoord
						//   float2 _texcoord2
						#include "UnityCG.cginc"
						#include "Lighting.cginc"
						#include "UnityPBSLighting.cginc"
						#include "AutoLight.cginc"

						#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
						#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
						#define WorldNormalVector(data,normal) fixed3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))

						// Original surface shader snippet:
						#line 20 ""
						#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
						#endif
						/* UNITY: Original start of shader */
								//#pragma target 3.0
								//#pragma shader_feature_local _USEOPACITYCUT_ON
								//#pragma surface surf StandardSpecular keepalpha addshadow fullforwardshadows 
								struct Input
								{
									float2 uv_texcoord;
									float2 uv2_texcoord2;
								};

								uniform sampler2D _Diffuse;
								uniform float4 _Diffuse_ST;
								uniform float _DiffuseBrightness;
								uniform sampler2D _TextureSample4;
								uniform float4 _Color1;
								uniform float _Cutoff = 0.5;

								void surf(Input i , inout SurfaceOutputStandardSpecular o)
								{
									o.Normal = float3(0,0,1);
									float2 uv_Diffuse = i.uv_texcoord * _Diffuse_ST.xy + _Diffuse_ST.zw;
									float4 tex2DNode6 = tex2D(_Diffuse, uv_Diffuse);
									o.Albedo = ((tex2DNode6 * _DiffuseBrightness) * (tex2D(_TextureSample4, i.uv2_texcoord2) * _Color1)).rgb;
									o.Smoothness = 0.0;
									o.Alpha = 1;
									#ifdef _USEOPACITYCUT_ON
										float staticSwitch174 = 1.0;
									#else
										float staticSwitch174 = tex2DNode6.a;
									#endif
									clip(staticSwitch174 - _Cutoff);
								}



								// vertex-to-fragment interpolation data
								// no lightmaps:
								#ifndef LIGHTMAP_ON
								// half-precision fragment shader registers:
								#ifdef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
								#define FOG_COMBINED_WITH_TSPACE
								struct v2f_surf {
								  UNITY_POSITION(pos);
								  float4 pack0 : TEXCOORD0; // _texcoord _texcoord2
								  float4 tSpace0 : TEXCOORD1;
								  float4 tSpace1 : TEXCOORD2;
								  float4 tSpace2 : TEXCOORD3;
								  #if UNITY_SHOULD_SAMPLE_SH
								  half3 sh : TEXCOORD4; // SH
								  #endif
								  UNITY_LIGHTING_COORDS(5,6)
								  #if SHADER_TARGET >= 30
								  float4 lmap : TEXCOORD7;
								  #endif
								  UNITY_VERTEX_INPUT_INSTANCE_ID
								  UNITY_VERTEX_OUTPUT_STEREO
								};
								#endif
								// high-precision fragment shader registers:
								#ifndef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
								struct v2f_surf {
								  UNITY_POSITION(pos);
								  float4 pack0 : TEXCOORD0; // _texcoord _texcoord2
								  float4 tSpace0 : TEXCOORD1;
								  float4 tSpace1 : TEXCOORD2;
								  float4 tSpace2 : TEXCOORD3;
								  #if UNITY_SHOULD_SAMPLE_SH
								  half3 sh : TEXCOORD4; // SH
								  #endif
								  UNITY_FOG_COORDS(5)
								  UNITY_SHADOW_COORDS(6)
								  #if SHADER_TARGET >= 30
								  float4 lmap : TEXCOORD7;
								  #endif
								  UNITY_VERTEX_INPUT_INSTANCE_ID
								  UNITY_VERTEX_OUTPUT_STEREO
								};
								#endif
								#endif
								// with lightmaps:
								#ifdef LIGHTMAP_ON
								// half-precision fragment shader registers:
								#ifdef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
								#define FOG_COMBINED_WITH_TSPACE
								struct v2f_surf {
								  UNITY_POSITION(pos);
								  float4 pack0 : TEXCOORD0; // _texcoord _texcoord2
								  float4 tSpace0 : TEXCOORD1;
								  float4 tSpace1 : TEXCOORD2;
								  float4 tSpace2 : TEXCOORD3;
								  float4 lmap : TEXCOORD4;
								  UNITY_LIGHTING_COORDS(5,6)
								  UNITY_VERTEX_INPUT_INSTANCE_ID
								  UNITY_VERTEX_OUTPUT_STEREO
								};
								#endif
								// high-precision fragment shader registers:
								#ifndef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
								struct v2f_surf {
								  UNITY_POSITION(pos);
								  float4 pack0 : TEXCOORD0; // _texcoord _texcoord2
								  float4 tSpace0 : TEXCOORD1;
								  float4 tSpace1 : TEXCOORD2;
								  float4 tSpace2 : TEXCOORD3;
								  float4 lmap : TEXCOORD4;
								  UNITY_FOG_COORDS(5)
								  UNITY_SHADOW_COORDS(6)
								  UNITY_VERTEX_INPUT_INSTANCE_ID
								  UNITY_VERTEX_OUTPUT_STEREO
								};
								#endif
								#endif
								float4 _texcoord_ST;
								float4 _texcoord2_ST;

								// vertex shader
								v2f_surf vert_surf(appdata_full v) {
								  UNITY_SETUP_INSTANCE_ID(v);
								  v2f_surf o;
								  UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
								  UNITY_TRANSFER_INSTANCE_ID(v,o);
								  UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
								  o.pos = UnityObjectToClipPos(v.vertex);
								  o.pack0.xy = TRANSFORM_TEX(v.texcoord, _texcoord);
								  o.pack0.zw = TRANSFORM_TEX(v.texcoord1, _texcoord2);
								  float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
								  float3 worldNormal = UnityObjectToWorldNormal(v.normal);
								  fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
								  fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
								  fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
								  o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
								  o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
								  o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
								  #ifdef DYNAMICLIGHTMAP_ON
								  o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
								  #endif
								  #ifdef LIGHTMAP_ON
								  o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
								  #endif

								  // SH/ambient and vertex lights
								  #ifndef LIGHTMAP_ON
									#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
									  o.sh = 0;
									  // Approximated illumination from non-important point lights
									  #ifdef VERTEXLIGHT_ON
										o.sh += Shade4PointLights(
										  unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
										  unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
										  unity_4LightAtten0, worldPos, worldNormal);
									  #endif
									  o.sh = ShadeSHPerVertex(worldNormal, o.sh);
									#endif
								  #endif // !LIGHTMAP_ON

								  UNITY_TRANSFER_LIGHTING(o,v.texcoord1.xy); // pass shadow and, possibly, light cookie coordinates to pixel shader
								  #ifdef FOG_COMBINED_WITH_TSPACE
									UNITY_TRANSFER_FOG_COMBINED_WITH_TSPACE(o,o.pos); // pass fog coordinates to pixel shader
								  #elif defined (FOG_COMBINED_WITH_WORLD_POS)
									UNITY_TRANSFER_FOG_COMBINED_WITH_WORLD_POS(o,o.pos); // pass fog coordinates to pixel shader
								  #else
									UNITY_TRANSFER_FOG(o,o.pos); // pass fog coordinates to pixel shader
								  #endif
								  return o;
								}

								// fragment shader
								fixed4 frag_surf(v2f_surf IN) : SV_Target {
								  UNITY_SETUP_INSTANCE_ID(IN);
								  UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);
								  // prepare and unpack data
								  Input surfIN;
								  #ifdef FOG_COMBINED_WITH_TSPACE
									UNITY_EXTRACT_FOG_FROM_TSPACE(IN);
								  #elif defined (FOG_COMBINED_WITH_WORLD_POS)
									UNITY_EXTRACT_FOG_FROM_WORLD_POS(IN);
								  #else
									UNITY_EXTRACT_FOG(IN);
								  #endif
								  #ifdef FOG_COMBINED_WITH_TSPACE
									UNITY_RECONSTRUCT_TBN(IN);
								  #else
									UNITY_EXTRACT_TBN(IN);
								  #endif
								  UNITY_INITIALIZE_OUTPUT(Input,surfIN);
								  surfIN.uv_texcoord.x = 1.0;
								  surfIN.uv2_texcoord2.x = 1.0;
								  surfIN.uv_texcoord = IN.pack0.xy;
								  surfIN.uv2_texcoord2 = IN.pack0.zw;
								  float3 worldPos = float3(IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w);
								  #ifndef USING_DIRECTIONAL_LIGHT
									fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
								  #else
									fixed3 lightDir = _WorldSpaceLightPos0.xyz;
								  #endif
								  float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
								  #ifdef UNITY_COMPILER_HLSL
								  SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
								  #else
								  SurfaceOutputStandardSpecular o;
								  #endif
								  o.Albedo = 0.0;
								  o.Emission = 0.0;
								  o.Specular = 0.0;
								  o.Alpha = 0.0;
								  o.Occlusion = 1.0;
								  fixed3 normalWorldVertex = fixed3(0,0,1);
								  o.Normal = fixed3(0,0,1);

								  // call surface function
								  surf(surfIN, o);

								  // compute lighting & shadowing factor
								  UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
								  fixed4 c = 0;
								  float3 worldN;
								  worldN.x = dot(_unity_tbn_0, o.Normal);
								  worldN.y = dot(_unity_tbn_1, o.Normal);
								  worldN.z = dot(_unity_tbn_2, o.Normal);
								  worldN = normalize(worldN);
								  o.Normal = worldN;

								  // Setup lighting environment
								  UnityGI gi;
								  UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
								  gi.indirect.diffuse = 0;
								  gi.indirect.specular = 0;
								  gi.light.color = _LightColor0.rgb;
								  gi.light.dir = lightDir;
								  // Call GI (lightmaps/SH/reflections) lighting function
								  UnityGIInput giInput;
								  UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
								  giInput.light = gi.light;
								  giInput.worldPos = worldPos;
								  giInput.worldViewDir = worldViewDir;
								  giInput.atten = atten;
								  #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
									giInput.lightmapUV = IN.lmap;
								  #else
									giInput.lightmapUV = 0.0;
								  #endif
								  #if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
									giInput.ambient = IN.sh;
								  #else
									giInput.ambient.rgb = 0.0;
								  #endif
								  giInput.probeHDR[0] = unity_SpecCube0_HDR;
								  giInput.probeHDR[1] = unity_SpecCube1_HDR;
								  #if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
									giInput.boxMin[0] = unity_SpecCube0_BoxMin; // .w holds lerp value for blending
								  #endif
								  #ifdef UNITY_SPECCUBE_BOX_PROJECTION
									giInput.boxMax[0] = unity_SpecCube0_BoxMax;
									giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
									giInput.boxMax[1] = unity_SpecCube1_BoxMax;
									giInput.boxMin[1] = unity_SpecCube1_BoxMin;
									giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
								  #endif
								  LightingStandardSpecular_GI(o, giInput, gi);

								  // realtime lighting: call lighting function
								  c += LightingStandardSpecular(o, worldViewDir, gi);
								  UNITY_APPLY_FOG(_unity_fogCoord, c); // apply fog
								  return c;
								}


								#endif

									// -------- variant for: INSTANCING_ON 
									#if defined(INSTANCING_ON) && !defined(_USEOPACITYCUT_ON)
									// Surface shader code generated based on:
									// writes to per-pixel normal: YES
									// writes to emission: no
									// writes to occlusion: no
									// needs world space reflection vector: no
									// needs world space normal vector: no
									// needs screen space position: no
									// needs world space position: no
									// needs view direction: no
									// needs world space view direction: no
									// needs world space position for lighting: YES
									// needs world space view direction for lighting: YES
									// needs world space view direction for lightmaps: no
									// needs vertex color: no
									// needs VFACE: no
									// needs SV_IsFrontFace: no
									// passes tangent-to-world matrix to pixel shader: YES
									// reads from normal: no
									// 2 texcoords actually used
									//   float2 _texcoord
									//   float2 _texcoord2
									#include "UnityCG.cginc"
									#include "Lighting.cginc"
									#include "UnityPBSLighting.cginc"
									#include "AutoLight.cginc"

									#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
									#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
									#define WorldNormalVector(data,normal) fixed3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))

									// Original surface shader snippet:
									#line 20 ""
									#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
									#endif
									/* UNITY: Original start of shader */
											//#pragma target 3.0
											//#pragma shader_feature_local _USEOPACITYCUT_ON
											//#pragma surface surf StandardSpecular keepalpha addshadow fullforwardshadows 
											struct Input
											{
												float2 uv_texcoord;
												float2 uv2_texcoord2;
											};

											uniform sampler2D _Diffuse;
											uniform float4 _Diffuse_ST;
											uniform float _DiffuseBrightness;
											uniform sampler2D _TextureSample4;
											uniform float4 _Color1;
											uniform float _Cutoff = 0.5;

											void surf(Input i , inout SurfaceOutputStandardSpecular o)
											{
												o.Normal = float3(0,0,1);
												float2 uv_Diffuse = i.uv_texcoord * _Diffuse_ST.xy + _Diffuse_ST.zw;
												float4 tex2DNode6 = tex2D(_Diffuse, uv_Diffuse);
												o.Albedo = ((tex2DNode6 * _DiffuseBrightness) * (tex2D(_TextureSample4, i.uv2_texcoord2) * _Color1)).rgb;
												o.Smoothness = 0.0;
												o.Alpha = 1;
												#ifdef _USEOPACITYCUT_ON
													float staticSwitch174 = 1.0;
												#else
													float staticSwitch174 = tex2DNode6.a;
												#endif
												clip(staticSwitch174 - _Cutoff);
											}



											// vertex-to-fragment interpolation data
											// no lightmaps:
											#ifndef LIGHTMAP_ON
											// half-precision fragment shader registers:
											#ifdef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
											#define FOG_COMBINED_WITH_TSPACE
											struct v2f_surf {
											  UNITY_POSITION(pos);
											  float4 pack0 : TEXCOORD0; // _texcoord _texcoord2
											  float4 tSpace0 : TEXCOORD1;
											  float4 tSpace1 : TEXCOORD2;
											  float4 tSpace2 : TEXCOORD3;
											  #if UNITY_SHOULD_SAMPLE_SH
											  half3 sh : TEXCOORD4; // SH
											  #endif
											  UNITY_LIGHTING_COORDS(5,6)
											  #if SHADER_TARGET >= 30
											  float4 lmap : TEXCOORD7;
											  #endif
											  UNITY_VERTEX_INPUT_INSTANCE_ID
											  UNITY_VERTEX_OUTPUT_STEREO
											};
											#endif
											// high-precision fragment shader registers:
											#ifndef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
											struct v2f_surf {
											  UNITY_POSITION(pos);
											  float4 pack0 : TEXCOORD0; // _texcoord _texcoord2
											  float4 tSpace0 : TEXCOORD1;
											  float4 tSpace1 : TEXCOORD2;
											  float4 tSpace2 : TEXCOORD3;
											  #if UNITY_SHOULD_SAMPLE_SH
											  half3 sh : TEXCOORD4; // SH
											  #endif
											  UNITY_FOG_COORDS(5)
											  UNITY_SHADOW_COORDS(6)
											  #if SHADER_TARGET >= 30
											  float4 lmap : TEXCOORD7;
											  #endif
											  UNITY_VERTEX_INPUT_INSTANCE_ID
											  UNITY_VERTEX_OUTPUT_STEREO
											};
											#endif
											#endif
											// with lightmaps:
											#ifdef LIGHTMAP_ON
											// half-precision fragment shader registers:
											#ifdef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
											#define FOG_COMBINED_WITH_TSPACE
											struct v2f_surf {
											  UNITY_POSITION(pos);
											  float4 pack0 : TEXCOORD0; // _texcoord _texcoord2
											  float4 tSpace0 : TEXCOORD1;
											  float4 tSpace1 : TEXCOORD2;
											  float4 tSpace2 : TEXCOORD3;
											  float4 lmap : TEXCOORD4;
											  UNITY_LIGHTING_COORDS(5,6)
											  UNITY_VERTEX_INPUT_INSTANCE_ID
											  UNITY_VERTEX_OUTPUT_STEREO
											};
											#endif
											// high-precision fragment shader registers:
											#ifndef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
											struct v2f_surf {
											  UNITY_POSITION(pos);
											  float4 pack0 : TEXCOORD0; // _texcoord _texcoord2
											  float4 tSpace0 : TEXCOORD1;
											  float4 tSpace1 : TEXCOORD2;
											  float4 tSpace2 : TEXCOORD3;
											  float4 lmap : TEXCOORD4;
											  UNITY_FOG_COORDS(5)
											  UNITY_SHADOW_COORDS(6)
											  UNITY_VERTEX_INPUT_INSTANCE_ID
											  UNITY_VERTEX_OUTPUT_STEREO
											};
											#endif
											#endif
											float4 _texcoord_ST;
											float4 _texcoord2_ST;

											// vertex shader
											v2f_surf vert_surf(appdata_full v) {
											  UNITY_SETUP_INSTANCE_ID(v);
											  v2f_surf o;
											  UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
											  UNITY_TRANSFER_INSTANCE_ID(v,o);
											  UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
											  o.pos = UnityObjectToClipPos(v.vertex);
											  o.pack0.xy = TRANSFORM_TEX(v.texcoord, _texcoord);
											  o.pack0.zw = TRANSFORM_TEX(v.texcoord1, _texcoord2);
											  float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
											  float3 worldNormal = UnityObjectToWorldNormal(v.normal);
											  fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
											  fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
											  fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
											  o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
											  o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
											  o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
											  #ifdef DYNAMICLIGHTMAP_ON
											  o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
											  #endif
											  #ifdef LIGHTMAP_ON
											  o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
											  #endif

											  // SH/ambient and vertex lights
											  #ifndef LIGHTMAP_ON
												#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
												  o.sh = 0;
												  // Approximated illumination from non-important point lights
												  #ifdef VERTEXLIGHT_ON
													o.sh += Shade4PointLights(
													  unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
													  unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
													  unity_4LightAtten0, worldPos, worldNormal);
												  #endif
												  o.sh = ShadeSHPerVertex(worldNormal, o.sh);
												#endif
											  #endif // !LIGHTMAP_ON

											  UNITY_TRANSFER_LIGHTING(o,v.texcoord1.xy); // pass shadow and, possibly, light cookie coordinates to pixel shader
											  #ifdef FOG_COMBINED_WITH_TSPACE
												UNITY_TRANSFER_FOG_COMBINED_WITH_TSPACE(o,o.pos); // pass fog coordinates to pixel shader
											  #elif defined (FOG_COMBINED_WITH_WORLD_POS)
												UNITY_TRANSFER_FOG_COMBINED_WITH_WORLD_POS(o,o.pos); // pass fog coordinates to pixel shader
											  #else
												UNITY_TRANSFER_FOG(o,o.pos); // pass fog coordinates to pixel shader
											  #endif
											  return o;
											}

											// fragment shader
											fixed4 frag_surf(v2f_surf IN) : SV_Target {
											  UNITY_SETUP_INSTANCE_ID(IN);
											  UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);
											  // prepare and unpack data
											  Input surfIN;
											  #ifdef FOG_COMBINED_WITH_TSPACE
												UNITY_EXTRACT_FOG_FROM_TSPACE(IN);
											  #elif defined (FOG_COMBINED_WITH_WORLD_POS)
												UNITY_EXTRACT_FOG_FROM_WORLD_POS(IN);
											  #else
												UNITY_EXTRACT_FOG(IN);
											  #endif
											  #ifdef FOG_COMBINED_WITH_TSPACE
												UNITY_RECONSTRUCT_TBN(IN);
											  #else
												UNITY_EXTRACT_TBN(IN);
											  #endif
											  UNITY_INITIALIZE_OUTPUT(Input,surfIN);
											  surfIN.uv_texcoord.x = 1.0;
											  surfIN.uv2_texcoord2.x = 1.0;
											  surfIN.uv_texcoord = IN.pack0.xy;
											  surfIN.uv2_texcoord2 = IN.pack0.zw;
											  float3 worldPos = float3(IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w);
											  #ifndef USING_DIRECTIONAL_LIGHT
												fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
											  #else
												fixed3 lightDir = _WorldSpaceLightPos0.xyz;
											  #endif
											  float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
											  #ifdef UNITY_COMPILER_HLSL
											  SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
											  #else
											  SurfaceOutputStandardSpecular o;
											  #endif
											  o.Albedo = 0.0;
											  o.Emission = 0.0;
											  o.Specular = 0.0;
											  o.Alpha = 0.0;
											  o.Occlusion = 1.0;
											  fixed3 normalWorldVertex = fixed3(0,0,1);
											  o.Normal = fixed3(0,0,1);

											  // call surface function
											  surf(surfIN, o);

											  // compute lighting & shadowing factor
											  UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
											  fixed4 c = 0;
											  float3 worldN;
											  worldN.x = dot(_unity_tbn_0, o.Normal);
											  worldN.y = dot(_unity_tbn_1, o.Normal);
											  worldN.z = dot(_unity_tbn_2, o.Normal);
											  worldN = normalize(worldN);
											  o.Normal = worldN;

											  // Setup lighting environment
											  UnityGI gi;
											  UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
											  gi.indirect.diffuse = 0;
											  gi.indirect.specular = 0;
											  gi.light.color = _LightColor0.rgb;
											  gi.light.dir = lightDir;
											  // Call GI (lightmaps/SH/reflections) lighting function
											  UnityGIInput giInput;
											  UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
											  giInput.light = gi.light;
											  giInput.worldPos = worldPos;
											  giInput.worldViewDir = worldViewDir;
											  giInput.atten = atten;
											  #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
												giInput.lightmapUV = IN.lmap;
											  #else
												giInput.lightmapUV = 0.0;
											  #endif
											  #if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
												giInput.ambient = IN.sh;
											  #else
												giInput.ambient.rgb = 0.0;
											  #endif
											  giInput.probeHDR[0] = unity_SpecCube0_HDR;
											  giInput.probeHDR[1] = unity_SpecCube1_HDR;
											  #if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
												giInput.boxMin[0] = unity_SpecCube0_BoxMin; // .w holds lerp value for blending
											  #endif
											  #ifdef UNITY_SPECCUBE_BOX_PROJECTION
												giInput.boxMax[0] = unity_SpecCube0_BoxMax;
												giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
												giInput.boxMax[1] = unity_SpecCube1_BoxMax;
												giInput.boxMin[1] = unity_SpecCube1_BoxMin;
												giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
											  #endif
											  LightingStandardSpecular_GI(o, giInput, gi);

											  // realtime lighting: call lighting function
											  c += LightingStandardSpecular(o, worldViewDir, gi);
											  UNITY_APPLY_FOG(_unity_fogCoord, c); // apply fog
											  return c;
											}


											#endif

												// -------- variant for: INSTANCING_ON _USEOPACITYCUT_ON 
												#if defined(INSTANCING_ON) && defined(_USEOPACITYCUT_ON)
												// Surface shader code generated based on:
												// writes to per-pixel normal: YES
												// writes to emission: no
												// writes to occlusion: no
												// needs world space reflection vector: no
												// needs world space normal vector: no
												// needs screen space position: no
												// needs world space position: no
												// needs view direction: no
												// needs world space view direction: no
												// needs world space position for lighting: YES
												// needs world space view direction for lighting: YES
												// needs world space view direction for lightmaps: no
												// needs vertex color: no
												// needs VFACE: no
												// needs SV_IsFrontFace: no
												// passes tangent-to-world matrix to pixel shader: YES
												// reads from normal: no
												// 2 texcoords actually used
												//   float2 _texcoord
												//   float2 _texcoord2
												#include "UnityCG.cginc"
												#include "Lighting.cginc"
												#include "UnityPBSLighting.cginc"
												#include "AutoLight.cginc"

												#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
												#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
												#define WorldNormalVector(data,normal) fixed3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))

												// Original surface shader snippet:
												#line 20 ""
												#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
												#endif
												/* UNITY: Original start of shader */
														//#pragma target 3.0
														//#pragma shader_feature_local _USEOPACITYCUT_ON
														//#pragma surface surf StandardSpecular keepalpha addshadow fullforwardshadows 
														struct Input
														{
															float2 uv_texcoord;
															float2 uv2_texcoord2;
														};

														uniform sampler2D _Diffuse;
														uniform float4 _Diffuse_ST;
														uniform float _DiffuseBrightness;
														uniform sampler2D _TextureSample4;
														uniform float4 _Color1;
														uniform float _Cutoff = 0.5;

														void surf(Input i , inout SurfaceOutputStandardSpecular o)
														{
															o.Normal = float3(0,0,1);
															float2 uv_Diffuse = i.uv_texcoord * _Diffuse_ST.xy + _Diffuse_ST.zw;
															float4 tex2DNode6 = tex2D(_Diffuse, uv_Diffuse);
															o.Albedo = ((tex2DNode6 * _DiffuseBrightness) * (tex2D(_TextureSample4, i.uv2_texcoord2) * _Color1)).rgb;
															o.Smoothness = 0.0;
															o.Alpha = 1;
															#ifdef _USEOPACITYCUT_ON
																float staticSwitch174 = 1.0;
															#else
																float staticSwitch174 = tex2DNode6.a;
															#endif
															clip(staticSwitch174 - _Cutoff);
														}



														// vertex-to-fragment interpolation data
														// no lightmaps:
														#ifndef LIGHTMAP_ON
														// half-precision fragment shader registers:
														#ifdef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
														#define FOG_COMBINED_WITH_TSPACE
														struct v2f_surf {
														  UNITY_POSITION(pos);
														  float4 pack0 : TEXCOORD0; // _texcoord _texcoord2
														  float4 tSpace0 : TEXCOORD1;
														  float4 tSpace1 : TEXCOORD2;
														  float4 tSpace2 : TEXCOORD3;
														  #if UNITY_SHOULD_SAMPLE_SH
														  half3 sh : TEXCOORD4; // SH
														  #endif
														  UNITY_LIGHTING_COORDS(5,6)
														  #if SHADER_TARGET >= 30
														  float4 lmap : TEXCOORD7;
														  #endif
														  UNITY_VERTEX_INPUT_INSTANCE_ID
														  UNITY_VERTEX_OUTPUT_STEREO
														};
														#endif
														// high-precision fragment shader registers:
														#ifndef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
														struct v2f_surf {
														  UNITY_POSITION(pos);
														  float4 pack0 : TEXCOORD0; // _texcoord _texcoord2
														  float4 tSpace0 : TEXCOORD1;
														  float4 tSpace1 : TEXCOORD2;
														  float4 tSpace2 : TEXCOORD3;
														  #if UNITY_SHOULD_SAMPLE_SH
														  half3 sh : TEXCOORD4; // SH
														  #endif
														  UNITY_FOG_COORDS(5)
														  UNITY_SHADOW_COORDS(6)
														  #if SHADER_TARGET >= 30
														  float4 lmap : TEXCOORD7;
														  #endif
														  UNITY_VERTEX_INPUT_INSTANCE_ID
														  UNITY_VERTEX_OUTPUT_STEREO
														};
														#endif
														#endif
														// with lightmaps:
														#ifdef LIGHTMAP_ON
														// half-precision fragment shader registers:
														#ifdef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
														#define FOG_COMBINED_WITH_TSPACE
														struct v2f_surf {
														  UNITY_POSITION(pos);
														  float4 pack0 : TEXCOORD0; // _texcoord _texcoord2
														  float4 tSpace0 : TEXCOORD1;
														  float4 tSpace1 : TEXCOORD2;
														  float4 tSpace2 : TEXCOORD3;
														  float4 lmap : TEXCOORD4;
														  UNITY_LIGHTING_COORDS(5,6)
														  UNITY_VERTEX_INPUT_INSTANCE_ID
														  UNITY_VERTEX_OUTPUT_STEREO
														};
														#endif
														// high-precision fragment shader registers:
														#ifndef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
														struct v2f_surf {
														  UNITY_POSITION(pos);
														  float4 pack0 : TEXCOORD0; // _texcoord _texcoord2
														  float4 tSpace0 : TEXCOORD1;
														  float4 tSpace1 : TEXCOORD2;
														  float4 tSpace2 : TEXCOORD3;
														  float4 lmap : TEXCOORD4;
														  UNITY_FOG_COORDS(5)
														  UNITY_SHADOW_COORDS(6)
														  UNITY_VERTEX_INPUT_INSTANCE_ID
														  UNITY_VERTEX_OUTPUT_STEREO
														};
														#endif
														#endif
														float4 _texcoord_ST;
														float4 _texcoord2_ST;

														// vertex shader
														v2f_surf vert_surf(appdata_full v) {
														  UNITY_SETUP_INSTANCE_ID(v);
														  v2f_surf o;
														  UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
														  UNITY_TRANSFER_INSTANCE_ID(v,o);
														  UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
														  o.pos = UnityObjectToClipPos(v.vertex);
														  o.pack0.xy = TRANSFORM_TEX(v.texcoord, _texcoord);
														  o.pack0.zw = TRANSFORM_TEX(v.texcoord1, _texcoord2);
														  float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
														  float3 worldNormal = UnityObjectToWorldNormal(v.normal);
														  fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
														  fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
														  fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
														  o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
														  o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
														  o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
														  #ifdef DYNAMICLIGHTMAP_ON
														  o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
														  #endif
														  #ifdef LIGHTMAP_ON
														  o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
														  #endif

														  // SH/ambient and vertex lights
														  #ifndef LIGHTMAP_ON
															#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
															  o.sh = 0;
															  // Approximated illumination from non-important point lights
															  #ifdef VERTEXLIGHT_ON
																o.sh += Shade4PointLights(
																  unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
																  unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
																  unity_4LightAtten0, worldPos, worldNormal);
															  #endif
															  o.sh = ShadeSHPerVertex(worldNormal, o.sh);
															#endif
														  #endif // !LIGHTMAP_ON

														  UNITY_TRANSFER_LIGHTING(o,v.texcoord1.xy); // pass shadow and, possibly, light cookie coordinates to pixel shader
														  #ifdef FOG_COMBINED_WITH_TSPACE
															UNITY_TRANSFER_FOG_COMBINED_WITH_TSPACE(o,o.pos); // pass fog coordinates to pixel shader
														  #elif defined (FOG_COMBINED_WITH_WORLD_POS)
															UNITY_TRANSFER_FOG_COMBINED_WITH_WORLD_POS(o,o.pos); // pass fog coordinates to pixel shader
														  #else
															UNITY_TRANSFER_FOG(o,o.pos); // pass fog coordinates to pixel shader
														  #endif
														  return o;
														}

														// fragment shader
														fixed4 frag_surf(v2f_surf IN) : SV_Target {
														  UNITY_SETUP_INSTANCE_ID(IN);
														  UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);
														  // prepare and unpack data
														  Input surfIN;
														  #ifdef FOG_COMBINED_WITH_TSPACE
															UNITY_EXTRACT_FOG_FROM_TSPACE(IN);
														  #elif defined (FOG_COMBINED_WITH_WORLD_POS)
															UNITY_EXTRACT_FOG_FROM_WORLD_POS(IN);
														  #else
															UNITY_EXTRACT_FOG(IN);
														  #endif
														  #ifdef FOG_COMBINED_WITH_TSPACE
															UNITY_RECONSTRUCT_TBN(IN);
														  #else
															UNITY_EXTRACT_TBN(IN);
														  #endif
														  UNITY_INITIALIZE_OUTPUT(Input,surfIN);
														  surfIN.uv_texcoord.x = 1.0;
														  surfIN.uv2_texcoord2.x = 1.0;
														  surfIN.uv_texcoord = IN.pack0.xy;
														  surfIN.uv2_texcoord2 = IN.pack0.zw;
														  float3 worldPos = float3(IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w);
														  #ifndef USING_DIRECTIONAL_LIGHT
															fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
														  #else
															fixed3 lightDir = _WorldSpaceLightPos0.xyz;
														  #endif
														  float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
														  #ifdef UNITY_COMPILER_HLSL
														  SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
														  #else
														  SurfaceOutputStandardSpecular o;
														  #endif
														  o.Albedo = 0.0;
														  o.Emission = 0.0;
														  o.Specular = 0.0;
														  o.Alpha = 0.0;
														  o.Occlusion = 1.0;
														  fixed3 normalWorldVertex = fixed3(0,0,1);
														  o.Normal = fixed3(0,0,1);

														  // call surface function
														  surf(surfIN, o);

														  // compute lighting & shadowing factor
														  UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
														  fixed4 c = 0;
														  float3 worldN;
														  worldN.x = dot(_unity_tbn_0, o.Normal);
														  worldN.y = dot(_unity_tbn_1, o.Normal);
														  worldN.z = dot(_unity_tbn_2, o.Normal);
														  worldN = normalize(worldN);
														  o.Normal = worldN;

														  // Setup lighting environment
														  UnityGI gi;
														  UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
														  gi.indirect.diffuse = 0;
														  gi.indirect.specular = 0;
														  gi.light.color = _LightColor0.rgb;
														  gi.light.dir = lightDir;
														  // Call GI (lightmaps/SH/reflections) lighting function
														  UnityGIInput giInput;
														  UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
														  giInput.light = gi.light;
														  giInput.worldPos = worldPos;
														  giInput.worldViewDir = worldViewDir;
														  giInput.atten = atten;
														  #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
															giInput.lightmapUV = IN.lmap;
														  #else
															giInput.lightmapUV = 0.0;
														  #endif
														  #if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
															giInput.ambient = IN.sh;
														  #else
															giInput.ambient.rgb = 0.0;
														  #endif
														  giInput.probeHDR[0] = unity_SpecCube0_HDR;
														  giInput.probeHDR[1] = unity_SpecCube1_HDR;
														  #if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
															giInput.boxMin[0] = unity_SpecCube0_BoxMin; // .w holds lerp value for blending
														  #endif
														  #ifdef UNITY_SPECCUBE_BOX_PROJECTION
															giInput.boxMax[0] = unity_SpecCube0_BoxMax;
															giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
															giInput.boxMax[1] = unity_SpecCube1_BoxMax;
															giInput.boxMin[1] = unity_SpecCube1_BoxMin;
															giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
														  #endif
														  LightingStandardSpecular_GI(o, giInput, gi);

														  // realtime lighting: call lighting function
														  c += LightingStandardSpecular(o, worldViewDir, gi);
														  UNITY_APPLY_FOG(_unity_fogCoord, c); // apply fog
														  return c;
														}


														#endif


														ENDCG

														}





			// ---- shadow caster pass:
			Pass {
				Name "ShadowCaster"
				Tags { "LightMode" = "ShadowCaster" }
				ZWrite On ZTest LEqual

		CGPROGRAM
															// compile directives
															#pragma vertex vert_surf
															#pragma fragment frag_surf
															#pragma target 3.0
															#pragma shader_feature_local _USEOPACITYCUT_ON
															#pragma multi_compile_instancing
															#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2 SHADOWS_DEPTH SHADOWS_CUBE
															#pragma multi_compile_shadowcaster
															#include "HLSLSupport.cginc"
															#define UNITY_INSTANCED_LOD_FADE
															#define UNITY_INSTANCED_SH
															#define UNITY_INSTANCED_LIGHTMAPSTS
															#include "UnityShaderVariables.cginc"
															#include "UnityShaderUtilities.cginc"
															// -------- variant for: <when no other keywords are defined>
															#if !defined(INSTANCING_ON) && !defined(_USEOPACITYCUT_ON)
															// Surface shader code generated based on:
															// writes to per-pixel normal: YES
															// writes to emission: no
															// writes to occlusion: no
															// needs world space reflection vector: no
															// needs world space normal vector: no
															// needs screen space position: no
															// needs world space position: no
															// needs view direction: no
															// needs world space view direction: no
															// needs world space position for lighting: YES
															// needs world space view direction for lighting: YES
															// needs world space view direction for lightmaps: no
															// needs vertex color: no
															// needs VFACE: no
															// needs SV_IsFrontFace: no
															// passes tangent-to-world matrix to pixel shader: YES
															// reads from normal: no
															// 1 texcoords actually used
															//   float2 _texcoord
															#include "UnityCG.cginc"
															#include "Lighting.cginc"
															#include "UnityPBSLighting.cginc"

															#define INTERNAL_DATA
															#define WorldReflectionVector(data,normal) data.worldRefl
															#define WorldNormalVector(data,normal) normal

															// Original surface shader snippet:
															#line 20 ""
															#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
															#endif
															/* UNITY: Original start of shader */
																	//#pragma target 3.0
																	//#pragma shader_feature_local _USEOPACITYCUT_ON
																	//#pragma surface surf StandardSpecular keepalpha addshadow fullforwardshadows 
																	struct Input
																	{
																		float2 uv_texcoord;
																		float2 uv2_texcoord2;
																	};

																	uniform sampler2D _Diffuse;
																	uniform float4 _Diffuse_ST;
																	uniform float _DiffuseBrightness;
																	uniform sampler2D _TextureSample4;
																	uniform float4 _Color1;
																	uniform float _Cutoff = 0.5;

																	void surf(Input i , inout SurfaceOutputStandardSpecular o)
																	{
																		o.Normal = float3(0,0,1);
																		float2 uv_Diffuse = i.uv_texcoord * _Diffuse_ST.xy + _Diffuse_ST.zw;
																		float4 tex2DNode6 = tex2D(_Diffuse, uv_Diffuse);
																		o.Albedo = ((tex2DNode6 * _DiffuseBrightness) * (tex2D(_TextureSample4, i.uv2_texcoord2) * _Color1)).rgb;
																		o.Smoothness = 0.0;
																		o.Alpha = 1;
																		#ifdef _USEOPACITYCUT_ON
																			float staticSwitch174 = 1.0;
																		#else
																			float staticSwitch174 = tex2DNode6.a;
																		#endif
																		clip(staticSwitch174 - _Cutoff);
																	}



																	// vertex-to-fragment interpolation data
																	struct v2f_surf {
																	  V2F_SHADOW_CASTER;
																	  float2 pack0 : TEXCOORD1; // _texcoord
																	  float3 worldPos : TEXCOORD2;
																	  UNITY_VERTEX_INPUT_INSTANCE_ID
																	  UNITY_VERTEX_OUTPUT_STEREO
																	};
																	float4 _texcoord_ST;

																	// vertex shader
																	v2f_surf vert_surf(appdata_full v) {
																	  UNITY_SETUP_INSTANCE_ID(v);
																	  v2f_surf o;
																	  UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
																	  UNITY_TRANSFER_INSTANCE_ID(v,o);
																	  UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
																	  o.pack0.xy = TRANSFORM_TEX(v.texcoord, _texcoord);
																	  float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
																	  float3 worldNormal = UnityObjectToWorldNormal(v.normal);
																	  o.worldPos.xyz = worldPos;
																	  TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
																	  return o;
																	}

																	// fragment shader
																	fixed4 frag_surf(v2f_surf IN) : SV_Target {
																	  UNITY_SETUP_INSTANCE_ID(IN);
																	  UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);
																	  // prepare and unpack data
																	  Input surfIN;
																	  #ifdef FOG_COMBINED_WITH_TSPACE
																		UNITY_EXTRACT_FOG_FROM_TSPACE(IN);
																	  #elif defined (FOG_COMBINED_WITH_WORLD_POS)
																		UNITY_EXTRACT_FOG_FROM_WORLD_POS(IN);
																	  #else
																		UNITY_EXTRACT_FOG(IN);
																	  #endif
																	  UNITY_INITIALIZE_OUTPUT(Input,surfIN);
																	  surfIN.uv_texcoord.x = 1.0;
																	  surfIN.uv2_texcoord2.x = 1.0;
																	  surfIN.uv_texcoord = IN.pack0.xy;
																	  float3 worldPos = IN.worldPos.xyz;
																	  #ifndef USING_DIRECTIONAL_LIGHT
																		fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
																	  #else
																		fixed3 lightDir = _WorldSpaceLightPos0.xyz;
																	  #endif
																	  #ifdef UNITY_COMPILER_HLSL
																	  SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
																	  #else
																	  SurfaceOutputStandardSpecular o;
																	  #endif
																	  o.Albedo = 0.0;
																	  o.Emission = 0.0;
																	  o.Specular = 0.0;
																	  o.Alpha = 0.0;
																	  o.Occlusion = 1.0;
																	  fixed3 normalWorldVertex = fixed3(0,0,1);

																	  // call surface function
																	  surf(surfIN, o);
																	  SHADOW_CASTER_FRAGMENT(IN)
																	}


																	#endif

																		// -------- variant for: _USEOPACITYCUT_ON 
																		#if defined(_USEOPACITYCUT_ON) && !defined(INSTANCING_ON)
																		// Surface shader code generated based on:
																		// writes to per-pixel normal: YES
																		// writes to emission: no
																		// writes to occlusion: no
																		// needs world space reflection vector: no
																		// needs world space normal vector: no
																		// needs screen space position: no
																		// needs world space position: no
																		// needs view direction: no
																		// needs world space view direction: no
																		// needs world space position for lighting: YES
																		// needs world space view direction for lighting: YES
																		// needs world space view direction for lightmaps: no
																		// needs vertex color: no
																		// needs VFACE: no
																		// needs SV_IsFrontFace: no
																		// passes tangent-to-world matrix to pixel shader: YES
																		// reads from normal: no
																		// 0 texcoords actually used
																		#include "UnityCG.cginc"
																		#include "Lighting.cginc"
																		#include "UnityPBSLighting.cginc"

																		#define INTERNAL_DATA
																		#define WorldReflectionVector(data,normal) data.worldRefl
																		#define WorldNormalVector(data,normal) normal

																		// Original surface shader snippet:
																		#line 20 ""
																		#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
																		#endif
																		/* UNITY: Original start of shader */
																				//#pragma target 3.0
																				//#pragma shader_feature_local _USEOPACITYCUT_ON
																				//#pragma surface surf StandardSpecular keepalpha addshadow fullforwardshadows 
																				struct Input
																				{
																					float2 uv_texcoord;
																					float2 uv2_texcoord2;
																				};

																				uniform sampler2D _Diffuse;
																				uniform float4 _Diffuse_ST;
																				uniform float _DiffuseBrightness;
																				uniform sampler2D _TextureSample4;
																				uniform float4 _Color1;
																				uniform float _Cutoff = 0.5;

																				void surf(Input i , inout SurfaceOutputStandardSpecular o)
																				{
																					o.Normal = float3(0,0,1);
																					float2 uv_Diffuse = i.uv_texcoord * _Diffuse_ST.xy + _Diffuse_ST.zw;
																					float4 tex2DNode6 = tex2D(_Diffuse, uv_Diffuse);
																					o.Albedo = ((tex2DNode6 * _DiffuseBrightness) * (tex2D(_TextureSample4, i.uv2_texcoord2) * _Color1)).rgb;
																					o.Smoothness = 0.0;
																					o.Alpha = 1;
																					#ifdef _USEOPACITYCUT_ON
																						float staticSwitch174 = 1.0;
																					#else
																						float staticSwitch174 = tex2DNode6.a;
																					#endif
																					clip(staticSwitch174 - _Cutoff);
																				}



																				// vertex-to-fragment interpolation data
																				struct v2f_surf {
																				  V2F_SHADOW_CASTER;
																				  float3 worldPos : TEXCOORD1;
																				  UNITY_VERTEX_INPUT_INSTANCE_ID
																				  UNITY_VERTEX_OUTPUT_STEREO
																				};

																				// vertex shader
																				v2f_surf vert_surf(appdata_full v) {
																				  UNITY_SETUP_INSTANCE_ID(v);
																				  v2f_surf o;
																				  UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
																				  UNITY_TRANSFER_INSTANCE_ID(v,o);
																				  UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
																				  float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
																				  float3 worldNormal = UnityObjectToWorldNormal(v.normal);
																				  o.worldPos.xyz = worldPos;
																				  TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
																				  return o;
																				}

																				// fragment shader
																				fixed4 frag_surf(v2f_surf IN) : SV_Target {
																				  UNITY_SETUP_INSTANCE_ID(IN);
																				  UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);
																				  // prepare and unpack data
																				  Input surfIN;
																				  #ifdef FOG_COMBINED_WITH_TSPACE
																					UNITY_EXTRACT_FOG_FROM_TSPACE(IN);
																				  #elif defined (FOG_COMBINED_WITH_WORLD_POS)
																					UNITY_EXTRACT_FOG_FROM_WORLD_POS(IN);
																				  #else
																					UNITY_EXTRACT_FOG(IN);
																				  #endif
																				  UNITY_INITIALIZE_OUTPUT(Input,surfIN);
																				  surfIN.uv_texcoord.x = 1.0;
																				  surfIN.uv2_texcoord2.x = 1.0;
																				  float3 worldPos = IN.worldPos.xyz;
																				  #ifndef USING_DIRECTIONAL_LIGHT
																					fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
																				  #else
																					fixed3 lightDir = _WorldSpaceLightPos0.xyz;
																				  #endif
																				  #ifdef UNITY_COMPILER_HLSL
																				  SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
																				  #else
																				  SurfaceOutputStandardSpecular o;
																				  #endif
																				  o.Albedo = 0.0;
																				  o.Emission = 0.0;
																				  o.Specular = 0.0;
																				  o.Alpha = 0.0;
																				  o.Occlusion = 1.0;
																				  fixed3 normalWorldVertex = fixed3(0,0,1);

																				  // call surface function
																				  surf(surfIN, o);
																				  SHADOW_CASTER_FRAGMENT(IN)
																				}


																				#endif

																					// -------- variant for: INSTANCING_ON 
																					#if defined(INSTANCING_ON) && !defined(_USEOPACITYCUT_ON)
																					// Surface shader code generated based on:
																					// writes to per-pixel normal: YES
																					// writes to emission: no
																					// writes to occlusion: no
																					// needs world space reflection vector: no
																					// needs world space normal vector: no
																					// needs screen space position: no
																					// needs world space position: no
																					// needs view direction: no
																					// needs world space view direction: no
																					// needs world space position for lighting: YES
																					// needs world space view direction for lighting: YES
																					// needs world space view direction for lightmaps: no
																					// needs vertex color: no
																					// needs VFACE: no
																					// needs SV_IsFrontFace: no
																					// passes tangent-to-world matrix to pixel shader: YES
																					// reads from normal: no
																					// 1 texcoords actually used
																					//   float2 _texcoord
																					#include "UnityCG.cginc"
																					#include "Lighting.cginc"
																					#include "UnityPBSLighting.cginc"

																					#define INTERNAL_DATA
																					#define WorldReflectionVector(data,normal) data.worldRefl
																					#define WorldNormalVector(data,normal) normal

																					// Original surface shader snippet:
																					#line 20 ""
																					#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
																					#endif
																					/* UNITY: Original start of shader */
																							//#pragma target 3.0
																							//#pragma shader_feature_local _USEOPACITYCUT_ON
																							//#pragma surface surf StandardSpecular keepalpha addshadow fullforwardshadows 
																							struct Input
																							{
																								float2 uv_texcoord;
																								float2 uv2_texcoord2;
																							};

																							uniform sampler2D _Diffuse;
																							uniform float4 _Diffuse_ST;
																							uniform float _DiffuseBrightness;
																							uniform sampler2D _TextureSample4;
																							uniform float4 _Color1;
																							uniform float _Cutoff = 0.5;

																							void surf(Input i , inout SurfaceOutputStandardSpecular o)
																							{
																								o.Normal = float3(0,0,1);
																								float2 uv_Diffuse = i.uv_texcoord * _Diffuse_ST.xy + _Diffuse_ST.zw;
																								float4 tex2DNode6 = tex2D(_Diffuse, uv_Diffuse);
																								o.Albedo = ((tex2DNode6 * _DiffuseBrightness) * (tex2D(_TextureSample4, i.uv2_texcoord2) * _Color1)).rgb;
																								o.Smoothness = 0.0;
																								o.Alpha = 1;
																								#ifdef _USEOPACITYCUT_ON
																									float staticSwitch174 = 1.0;
																								#else
																									float staticSwitch174 = tex2DNode6.a;
																								#endif
																								clip(staticSwitch174 - _Cutoff);
																							}



																							// vertex-to-fragment interpolation data
																							struct v2f_surf {
																							  V2F_SHADOW_CASTER;
																							  float2 pack0 : TEXCOORD1; // _texcoord
																							  float3 worldPos : TEXCOORD2;
																							  UNITY_VERTEX_INPUT_INSTANCE_ID
																							  UNITY_VERTEX_OUTPUT_STEREO
																							};
																							float4 _texcoord_ST;

																							// vertex shader
																							v2f_surf vert_surf(appdata_full v) {
																							  UNITY_SETUP_INSTANCE_ID(v);
																							  v2f_surf o;
																							  UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
																							  UNITY_TRANSFER_INSTANCE_ID(v,o);
																							  UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
																							  o.pack0.xy = TRANSFORM_TEX(v.texcoord, _texcoord);
																							  float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
																							  float3 worldNormal = UnityObjectToWorldNormal(v.normal);
																							  o.worldPos.xyz = worldPos;
																							  TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
																							  return o;
																							}

																							// fragment shader
																							fixed4 frag_surf(v2f_surf IN) : SV_Target {
																							  UNITY_SETUP_INSTANCE_ID(IN);
																							  UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);
																							  // prepare and unpack data
																							  Input surfIN;
																							  #ifdef FOG_COMBINED_WITH_TSPACE
																								UNITY_EXTRACT_FOG_FROM_TSPACE(IN);
																							  #elif defined (FOG_COMBINED_WITH_WORLD_POS)
																								UNITY_EXTRACT_FOG_FROM_WORLD_POS(IN);
																							  #else
																								UNITY_EXTRACT_FOG(IN);
																							  #endif
																							  UNITY_INITIALIZE_OUTPUT(Input,surfIN);
																							  surfIN.uv_texcoord.x = 1.0;
																							  surfIN.uv2_texcoord2.x = 1.0;
																							  surfIN.uv_texcoord = IN.pack0.xy;
																							  float3 worldPos = IN.worldPos.xyz;
																							  #ifndef USING_DIRECTIONAL_LIGHT
																								fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
																							  #else
																								fixed3 lightDir = _WorldSpaceLightPos0.xyz;
																							  #endif
																							  #ifdef UNITY_COMPILER_HLSL
																							  SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
																							  #else
																							  SurfaceOutputStandardSpecular o;
																							  #endif
																							  o.Albedo = 0.0;
																							  o.Emission = 0.0;
																							  o.Specular = 0.0;
																							  o.Alpha = 0.0;
																							  o.Occlusion = 1.0;
																							  fixed3 normalWorldVertex = fixed3(0,0,1);

																							  // call surface function
																							  surf(surfIN, o);
																							  SHADOW_CASTER_FRAGMENT(IN)
																							}


																							#endif

																								// -------- variant for: INSTANCING_ON _USEOPACITYCUT_ON 
																								#if defined(INSTANCING_ON) && defined(_USEOPACITYCUT_ON)
																								// Surface shader code generated based on:
																								// writes to per-pixel normal: YES
																								// writes to emission: no
																								// writes to occlusion: no
																								// needs world space reflection vector: no
																								// needs world space normal vector: no
																								// needs screen space position: no
																								// needs world space position: no
																								// needs view direction: no
																								// needs world space view direction: no
																								// needs world space position for lighting: YES
																								// needs world space view direction for lighting: YES
																								// needs world space view direction for lightmaps: no
																								// needs vertex color: no
																								// needs VFACE: no
																								// needs SV_IsFrontFace: no
																								// passes tangent-to-world matrix to pixel shader: YES
																								// reads from normal: no
																								// 0 texcoords actually used
																								#include "UnityCG.cginc"
																								#include "Lighting.cginc"
																								#include "UnityPBSLighting.cginc"

																								#define INTERNAL_DATA
																								#define WorldReflectionVector(data,normal) data.worldRefl
																								#define WorldNormalVector(data,normal) normal

																								// Original surface shader snippet:
																								#line 20 ""
																								#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
																								#endif
																								/* UNITY: Original start of shader */
																										//#pragma target 3.0
																										//#pragma shader_feature_local _USEOPACITYCUT_ON
																										//#pragma surface surf StandardSpecular keepalpha addshadow fullforwardshadows 
																										struct Input
																										{
																											float2 uv_texcoord;
																											float2 uv2_texcoord2;
																										};

																										uniform sampler2D _Diffuse;
																										uniform float4 _Diffuse_ST;
																										uniform float _DiffuseBrightness;
																										uniform sampler2D _TextureSample4;
																										uniform float4 _Color1;
																										uniform float _Cutoff = 0.5;

																										void surf(Input i , inout SurfaceOutputStandardSpecular o)
																										{
																											o.Normal = float3(0,0,1);
																											float2 uv_Diffuse = i.uv_texcoord * _Diffuse_ST.xy + _Diffuse_ST.zw;
																											float4 tex2DNode6 = tex2D(_Diffuse, uv_Diffuse);
																											o.Albedo = ((tex2DNode6 * _DiffuseBrightness) * (tex2D(_TextureSample4, i.uv2_texcoord2) * _Color1)).rgb;
																											o.Smoothness = 0.0;
																											o.Alpha = 1;
																											#ifdef _USEOPACITYCUT_ON
																												float staticSwitch174 = 1.0;
																											#else
																												float staticSwitch174 = tex2DNode6.a;
																											#endif
																											clip(staticSwitch174 - _Cutoff);
																										}



																										// vertex-to-fragment interpolation data
																										struct v2f_surf {
																										  V2F_SHADOW_CASTER;
																										  float3 worldPos : TEXCOORD1;
																										  UNITY_VERTEX_INPUT_INSTANCE_ID
																										  UNITY_VERTEX_OUTPUT_STEREO
																										};

																										// vertex shader
																										v2f_surf vert_surf(appdata_full v) {
																										  UNITY_SETUP_INSTANCE_ID(v);
																										  v2f_surf o;
																										  UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
																										  UNITY_TRANSFER_INSTANCE_ID(v,o);
																										  UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
																										  float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
																										  float3 worldNormal = UnityObjectToWorldNormal(v.normal);
																										  o.worldPos.xyz = worldPos;
																										  TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
																										  return o;
																										}

																										// fragment shader
																										fixed4 frag_surf(v2f_surf IN) : SV_Target {
																										  UNITY_SETUP_INSTANCE_ID(IN);
																										  UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);
																										  // prepare and unpack data
																										  Input surfIN;
																										  #ifdef FOG_COMBINED_WITH_TSPACE
																											UNITY_EXTRACT_FOG_FROM_TSPACE(IN);
																										  #elif defined (FOG_COMBINED_WITH_WORLD_POS)
																											UNITY_EXTRACT_FOG_FROM_WORLD_POS(IN);
																										  #else
																											UNITY_EXTRACT_FOG(IN);
																										  #endif
																										  UNITY_INITIALIZE_OUTPUT(Input,surfIN);
																										  surfIN.uv_texcoord.x = 1.0;
																										  surfIN.uv2_texcoord2.x = 1.0;
																										  float3 worldPos = IN.worldPos.xyz;
																										  #ifndef USING_DIRECTIONAL_LIGHT
																											fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
																										  #else
																											fixed3 lightDir = _WorldSpaceLightPos0.xyz;
																										  #endif
																										  #ifdef UNITY_COMPILER_HLSL
																										  SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
																										  #else
																										  SurfaceOutputStandardSpecular o;
																										  #endif
																										  o.Albedo = 0.0;
																										  o.Emission = 0.0;
																										  o.Specular = 0.0;
																										  o.Alpha = 0.0;
																										  o.Occlusion = 1.0;
																										  fixed3 normalWorldVertex = fixed3(0,0,1);

																										  // call surface function
																										  surf(surfIN, o);
																										  SHADOW_CASTER_FRAGMENT(IN)
																										}


																										#endif


																										ENDCG

																										}



		}
			CustomEditor "ASEMaterialInspector"
}
