Shader "YESSSSS"
{
	Properties
	{
		[NoScaleOffset]Texture2D_0a61719aa2ac4656a8ca661fb9b12425("ToonRamp", 2D) = "white" {}
		[NoScaleOffset]Texture2D_4c8109b3fd8b48968abc0c10fc765a06("DiffuseTexture", 2D) = "white" {}
		Vector1_8aa5e25adec34bdabf733d9a643aaf71("Smoothness", Float) = 0
		Vector1_73ff9ffb74dd4d0687b6353354f5147f("HueShift", Range(0, 1)) = 1
		Vector1_366094730b0e4d7cb16f896c6e8f21f0("SaturationShift", Range(0, 100)) = 1
		_PositionP("PlayerPosition", Vector) = (0.5, 0.5, 0, 0)
		_SizeS("Size", Float) = 1
		Vector1_983e66acc7c84eeebb58420303a45a77("Smoothness (1)", Range(0, 10)) = 0.5
		Vector1_a65e3ce5f90b4c989b988ad54dfc8ca4("Opacity", Range(0, 1)) = 0.5
		[HideInInspector][NoScaleOffset]unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
		[HideInInspector][NoScaleOffset]unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
		[HideInInspector][NoScaleOffset]unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}




	}
		SubShader
	{
		Tags
		{
			"RenderPipeline" = "UniversalPipeline"
			"RenderType" = "Transparent"
			"UniversalMaterialType" = "Unlit"
			"Queue" = "Transparent"
		}
		Pass
		{
			Name "Pass"
			Tags
			{
		// LightMode: <None>
	}

	// Render State
	Cull Back
	Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
	ZTest LEqual
	ZWrite On

		// Debug
		// <None>

		// --------------------------------------------------
		// Pass

		HLSLPROGRAM

		// Pragmas
		#pragma target 2.0
		#pragma only_renderers gles gles3 glcore
		#pragma multi_compile_instancing
		#pragma multi_compile_fog
		#pragma vertex vert
		#pragma fragment frag

		// DotsInstancingOptions: <None>
		// HybridV1InjectedBuiltinProperties: <None>

		// Keywords
		#pragma multi_compile _ LIGHTMAP_ON
		#pragma multi_compile _ DIRLIGHTMAP_COMBINED
		#pragma shader_feature _ _SAMPLE_GI
		#pragma multi_compile_local _ MAIN_LIGHT_CALCULATE_SHADOWS
		#pragma multi_compile_local _ _MAIN_LIGHT_SHADOWS_CASCADE
		#pragma multi_compile_local _ _SHADOWS_SOFT
		#pragma multi_compile_local _ ADDITIONAL_LIGHT_CALCULATE_SHADOWS

		#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
			#define KEYWORD_PERMUTATION_0
		#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT)
			#define KEYWORD_PERMUTATION_1
		#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
			#define KEYWORD_PERMUTATION_2
		#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE)
			#define KEYWORD_PERMUTATION_3
		#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
			#define KEYWORD_PERMUTATION_4
		#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_SHADOWS_SOFT)
			#define KEYWORD_PERMUTATION_5
		#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
			#define KEYWORD_PERMUTATION_6
		#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
			#define KEYWORD_PERMUTATION_7
		#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
			#define KEYWORD_PERMUTATION_8
		#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT)
			#define KEYWORD_PERMUTATION_9
		#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
			#define KEYWORD_PERMUTATION_10
		#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE)
			#define KEYWORD_PERMUTATION_11
		#elif defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
			#define KEYWORD_PERMUTATION_12
		#elif defined(_SHADOWS_SOFT)
			#define KEYWORD_PERMUTATION_13
		#elif defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
			#define KEYWORD_PERMUTATION_14
		#else
			#define KEYWORD_PERMUTATION_15
		#endif


		// Defines
	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
	#define _SURFACE_TYPE_TRANSPARENT 1
	#endif

	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
	#define _AlphaClip 1
	#endif

	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
	#define ATTRIBUTES_NEED_NORMAL
	#endif

	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
	#define ATTRIBUTES_NEED_TANGENT
	#endif

	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
	#define ATTRIBUTES_NEED_TEXCOORD0
	#endif

	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
	#define VARYINGS_NEED_POSITION_WS
	#endif

	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
	#define VARYINGS_NEED_NORMAL_WS
	#endif

	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
	#define VARYINGS_NEED_TEXCOORD0
	#endif

	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
	#define VARYINGS_NEED_VIEWDIRECTION_WS
	#endif

		#define FEATURES_GRAPH_VERTEX
		/* WARNING: $splice Could not find named fragment 'PassInstancing' */
		#define SHADERPASS SHADERPASS_UNLIT
		/* WARNING: $splice Could not find named fragment 'DotsInstancingVars' */

		// Includes
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
		#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
		#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
		#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

		// --------------------------------------------------
		// Structs and Packing

		struct Attributes
		{
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float3 positionOS : POSITION;
			#endif
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float3 normalOS : NORMAL;
			#endif
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float4 tangentOS : TANGENT;
			#endif
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float4 uv0 : TEXCOORD0;
			#endif
			#if UNITY_ANY_INSTANCING_ENABLED
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			uint instanceID : INSTANCEID_SEMANTIC;
			#endif
			#endif
		};
		struct Varyings
		{
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float4 positionCS : SV_POSITION;
			#endif
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float3 positionWS;
			#endif
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float3 normalWS;
			#endif
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float4 texCoord0;
			#endif
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float3 viewDirectionWS;
			#endif
			#if UNITY_ANY_INSTANCING_ENABLED
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			uint instanceID : CUSTOM_INSTANCE_ID;
			#endif
			#endif
			#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
			#endif
			#endif
			#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
			#endif
			#endif
			#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
			#endif
			#endif
		};
		struct SurfaceDescriptionInputs
		{
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float3 WorldSpaceNormal;
			#endif
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float3 WorldSpaceViewDirection;
			#endif
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float3 WorldSpacePosition;
			#endif
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float3 AbsoluteWorldSpacePosition;
			#endif
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float4 ScreenPosition;
			#endif
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float4 uv0;
			#endif
		};
		struct VertexDescriptionInputs
		{
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float3 ObjectSpaceNormal;
			#endif
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float3 ObjectSpaceTangent;
			#endif
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float3 ObjectSpacePosition;
			#endif
		};
		struct PackedVaryings
		{
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float4 positionCS : SV_POSITION;
			#endif
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float3 interp0 : TEXCOORD0;
			#endif
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float3 interp1 : TEXCOORD1;
			#endif
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float4 interp2 : TEXCOORD2;
			#endif
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			float3 interp3 : TEXCOORD3;
			#endif
			#if UNITY_ANY_INSTANCING_ENABLED
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			uint instanceID : CUSTOM_INSTANCE_ID;
			#endif
			#endif
			#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
			#endif
			#endif
			#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
			#endif
			#endif
			#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
			FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
			#endif
			#endif
		};

		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
		PackedVaryings PackVaryings(Varyings input)
			{
				PackedVaryings output;
				output.positionCS = input.positionCS;
				output.interp0.xyz = input.positionWS;
				output.interp1.xyz = input.normalWS;
				output.interp2.xyzw = input.texCoord0;
				output.interp3.xyz = input.viewDirectionWS;
				#if UNITY_ANY_INSTANCING_ENABLED
				output.instanceID = input.instanceID;
				#endif
				#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
				output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
				#endif
				#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
				output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
				#endif
				#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
				output.cullFace = input.cullFace;
				#endif
				return output;
			}
			Varyings UnpackVaryings(PackedVaryings input)
			{
				Varyings output;
				output.positionCS = input.positionCS;
				output.positionWS = input.interp0.xyz;
				output.normalWS = input.interp1.xyz;
				output.texCoord0 = input.interp2.xyzw;
				output.viewDirectionWS = input.interp3.xyz;
				#if UNITY_ANY_INSTANCING_ENABLED
				output.instanceID = input.instanceID;
				#endif
				#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
				output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
				#endif
				#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
				output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
				#endif
				#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
				output.cullFace = input.cullFace;
				#endif
				return output;
			}
		#endif

			// --------------------------------------------------
			// Graph

			// Graph Properties
			CBUFFER_START(UnityPerMaterial)
			float4 Texture2D_0a61719aa2ac4656a8ca661fb9b12425_TexelSize;
			float4 Texture2D_4c8109b3fd8b48968abc0c10fc765a06_TexelSize;
			float Vector1_8aa5e25adec34bdabf733d9a643aaf71;
			float Vector1_73ff9ffb74dd4d0687b6353354f5147f;
			float Vector1_366094730b0e4d7cb16f896c6e8f21f0;
			float2 _PositionP;
			float _SizeS;
			float Vector1_983e66acc7c84eeebb58420303a45a77;
			float Vector1_a65e3ce5f90b4c989b988ad54dfc8ca4;
			CBUFFER_END

				// Object and Global properties
				TEXTURE2D(Texture2D_0a61719aa2ac4656a8ca661fb9b12425);
				SAMPLER(samplerTexture2D_0a61719aa2ac4656a8ca661fb9b12425);
				TEXTURE2D(Texture2D_4c8109b3fd8b48968abc0c10fc765a06);
				SAMPLER(samplerTexture2D_4c8109b3fd8b48968abc0c10fc765a06);
				SAMPLER(_SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_Sampler_3_Linear_Repeat);
				SAMPLER(SamplerState_Linear_Clamp);

				// Graph Functions

				void Unity_Hue_Normalized_float(float3 In, float Offset, out float3 Out)
				{
					// RGB to HSV
					float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
					float4 P = lerp(float4(In.bg, K.wz), float4(In.gb, K.xy), step(In.b, In.g));
					float4 Q = lerp(float4(P.xyw, In.r), float4(In.r, P.yzx), step(P.x, In.r));
					float D = Q.x - min(Q.w, Q.y);
					float E = 1e-4;
					float3 hsv = float3(abs(Q.z + (Q.w - Q.y) / (6.0 * D + E)), D / (Q.x + E), Q.x);

					float hue = hsv.x + Offset;
					hsv.x = (hue < 0)
							? hue + 1
							: (hue > 1)
								? hue - 1
								: hue;

					// HSV to RGB
					float4 K2 = float4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
					float3 P2 = abs(frac(hsv.xxx + K2.xyz) * 6.0 - K2.www);
					Out = hsv.z * lerp(K2.xxx, saturate(P2 - K2.xxx), hsv.y);
				}

				void Unity_Saturation_float(float3 In, float Saturation, out float3 Out)
				{
					float luma = dot(In, float3(0.2126729, 0.7151522, 0.0721750));
					Out = luma.xxx + Saturation.xxx * (In - luma.xxx);
				}

				// 9ca2a8a42c7c596a4947b3e45af8bd53
				#include "Assets/Shaders/Includes/Lighting.hlsl"

				void Unity_Multiply_float(float A, float B, out float Out)
				{
					Out = A * B;
				}

				void Unity_DotProduct_float3(float3 A, float3 B, out float Out)
				{
					Out = dot(A, B);
				}

				void Unity_Saturate_float(float In, out float Out)
				{
					Out = saturate(In);
				}

				void Unity_Add_float3(float3 A, float3 B, out float3 Out)
				{
					Out = A + B;
				}

				void Unity_Normalize_float3(float3 In, out float3 Out)
				{
					Out = normalize(In);
				}

				void Unity_Add_float(float A, float B, out float Out)
				{
					Out = A + B;
				}

				void Unity_Exponential2_float(float In, out float Out)
				{
					Out = exp2(In);
				}

				struct Bindings_AdjustSmoothness_1f0d48e5497583a44bdffb31bb3df75e
				{
				};

				void SG_AdjustSmoothness_1f0d48e5497583a44bdffb31bb3df75e(float Vector1_92300b3c6e8b4e47b0655851599b0675, Bindings_AdjustSmoothness_1f0d48e5497583a44bdffb31bb3df75e IN, out float Out_1)
				{
					float _Property_221219d8b8a147ef91bbce6cbaba412b_Out_0 = Vector1_92300b3c6e8b4e47b0655851599b0675;
					float _Multiply_340f6bf5d24d4aaa8c2c8144570fd76c_Out_2;
					Unity_Multiply_float(_Property_221219d8b8a147ef91bbce6cbaba412b_Out_0, 10, _Multiply_340f6bf5d24d4aaa8c2c8144570fd76c_Out_2);
					float _Add_0007bea1646c493aaf75ba7e8a4f57bf_Out_2;
					Unity_Add_float(_Multiply_340f6bf5d24d4aaa8c2c8144570fd76c_Out_2, 1, _Add_0007bea1646c493aaf75ba7e8a4f57bf_Out_2);
					float _Exponential_031f9f41b8f6403db8693824caaa6008_Out_1;
					Unity_Exponential2_float(_Add_0007bea1646c493aaf75ba7e8a4f57bf_Out_2, _Exponential_031f9f41b8f6403db8693824caaa6008_Out_1);
					Out_1 = _Exponential_031f9f41b8f6403db8693824caaa6008_Out_1;
				}

				void Unity_Power_float(float A, float B, out float Out)
				{
					Out = pow(A, B);
				}

				struct Bindings_CalculateMainLight_461292f6b16b62549aeb8366345bb7a5
				{
					float3 WorldSpaceNormal;
					float3 WorldSpaceViewDirection;
					float3 AbsoluteWorldSpacePosition;
				};

				void SG_CalculateMainLight_461292f6b16b62549aeb8366345bb7a5(float Vector1_d7231844d8fb429da1fd259435bbbe93, Bindings_CalculateMainLight_461292f6b16b62549aeb8366345bb7a5 IN, out float3 Color_1, out float Diffuse_2, out float Specular_3)
				{
					float3 _CustomFunction_9dde773e33224a229db66bf007a422ed_Direction_1;
					float3 _CustomFunction_9dde773e33224a229db66bf007a422ed_Color_2;
					float _CustomFunction_9dde773e33224a229db66bf007a422ed_DistanceAtten_3;
					float _CustomFunction_9dde773e33224a229db66bf007a422ed_ShadowAtten_4;
					CalculateMainLight_float(IN.AbsoluteWorldSpacePosition, _CustomFunction_9dde773e33224a229db66bf007a422ed_Direction_1, _CustomFunction_9dde773e33224a229db66bf007a422ed_Color_2, _CustomFunction_9dde773e33224a229db66bf007a422ed_DistanceAtten_3, _CustomFunction_9dde773e33224a229db66bf007a422ed_ShadowAtten_4);
					float _Multiply_bcc526cf2b254856bcef8be86a554939_Out_2;
					Unity_Multiply_float(_CustomFunction_9dde773e33224a229db66bf007a422ed_DistanceAtten_3, _CustomFunction_9dde773e33224a229db66bf007a422ed_ShadowAtten_4, _Multiply_bcc526cf2b254856bcef8be86a554939_Out_2);
					float _DotProduct_53ce563ea07a45a196cbea76896406f1_Out_2;
					Unity_DotProduct_float3(_CustomFunction_9dde773e33224a229db66bf007a422ed_Direction_1, IN.WorldSpaceNormal, _DotProduct_53ce563ea07a45a196cbea76896406f1_Out_2);
					float _Saturate_c882e2c669084435ae24e75793861000_Out_1;
					Unity_Saturate_float(_DotProduct_53ce563ea07a45a196cbea76896406f1_Out_2, _Saturate_c882e2c669084435ae24e75793861000_Out_1);
					float _Multiply_cf752347adfe4ce1acc5720b09b138f3_Out_2;
					Unity_Multiply_float(_Multiply_bcc526cf2b254856bcef8be86a554939_Out_2, _Saturate_c882e2c669084435ae24e75793861000_Out_1, _Multiply_cf752347adfe4ce1acc5720b09b138f3_Out_2);
					float3 _Add_1bf26a2e3e584ffca9fe8ae253d477b4_Out_2;
					Unity_Add_float3(_CustomFunction_9dde773e33224a229db66bf007a422ed_Direction_1, IN.WorldSpaceViewDirection, _Add_1bf26a2e3e584ffca9fe8ae253d477b4_Out_2);
					float3 _Normalize_1d7fa61060db4168a5cdca058c45cf8c_Out_1;
					Unity_Normalize_float3(_Add_1bf26a2e3e584ffca9fe8ae253d477b4_Out_2, _Normalize_1d7fa61060db4168a5cdca058c45cf8c_Out_1);
					float _DotProduct_c3574d672061428ea7a2a4f16f3774da_Out_2;
					Unity_DotProduct_float3(IN.WorldSpaceNormal, _Normalize_1d7fa61060db4168a5cdca058c45cf8c_Out_1, _DotProduct_c3574d672061428ea7a2a4f16f3774da_Out_2);
					float _Saturate_ca971a87c15749c287c71e242366e810_Out_1;
					Unity_Saturate_float(_DotProduct_c3574d672061428ea7a2a4f16f3774da_Out_2, _Saturate_ca971a87c15749c287c71e242366e810_Out_1);
					float _Property_7499b0518cf0429bb646a1dc8f1ce4a0_Out_0 = Vector1_d7231844d8fb429da1fd259435bbbe93;
					Bindings_AdjustSmoothness_1f0d48e5497583a44bdffb31bb3df75e _AdjustSmoothness_8262d5b465704040807fa568851dc6d7;
					float _AdjustSmoothness_8262d5b465704040807fa568851dc6d7_Out_1;
					SG_AdjustSmoothness_1f0d48e5497583a44bdffb31bb3df75e(_Property_7499b0518cf0429bb646a1dc8f1ce4a0_Out_0, _AdjustSmoothness_8262d5b465704040807fa568851dc6d7, _AdjustSmoothness_8262d5b465704040807fa568851dc6d7_Out_1);
					float _Power_478980748dd544618cda00e6d75a6f84_Out_2;
					Unity_Power_float(_Saturate_ca971a87c15749c287c71e242366e810_Out_1, _AdjustSmoothness_8262d5b465704040807fa568851dc6d7_Out_1, _Power_478980748dd544618cda00e6d75a6f84_Out_2);
					float _Multiply_1d4463a4bfdc4aed9c821cb37d2a3f82_Out_2;
					Unity_Multiply_float(_Multiply_cf752347adfe4ce1acc5720b09b138f3_Out_2, _Power_478980748dd544618cda00e6d75a6f84_Out_2, _Multiply_1d4463a4bfdc4aed9c821cb37d2a3f82_Out_2);
					Color_1 = _CustomFunction_9dde773e33224a229db66bf007a422ed_Color_2;
					Diffuse_2 = _Multiply_cf752347adfe4ce1acc5720b09b138f3_Out_2;
					Specular_3 = _Multiply_1d4463a4bfdc4aed9c821cb37d2a3f82_Out_2;
				}

				struct Bindings_AddAdditionalLights_e0ca8cced9af1114f8d573bbf9267b91
				{
					float3 WorldSpaceNormal;
					float3 WorldSpaceViewDirection;
					float3 WorldSpacePosition;
				};

				void SG_AddAdditionalLights_e0ca8cced9af1114f8d573bbf9267b91(float Vector1_e3fc3430194347bc9dced066a4393e33, float Vector1_473b9a9f9006435a93128b3fe00e5fbc, float3 Vector3_4a3aa6554972429381fa75348b565937, float Vector1_924164549e4f48bfacd71aa424d9365d, Bindings_AddAdditionalLights_e0ca8cced9af1114f8d573bbf9267b91 IN, out float Diffuse_1, out float Specular_2, out float3 Color_3)
				{
					float _Property_fcfdff7c911f4bda8de84c236b30efc5_Out_0 = Vector1_924164549e4f48bfacd71aa424d9365d;
					Bindings_AdjustSmoothness_1f0d48e5497583a44bdffb31bb3df75e _AdjustSmoothness_29e7995fc47b4af8985d0401272852c3;
					float _AdjustSmoothness_29e7995fc47b4af8985d0401272852c3_Out_1;
					SG_AdjustSmoothness_1f0d48e5497583a44bdffb31bb3df75e(_Property_fcfdff7c911f4bda8de84c236b30efc5_Out_0, _AdjustSmoothness_29e7995fc47b4af8985d0401272852c3, _AdjustSmoothness_29e7995fc47b4af8985d0401272852c3_Out_1);
					float _Property_42736c8a41aa47ac92d9bdfbf8d54c11_Out_0 = Vector1_e3fc3430194347bc9dced066a4393e33;
					float _Property_245d51c3d18245cea338aa94387aa94c_Out_0 = Vector1_473b9a9f9006435a93128b3fe00e5fbc;
					float3 _Property_48c00e8d7da049b1860e05faff89a4e0_Out_0 = Vector3_4a3aa6554972429381fa75348b565937;
					float _CustomFunction_3b42e28b13124ba19b74421f276d7cbc_Diffuse_7;
					float _CustomFunction_3b42e28b13124ba19b74421f276d7cbc_Specular_8;
					float3 _CustomFunction_3b42e28b13124ba19b74421f276d7cbc_Color_9;
					AddAdditionalLights_float(_AdjustSmoothness_29e7995fc47b4af8985d0401272852c3_Out_1, IN.WorldSpaceNormal, IN.WorldSpacePosition, IN.WorldSpaceViewDirection, _Property_42736c8a41aa47ac92d9bdfbf8d54c11_Out_0, _Property_245d51c3d18245cea338aa94387aa94c_Out_0, _Property_48c00e8d7da049b1860e05faff89a4e0_Out_0, _CustomFunction_3b42e28b13124ba19b74421f276d7cbc_Diffuse_7, _CustomFunction_3b42e28b13124ba19b74421f276d7cbc_Specular_8, _CustomFunction_3b42e28b13124ba19b74421f276d7cbc_Color_9);
					Diffuse_1 = _CustomFunction_3b42e28b13124ba19b74421f276d7cbc_Diffuse_7;
					Specular_2 = _CustomFunction_3b42e28b13124ba19b74421f276d7cbc_Specular_8;
					Color_3 = _CustomFunction_3b42e28b13124ba19b74421f276d7cbc_Color_9;
				}

				void Unity_ColorspaceConversion_RGB_HSV_float(float3 In, out float3 Out)
				{
					float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
					float4 P = lerp(float4(In.bg, K.wz), float4(In.gb, K.xy), step(In.b, In.g));
					float4 Q = lerp(float4(P.xyw, In.r), float4(In.r, P.yzx), step(P.x, In.r));
					float D = Q.x - min(Q.w, Q.y);
					float  E = 1e-10;
					Out = float3(abs(Q.z + (Q.w - Q.y) / (6.0 * D + E)), D / (Q.x + E), Q.x);
				}

				void Unity_ColorspaceConversion_HSV_RGB_float(float3 In, out float3 Out)
				{
					float4 K = float4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
					float3 P = abs(frac(In.xxx + K.xyz) * 6.0 - K.www);
					Out = In.z * lerp(K.xxx, saturate(P - K.xxx), In.y);
				}

				struct Bindings_CalculateLights_0c86135d169f3ee4ca18edf1c652f7e3
				{
					float3 WorldSpaceNormal;
					float3 WorldSpaceViewDirection;
					float3 WorldSpacePosition;
					float3 AbsoluteWorldSpacePosition;
				};

				void SG_CalculateLights_0c86135d169f3ee4ca18edf1c652f7e3(float Vector1_7138480fa3104ac4b569fee691e242d3, Bindings_CalculateLights_0c86135d169f3ee4ca18edf1c652f7e3 IN, out float3 Color_1, out float Diffuse_2, out float Specular_3)
				{
					float _Property_ad061012c73c4cc08493cc074115a92b_Out_0 = Vector1_7138480fa3104ac4b569fee691e242d3;
					Bindings_CalculateMainLight_461292f6b16b62549aeb8366345bb7a5 _CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477;
					_CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477.WorldSpaceNormal = IN.WorldSpaceNormal;
					_CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477.WorldSpaceViewDirection = IN.WorldSpaceViewDirection;
					_CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
					float3 _CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477_Color_1;
					float _CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477_Diffuse_2;
					float _CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477_Specular_3;
					SG_CalculateMainLight_461292f6b16b62549aeb8366345bb7a5(_Property_ad061012c73c4cc08493cc074115a92b_Out_0, _CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477, _CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477_Color_1, _CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477_Diffuse_2, _CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477_Specular_3);
					float _Property_334be742dea14f93b71e80df2d722abb_Out_0 = Vector1_7138480fa3104ac4b569fee691e242d3;
					Bindings_AddAdditionalLights_e0ca8cced9af1114f8d573bbf9267b91 _AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9;
					_AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9.WorldSpaceNormal = IN.WorldSpaceNormal;
					_AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9.WorldSpaceViewDirection = IN.WorldSpaceViewDirection;
					_AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9.WorldSpacePosition = IN.WorldSpacePosition;
					float _AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9_Diffuse_1;
					float _AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9_Specular_2;
					float3 _AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9_Color_3;
					SG_AddAdditionalLights_e0ca8cced9af1114f8d573bbf9267b91(_CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477_Diffuse_2, _CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477_Specular_3, _CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477_Color_1, _Property_334be742dea14f93b71e80df2d722abb_Out_0, _AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9, _AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9_Diffuse_1, _AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9_Specular_2, _AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9_Color_3);
					float3 _ColorspaceConversion_a1764797872441c6b4ff04cd46115484_Out_1;
					Unity_ColorspaceConversion_RGB_HSV_float(_AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9_Color_3, _ColorspaceConversion_a1764797872441c6b4ff04cd46115484_Out_1);
					float _Split_d62321a0c7b94d3395d1c407f8cb1c76_R_1 = _ColorspaceConversion_a1764797872441c6b4ff04cd46115484_Out_1[0];
					float _Split_d62321a0c7b94d3395d1c407f8cb1c76_G_2 = _ColorspaceConversion_a1764797872441c6b4ff04cd46115484_Out_1[1];
					float _Split_d62321a0c7b94d3395d1c407f8cb1c76_B_3 = _ColorspaceConversion_a1764797872441c6b4ff04cd46115484_Out_1[2];
					float _Split_d62321a0c7b94d3395d1c407f8cb1c76_A_4 = 0;
					float3 _Vector3_5ec7f6923ca642d5b880a19ad978fbb6_Out_0 = float3(_Split_d62321a0c7b94d3395d1c407f8cb1c76_R_1, _Split_d62321a0c7b94d3395d1c407f8cb1c76_G_2, 1);
					float3 _ColorspaceConversion_563826bff2204a9da3df9b4b1fb90832_Out_1;
					Unity_ColorspaceConversion_HSV_RGB_float(_Vector3_5ec7f6923ca642d5b880a19ad978fbb6_Out_0, _ColorspaceConversion_563826bff2204a9da3df9b4b1fb90832_Out_1);
					Color_1 = _ColorspaceConversion_563826bff2204a9da3df9b4b1fb90832_Out_1;
					Diffuse_2 = _AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9_Diffuse_1;
					Specular_3 = _AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9_Specular_2;
				}

				void Unity_Multiply_float(float3 A, float3 B, out float3 Out)
				{
					Out = A * B;
				}

				struct Bindings_CalculateLightingRamp_f9083e7f4ef97944aa683bd2cc271eec
				{
				};

				void SG_CalculateLightingRamp_f9083e7f4ef97944aa683bd2cc271eec(float3 Vector3_93e84ad36d1b4ea8b8f6c0c9adcf0865, float Vector1_c32b4cfbaa0c443f8a7f5823fec8cd7e, TEXTURE2D_PARAM(Texture2D_1b486b175c1549408f04d81896a3d082, samplerTexture2D_1b486b175c1549408f04d81896a3d082), float4 Texture2D_1b486b175c1549408f04d81896a3d082_TexelSize, float Vector1_b73a3e9e7d8f4fbca4cd823bd00382b4, Bindings_CalculateLightingRamp_f9083e7f4ef97944aa683bd2cc271eec IN, out float3 Out_1)
				{
					float3 _Property_d6d30944102243d7bf7ba1eb098a4d84_Out_0 = Vector3_93e84ad36d1b4ea8b8f6c0c9adcf0865;
					float _Property_3bc98c59d28743c39c466fc49cf34921_Out_0 = Vector1_c32b4cfbaa0c443f8a7f5823fec8cd7e;
					float _Property_ae12adae892945b6b8c01902ce86a49c_Out_0 = Vector1_b73a3e9e7d8f4fbca4cd823bd00382b4;
					float2 _Vector2_fdbc5e83606a4783af197b11b3f73d8a_Out_0 = float2(_Property_3bc98c59d28743c39c466fc49cf34921_Out_0, _Property_ae12adae892945b6b8c01902ce86a49c_Out_0);
					#if defined(SHADER_API_GLES) && (SHADER_TARGET < 30)
					  float4 _SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_RGBA_0 = float4(0.0f, 0.0f, 0.0f, 1.0f);
					#else
					  float4 _SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_RGBA_0 = SAMPLE_TEXTURE2D_LOD(Texture2D_1b486b175c1549408f04d81896a3d082, SamplerState_Linear_Clamp, _Vector2_fdbc5e83606a4783af197b11b3f73d8a_Out_0, 0);
					#endif
					float _SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_R_5 = _SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_RGBA_0.r;
					float _SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_G_6 = _SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_RGBA_0.g;
					float _SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_B_7 = _SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_RGBA_0.b;
					float _SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_A_8 = _SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_RGBA_0.a;
					float3 _Multiply_8cfab02808e64cdfabeb670f144a1552_Out_2;
					Unity_Multiply_float(_Property_d6d30944102243d7bf7ba1eb098a4d84_Out_0, (_SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_R_5.xxx), _Multiply_8cfab02808e64cdfabeb670f144a1552_Out_2);
					Out_1 = _Multiply_8cfab02808e64cdfabeb670f144a1552_Out_2;
				}

				void Unity_Remap_float2(float2 In, float2 InMinMax, float2 OutMinMax, out float2 Out)
				{
					Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
				}

				void Unity_Add_float2(float2 A, float2 B, out float2 Out)
				{
					Out = A + B;
				}

				void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
				{
					Out = UV * Tiling + Offset;
				}

				void Unity_Multiply_float(float2 A, float2 B, out float2 Out)
				{
					Out = A * B;
				}

				void Unity_Subtract_float2(float2 A, float2 B, out float2 Out)
				{
					Out = A - B;
				}

				void Unity_Divide_float(float A, float B, out float Out)
				{
					Out = A / B;
				}

				void Unity_Divide_float2(float2 A, float2 B, out float2 Out)
				{
					Out = A / B;
				}

				void Unity_Length_float2(float2 In, out float Out)
				{
					Out = length(In);
				}

				void Unity_OneMinus_float(float In, out float Out)
				{
					Out = 1 - In;
				}

				void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
				{
					Out = smoothstep(Edge1, Edge2, In);
				}

				// Graph Vertex
				struct VertexDescription
				{
					float3 Position;
					float3 Normal;
					float3 Tangent;
				};

				VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
				{
					VertexDescription description = (VertexDescription)0;
					description.Position = IN.ObjectSpacePosition;
					description.Normal = IN.ObjectSpaceNormal;
					description.Tangent = IN.ObjectSpaceTangent;
					return description;
				}

				// Graph Pixel
				struct SurfaceDescription
				{
					float3 BaseColor;
					float Alpha;
					float AlphaClipThreshold;
				};

				SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
				{
					SurfaceDescription surface = (SurfaceDescription)0;
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float4 _UV_458ec5651131453fadd17a8a489c5875_Out_0 = IN.uv0;
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float4 _SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_RGBA_0 = SAMPLE_TEXTURE2D(Texture2D_4c8109b3fd8b48968abc0c10fc765a06, samplerTexture2D_4c8109b3fd8b48968abc0c10fc765a06, (_UV_458ec5651131453fadd17a8a489c5875_Out_0.xy));
					float _SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_R_4 = _SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_RGBA_0.r;
					float _SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_G_5 = _SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_RGBA_0.g;
					float _SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_B_6 = _SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_RGBA_0.b;
					float _SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_A_7 = _SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_RGBA_0.a;
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float _Property_d0c829cc66e24e97b0d19a6d7c5816ea_Out_0 = Vector1_73ff9ffb74dd4d0687b6353354f5147f;
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float3 _Hue_9ee969bf899d49978e31bc9302db2279_Out_2;
					Unity_Hue_Normalized_float((_SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_RGBA_0.xyz), _Property_d0c829cc66e24e97b0d19a6d7c5816ea_Out_0, _Hue_9ee969bf899d49978e31bc9302db2279_Out_2);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float _Property_cad7851042934a1f8f47516d97d09f82_Out_0 = Vector1_366094730b0e4d7cb16f896c6e8f21f0;
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float3 _Saturation_37ef3e5174ee458da3d81de2303d4fea_Out_2;
					Unity_Saturation_float(_Hue_9ee969bf899d49978e31bc9302db2279_Out_2, _Property_cad7851042934a1f8f47516d97d09f82_Out_0, _Saturation_37ef3e5174ee458da3d81de2303d4fea_Out_2);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float _Property_40fc2359ba494b1eacab89c4cac69363_Out_0 = Vector1_8aa5e25adec34bdabf733d9a643aaf71;
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					Bindings_CalculateLights_0c86135d169f3ee4ca18edf1c652f7e3 _CalculateLights_7c0e90cd22134717bebf3338457ac5b2;
					_CalculateLights_7c0e90cd22134717bebf3338457ac5b2.WorldSpaceNormal = IN.WorldSpaceNormal;
					_CalculateLights_7c0e90cd22134717bebf3338457ac5b2.WorldSpaceViewDirection = IN.WorldSpaceViewDirection;
					_CalculateLights_7c0e90cd22134717bebf3338457ac5b2.WorldSpacePosition = IN.WorldSpacePosition;
					_CalculateLights_7c0e90cd22134717bebf3338457ac5b2.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
					float3 _CalculateLights_7c0e90cd22134717bebf3338457ac5b2_Color_1;
					float _CalculateLights_7c0e90cd22134717bebf3338457ac5b2_Diffuse_2;
					float _CalculateLights_7c0e90cd22134717bebf3338457ac5b2_Specular_3;
					SG_CalculateLights_0c86135d169f3ee4ca18edf1c652f7e3(_Property_40fc2359ba494b1eacab89c4cac69363_Out_0, _CalculateLights_7c0e90cd22134717bebf3338457ac5b2, _CalculateLights_7c0e90cd22134717bebf3338457ac5b2_Color_1, _CalculateLights_7c0e90cd22134717bebf3338457ac5b2_Diffuse_2, _CalculateLights_7c0e90cd22134717bebf3338457ac5b2_Specular_3);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					Bindings_CalculateLightingRamp_f9083e7f4ef97944aa683bd2cc271eec _CalculateLightingRamp_f078baa6a2784b519454bec52f750c84;
					float3 _CalculateLightingRamp_f078baa6a2784b519454bec52f750c84_Out_1;
					SG_CalculateLightingRamp_f9083e7f4ef97944aa683bd2cc271eec(_CalculateLights_7c0e90cd22134717bebf3338457ac5b2_Color_1, _CalculateLights_7c0e90cd22134717bebf3338457ac5b2_Diffuse_2, TEXTURE2D_ARGS(Texture2D_0a61719aa2ac4656a8ca661fb9b12425, samplerTexture2D_0a61719aa2ac4656a8ca661fb9b12425), Texture2D_0a61719aa2ac4656a8ca661fb9b12425_TexelSize, 0, _CalculateLightingRamp_f078baa6a2784b519454bec52f750c84, _CalculateLightingRamp_f078baa6a2784b519454bec52f750c84_Out_1);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float3 _Multiply_927d6fde4cdd4536a09806be7f40975a_Out_2;
					Unity_Multiply_float(_Saturation_37ef3e5174ee458da3d81de2303d4fea_Out_2, _CalculateLightingRamp_f078baa6a2784b519454bec52f750c84_Out_1, _Multiply_927d6fde4cdd4536a09806be7f40975a_Out_2);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					Bindings_CalculateLightingRamp_f9083e7f4ef97944aa683bd2cc271eec _CalculateLightingRamp_c24f577623c24c05993c6c2fc9b5ca5b;
					float3 _CalculateLightingRamp_c24f577623c24c05993c6c2fc9b5ca5b_Out_1;
					SG_CalculateLightingRamp_f9083e7f4ef97944aa683bd2cc271eec(_CalculateLights_7c0e90cd22134717bebf3338457ac5b2_Color_1, _CalculateLights_7c0e90cd22134717bebf3338457ac5b2_Specular_3, TEXTURE2D_ARGS(Texture2D_0a61719aa2ac4656a8ca661fb9b12425, samplerTexture2D_0a61719aa2ac4656a8ca661fb9b12425), Texture2D_0a61719aa2ac4656a8ca661fb9b12425_TexelSize, 1, _CalculateLightingRamp_c24f577623c24c05993c6c2fc9b5ca5b, _CalculateLightingRamp_c24f577623c24c05993c6c2fc9b5ca5b_Out_1);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float3 _Add_28314a78e110405bb42f86246d854582_Out_2;
					Unity_Add_float3(_Multiply_927d6fde4cdd4536a09806be7f40975a_Out_2, _CalculateLightingRamp_c24f577623c24c05993c6c2fc9b5ca5b_Out_1, _Add_28314a78e110405bb42f86246d854582_Out_2);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float _Property_722d3873d582435abe485e38cc24b2cf_Out_0 = Vector1_983e66acc7c84eeebb58420303a45a77;
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float4 _ScreenPosition_9c48f7ea34234579bf12cce42a81188e_Out_0 = float4(IN.ScreenPosition.xy / IN.ScreenPosition.w, 0, 0);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float2 _Property_a03e88fcc10e499f99eed342d5292a88_Out_0 = _PositionP;
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float2 _Remap_7e074b94ef264fc0b318441c100bd2cc_Out_3;
					Unity_Remap_float2(_Property_a03e88fcc10e499f99eed342d5292a88_Out_0, float2 (0, 1), float2 (0.5, -1.5), _Remap_7e074b94ef264fc0b318441c100bd2cc_Out_3);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float2 _Add_ccdd586c0b244e02a60e05afc82418f2_Out_2;
					Unity_Add_float2((_ScreenPosition_9c48f7ea34234579bf12cce42a81188e_Out_0.xy), _Remap_7e074b94ef264fc0b318441c100bd2cc_Out_3, _Add_ccdd586c0b244e02a60e05afc82418f2_Out_2);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float2 _TilingAndOffset_79894f2c83a447a89faf78ac8fe86d57_Out_3;
					Unity_TilingAndOffset_float((_ScreenPosition_9c48f7ea34234579bf12cce42a81188e_Out_0.xy), float2 (1, 1), _Add_ccdd586c0b244e02a60e05afc82418f2_Out_2, _TilingAndOffset_79894f2c83a447a89faf78ac8fe86d57_Out_3);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float2 _Multiply_9d847ff9ce1248a3a2774e001b139e74_Out_2;
					Unity_Multiply_float(_TilingAndOffset_79894f2c83a447a89faf78ac8fe86d57_Out_3, float2(2, 2), _Multiply_9d847ff9ce1248a3a2774e001b139e74_Out_2);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float2 _Subtract_96816b4647194f5b8f6fc08717ae1455_Out_2;
					Unity_Subtract_float2(_Multiply_9d847ff9ce1248a3a2774e001b139e74_Out_2, float2(1, 1), _Subtract_96816b4647194f5b8f6fc08717ae1455_Out_2);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float _Divide_4a30a1a0cd9a4110a0c3d5f73d4b00c5_Out_2;
					Unity_Divide_float(unity_OrthoParams.y, unity_OrthoParams.x, _Divide_4a30a1a0cd9a4110a0c3d5f73d4b00c5_Out_2);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float _Property_f112483e6e1e4931b7335acf88585f4b_Out_0 = _SizeS;
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float _Multiply_1c6959130546437abc098a59891edfde_Out_2;
					Unity_Multiply_float(_Divide_4a30a1a0cd9a4110a0c3d5f73d4b00c5_Out_2, _Property_f112483e6e1e4931b7335acf88585f4b_Out_0, _Multiply_1c6959130546437abc098a59891edfde_Out_2);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float2 _Vector2_2ec4e4d241064c3dbf9dda843c3126a5_Out_0 = float2(_Multiply_1c6959130546437abc098a59891edfde_Out_2, _Property_f112483e6e1e4931b7335acf88585f4b_Out_0);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float2 _Divide_608ad307f8c44b8f82fdbd485fc435bd_Out_2;
					Unity_Divide_float2(_Subtract_96816b4647194f5b8f6fc08717ae1455_Out_2, _Vector2_2ec4e4d241064c3dbf9dda843c3126a5_Out_0, _Divide_608ad307f8c44b8f82fdbd485fc435bd_Out_2);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float _Length_2671319deb0846c586d0862346f04fc7_Out_1;
					Unity_Length_float2(_Divide_608ad307f8c44b8f82fdbd485fc435bd_Out_2, _Length_2671319deb0846c586d0862346f04fc7_Out_1);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float _OneMinus_a317c382855b4dfcb1a7ab6f5ff767dc_Out_1;
					Unity_OneMinus_float(_Length_2671319deb0846c586d0862346f04fc7_Out_1, _OneMinus_a317c382855b4dfcb1a7ab6f5ff767dc_Out_1);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float _Saturate_933b41d482394ae4a32b9f149f129f64_Out_1;
					Unity_Saturate_float(_OneMinus_a317c382855b4dfcb1a7ab6f5ff767dc_Out_1, _Saturate_933b41d482394ae4a32b9f149f129f64_Out_1);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float _Smoothstep_46f4a8caf1ac42f0ad005385aed8deb4_Out_3;
					Unity_Smoothstep_float(0, _Property_722d3873d582435abe485e38cc24b2cf_Out_0, _Saturate_933b41d482394ae4a32b9f149f129f64_Out_1, _Smoothstep_46f4a8caf1ac42f0ad005385aed8deb4_Out_3);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float _Property_6ab1ca603f15443da03497daee2ad631_Out_0 = Vector1_a65e3ce5f90b4c989b988ad54dfc8ca4;
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float _Multiply_0b1d234506be449aac12054383b99708_Out_2;
					Unity_Multiply_float(_Smoothstep_46f4a8caf1ac42f0ad005385aed8deb4_Out_3, _Property_6ab1ca603f15443da03497daee2ad631_Out_0, _Multiply_0b1d234506be449aac12054383b99708_Out_2);
					#endif
					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float _OneMinus_d49a076f00f746ca9b7c2d7f79323475_Out_1;
					Unity_OneMinus_float(_Multiply_0b1d234506be449aac12054383b99708_Out_2, _OneMinus_d49a076f00f746ca9b7c2d7f79323475_Out_1);
					#endif
					surface.BaseColor = _Add_28314a78e110405bb42f86246d854582_Out_2;
					surface.Alpha = _OneMinus_d49a076f00f746ca9b7c2d7f79323475_Out_1;
					surface.AlphaClipThreshold = 0.5;
					return surface;
				}

				// --------------------------------------------------
				// Build Graph Inputs

				VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
				{
					VertexDescriptionInputs output;
					ZERO_INITIALIZE(VertexDescriptionInputs, output);

				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
				output.ObjectSpaceNormal = input.normalOS;
				#endif

				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
				output.ObjectSpaceTangent = input.tangentOS;
				#endif

				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
				output.ObjectSpacePosition = input.positionOS;
				#endif


					return output;
				}

				SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
				{
					SurfaceDescriptionInputs output;
					ZERO_INITIALIZE(SurfaceDescriptionInputs, output);

				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					// must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
					#endif

					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					float3 unnormalizedNormalWS = input.normalWS;
					#endif

					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					const float renormFactor = 1.0 / length(unnormalizedNormalWS);
					#endif



					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;		// we want a unit length Normal Vector node in shader graph
					#endif



					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					output.WorldSpaceViewDirection = input.viewDirectionWS; //TODO: by default normalized in HD, but not in universal
					#endif

					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					output.WorldSpacePosition = input.positionWS;
					#endif

					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
					#endif

					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					output.ScreenPosition = ComputeScreenPos(TransformWorldToHClip(input.positionWS), _ProjectionParams.x);
					#endif

					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					output.uv0 = input.texCoord0;
					#endif

					#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
					#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
					#else
					#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
					#endif
					#undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN

						return output;
					}


				// --------------------------------------------------
				// Main

				#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
				#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
				#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/UnlitPass.hlsl"

				ENDHLSL
			}
			Pass
			{
				Name "ShadowCaster"
				Tags
				{
					"LightMode" = "ShadowCaster"
				}

					// Render State
					Cull Back
					Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
					ZTest LEqual
					ZWrite On
					ColorMask 0

					// Debug
					// <None>

					// --------------------------------------------------
					// Pass

					HLSLPROGRAM

					// Pragmas
					#pragma target 2.0
					#pragma only_renderers gles gles3 glcore
					#pragma multi_compile_instancing
					#pragma vertex vert
					#pragma fragment frag

					// DotsInstancingOptions: <None>
					// HybridV1InjectedBuiltinProperties: <None>

					// Keywords
					// PassKeywords: <None>
					#pragma multi_compile_local _ MAIN_LIGHT_CALCULATE_SHADOWS
					#pragma multi_compile_local _ _MAIN_LIGHT_SHADOWS_CASCADE
					#pragma multi_compile_local _ _SHADOWS_SOFT
					#pragma multi_compile_local _ ADDITIONAL_LIGHT_CALCULATE_SHADOWS

					#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
						#define KEYWORD_PERMUTATION_0
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT)
						#define KEYWORD_PERMUTATION_1
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
						#define KEYWORD_PERMUTATION_2
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE)
						#define KEYWORD_PERMUTATION_3
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
						#define KEYWORD_PERMUTATION_4
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_SHADOWS_SOFT)
						#define KEYWORD_PERMUTATION_5
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
						#define KEYWORD_PERMUTATION_6
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						#define KEYWORD_PERMUTATION_7
					#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
						#define KEYWORD_PERMUTATION_8
					#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT)
						#define KEYWORD_PERMUTATION_9
					#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
						#define KEYWORD_PERMUTATION_10
					#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE)
						#define KEYWORD_PERMUTATION_11
					#elif defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
						#define KEYWORD_PERMUTATION_12
					#elif defined(_SHADOWS_SOFT)
						#define KEYWORD_PERMUTATION_13
					#elif defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
						#define KEYWORD_PERMUTATION_14
					#else
						#define KEYWORD_PERMUTATION_15
					#endif


					// Defines
				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
				#define _SURFACE_TYPE_TRANSPARENT 1
				#endif

				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
				#define _AlphaClip 1
				#endif

				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
				#define ATTRIBUTES_NEED_NORMAL
				#endif

				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
				#define ATTRIBUTES_NEED_TANGENT
				#endif

				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
				#define VARYINGS_NEED_POSITION_WS
				#endif

					#define FEATURES_GRAPH_VERTEX
					/* WARNING: $splice Could not find named fragment 'PassInstancing' */
					#define SHADERPASS SHADERPASS_SHADOWCASTER
					/* WARNING: $splice Could not find named fragment 'DotsInstancingVars' */

					// Includes
					#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
					#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
					#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
					#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
					#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

					// --------------------------------------------------
					// Structs and Packing

					struct Attributes
					{
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						float3 positionOS : POSITION;
						#endif
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						float3 normalOS : NORMAL;
						#endif
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						float4 tangentOS : TANGENT;
						#endif
						#if UNITY_ANY_INSTANCING_ENABLED
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						uint instanceID : INSTANCEID_SEMANTIC;
						#endif
						#endif
					};
					struct Varyings
					{
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						float4 positionCS : SV_POSITION;
						#endif
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						float3 positionWS;
						#endif
						#if UNITY_ANY_INSTANCING_ENABLED
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						uint instanceID : CUSTOM_INSTANCE_ID;
						#endif
						#endif
						#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
						#endif
						#endif
						#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
						#endif
						#endif
						#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
						#endif
						#endif
					};
					struct SurfaceDescriptionInputs
					{
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						float3 WorldSpacePosition;
						#endif
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						float4 ScreenPosition;
						#endif
					};
					struct VertexDescriptionInputs
					{
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						float3 ObjectSpaceNormal;
						#endif
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						float3 ObjectSpaceTangent;
						#endif
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						float3 ObjectSpacePosition;
						#endif
					};
					struct PackedVaryings
					{
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						float4 positionCS : SV_POSITION;
						#endif
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						float3 interp0 : TEXCOORD0;
						#endif
						#if UNITY_ANY_INSTANCING_ENABLED
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						uint instanceID : CUSTOM_INSTANCE_ID;
						#endif
						#endif
						#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
						#endif
						#endif
						#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
						#endif
						#endif
						#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
						#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
						FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
						#endif
						#endif
					};

					#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
					PackedVaryings PackVaryings(Varyings input)
						{
							PackedVaryings output;
							output.positionCS = input.positionCS;
							output.interp0.xyz = input.positionWS;
							#if UNITY_ANY_INSTANCING_ENABLED
							output.instanceID = input.instanceID;
							#endif
							#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
							output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
							#endif
							#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
							output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
							#endif
							#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
							output.cullFace = input.cullFace;
							#endif
							return output;
						}
						Varyings UnpackVaryings(PackedVaryings input)
						{
							Varyings output;
							output.positionCS = input.positionCS;
							output.positionWS = input.interp0.xyz;
							#if UNITY_ANY_INSTANCING_ENABLED
							output.instanceID = input.instanceID;
							#endif
							#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
							output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
							#endif
							#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
							output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
							#endif
							#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
							output.cullFace = input.cullFace;
							#endif
							return output;
						}
					#endif

						// --------------------------------------------------
						// Graph

						// Graph Properties
						CBUFFER_START(UnityPerMaterial)
						float4 Texture2D_0a61719aa2ac4656a8ca661fb9b12425_TexelSize;
						float4 Texture2D_4c8109b3fd8b48968abc0c10fc765a06_TexelSize;
						float Vector1_8aa5e25adec34bdabf733d9a643aaf71;
						float Vector1_73ff9ffb74dd4d0687b6353354f5147f;
						float Vector1_366094730b0e4d7cb16f896c6e8f21f0;
						float2 _PositionP;
						float _SizeS;
						float Vector1_983e66acc7c84eeebb58420303a45a77;
						float Vector1_a65e3ce5f90b4c989b988ad54dfc8ca4;
						CBUFFER_END

							// Object and Global properties
							TEXTURE2D(Texture2D_0a61719aa2ac4656a8ca661fb9b12425);
							SAMPLER(samplerTexture2D_0a61719aa2ac4656a8ca661fb9b12425);
							TEXTURE2D(Texture2D_4c8109b3fd8b48968abc0c10fc765a06);
							SAMPLER(samplerTexture2D_4c8109b3fd8b48968abc0c10fc765a06);

							// Graph Functions

							void Unity_Remap_float2(float2 In, float2 InMinMax, float2 OutMinMax, out float2 Out)
							{
								Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
							}

							void Unity_Add_float2(float2 A, float2 B, out float2 Out)
							{
								Out = A + B;
							}

							void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
							{
								Out = UV * Tiling + Offset;
							}

							void Unity_Multiply_float(float2 A, float2 B, out float2 Out)
							{
								Out = A * B;
							}

							void Unity_Subtract_float2(float2 A, float2 B, out float2 Out)
							{
								Out = A - B;
							}

							void Unity_Divide_float(float A, float B, out float Out)
							{
								Out = A / B;
							}

							void Unity_Multiply_float(float A, float B, out float Out)
							{
								Out = A * B;
							}

							void Unity_Divide_float2(float2 A, float2 B, out float2 Out)
							{
								Out = A / B;
							}

							void Unity_Length_float2(float2 In, out float Out)
							{
								Out = length(In);
							}

							void Unity_OneMinus_float(float In, out float Out)
							{
								Out = 1 - In;
							}

							void Unity_Saturate_float(float In, out float Out)
							{
								Out = saturate(In);
							}

							void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
							{
								Out = smoothstep(Edge1, Edge2, In);
							}

							// Graph Vertex
							struct VertexDescription
							{
								float3 Position;
								float3 Normal;
								float3 Tangent;
							};

							VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
							{
								VertexDescription description = (VertexDescription)0;
								description.Position = IN.ObjectSpacePosition;
								description.Normal = IN.ObjectSpaceNormal;
								description.Tangent = IN.ObjectSpaceTangent;
								return description;
							}

							// Graph Pixel
							struct SurfaceDescription
							{
								float Alpha;
								float AlphaClipThreshold;
							};

							SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
							{
								SurfaceDescription surface = (SurfaceDescription)0;
								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								float _Property_722d3873d582435abe485e38cc24b2cf_Out_0 = Vector1_983e66acc7c84eeebb58420303a45a77;
								#endif
								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								float4 _ScreenPosition_9c48f7ea34234579bf12cce42a81188e_Out_0 = float4(IN.ScreenPosition.xy / IN.ScreenPosition.w, 0, 0);
								#endif
								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								float2 _Property_a03e88fcc10e499f99eed342d5292a88_Out_0 = _PositionP;
								#endif
								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								float2 _Remap_7e074b94ef264fc0b318441c100bd2cc_Out_3;
								Unity_Remap_float2(_Property_a03e88fcc10e499f99eed342d5292a88_Out_0, float2 (0, 1), float2 (0.5, -1.5), _Remap_7e074b94ef264fc0b318441c100bd2cc_Out_3);
								#endif
								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								float2 _Add_ccdd586c0b244e02a60e05afc82418f2_Out_2;
								Unity_Add_float2((_ScreenPosition_9c48f7ea34234579bf12cce42a81188e_Out_0.xy), _Remap_7e074b94ef264fc0b318441c100bd2cc_Out_3, _Add_ccdd586c0b244e02a60e05afc82418f2_Out_2);
								#endif
								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								float2 _TilingAndOffset_79894f2c83a447a89faf78ac8fe86d57_Out_3;
								Unity_TilingAndOffset_float((_ScreenPosition_9c48f7ea34234579bf12cce42a81188e_Out_0.xy), float2 (1, 1), _Add_ccdd586c0b244e02a60e05afc82418f2_Out_2, _TilingAndOffset_79894f2c83a447a89faf78ac8fe86d57_Out_3);
								#endif
								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								float2 _Multiply_9d847ff9ce1248a3a2774e001b139e74_Out_2;
								Unity_Multiply_float(_TilingAndOffset_79894f2c83a447a89faf78ac8fe86d57_Out_3, float2(2, 2), _Multiply_9d847ff9ce1248a3a2774e001b139e74_Out_2);
								#endif
								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								float2 _Subtract_96816b4647194f5b8f6fc08717ae1455_Out_2;
								Unity_Subtract_float2(_Multiply_9d847ff9ce1248a3a2774e001b139e74_Out_2, float2(1, 1), _Subtract_96816b4647194f5b8f6fc08717ae1455_Out_2);
								#endif
								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								float _Divide_4a30a1a0cd9a4110a0c3d5f73d4b00c5_Out_2;
								Unity_Divide_float(unity_OrthoParams.y, unity_OrthoParams.x, _Divide_4a30a1a0cd9a4110a0c3d5f73d4b00c5_Out_2);
								#endif
								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								float _Property_f112483e6e1e4931b7335acf88585f4b_Out_0 = _SizeS;
								#endif
								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								float _Multiply_1c6959130546437abc098a59891edfde_Out_2;
								Unity_Multiply_float(_Divide_4a30a1a0cd9a4110a0c3d5f73d4b00c5_Out_2, _Property_f112483e6e1e4931b7335acf88585f4b_Out_0, _Multiply_1c6959130546437abc098a59891edfde_Out_2);
								#endif
								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								float2 _Vector2_2ec4e4d241064c3dbf9dda843c3126a5_Out_0 = float2(_Multiply_1c6959130546437abc098a59891edfde_Out_2, _Property_f112483e6e1e4931b7335acf88585f4b_Out_0);
								#endif
								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								float2 _Divide_608ad307f8c44b8f82fdbd485fc435bd_Out_2;
								Unity_Divide_float2(_Subtract_96816b4647194f5b8f6fc08717ae1455_Out_2, _Vector2_2ec4e4d241064c3dbf9dda843c3126a5_Out_0, _Divide_608ad307f8c44b8f82fdbd485fc435bd_Out_2);
								#endif
								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								float _Length_2671319deb0846c586d0862346f04fc7_Out_1;
								Unity_Length_float2(_Divide_608ad307f8c44b8f82fdbd485fc435bd_Out_2, _Length_2671319deb0846c586d0862346f04fc7_Out_1);
								#endif
								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								float _OneMinus_a317c382855b4dfcb1a7ab6f5ff767dc_Out_1;
								Unity_OneMinus_float(_Length_2671319deb0846c586d0862346f04fc7_Out_1, _OneMinus_a317c382855b4dfcb1a7ab6f5ff767dc_Out_1);
								#endif
								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								float _Saturate_933b41d482394ae4a32b9f149f129f64_Out_1;
								Unity_Saturate_float(_OneMinus_a317c382855b4dfcb1a7ab6f5ff767dc_Out_1, _Saturate_933b41d482394ae4a32b9f149f129f64_Out_1);
								#endif
								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								float _Smoothstep_46f4a8caf1ac42f0ad005385aed8deb4_Out_3;
								Unity_Smoothstep_float(0, _Property_722d3873d582435abe485e38cc24b2cf_Out_0, _Saturate_933b41d482394ae4a32b9f149f129f64_Out_1, _Smoothstep_46f4a8caf1ac42f0ad005385aed8deb4_Out_3);
								#endif
								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								float _Property_6ab1ca603f15443da03497daee2ad631_Out_0 = Vector1_a65e3ce5f90b4c989b988ad54dfc8ca4;
								#endif
								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								float _Multiply_0b1d234506be449aac12054383b99708_Out_2;
								Unity_Multiply_float(_Smoothstep_46f4a8caf1ac42f0ad005385aed8deb4_Out_3, _Property_6ab1ca603f15443da03497daee2ad631_Out_0, _Multiply_0b1d234506be449aac12054383b99708_Out_2);
								#endif
								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								float _OneMinus_d49a076f00f746ca9b7c2d7f79323475_Out_1;
								Unity_OneMinus_float(_Multiply_0b1d234506be449aac12054383b99708_Out_2, _OneMinus_d49a076f00f746ca9b7c2d7f79323475_Out_1);
								#endif
								surface.Alpha = _OneMinus_d49a076f00f746ca9b7c2d7f79323475_Out_1;
								surface.AlphaClipThreshold = 0.5;
								return surface;
							}

							// --------------------------------------------------
							// Build Graph Inputs

							VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
							{
								VertexDescriptionInputs output;
								ZERO_INITIALIZE(VertexDescriptionInputs, output);

							#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
							output.ObjectSpaceNormal = input.normalOS;
							#endif

							#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
							output.ObjectSpaceTangent = input.tangentOS;
							#endif

							#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
							output.ObjectSpacePosition = input.positionOS;
							#endif


								return output;
							}

							SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
							{
								SurfaceDescriptionInputs output;
								ZERO_INITIALIZE(SurfaceDescriptionInputs, output);





							#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
							output.WorldSpacePosition = input.positionWS;
							#endif

							#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
							output.ScreenPosition = ComputeScreenPos(TransformWorldToHClip(input.positionWS), _ProjectionParams.x);
							#endif

							#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
							#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
							#else
							#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
							#endif
							#undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN

								return output;
							}


							// --------------------------------------------------
							// Main

							#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
							#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
							#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShadowCasterPass.hlsl"

							ENDHLSL
						}
						Pass
						{
							Name "DepthOnly"
							Tags
							{
								"LightMode" = "DepthOnly"
							}

								// Render State
								Cull Back
								Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
								ZTest LEqual
								ZWrite On
								ColorMask 0

								// Debug
								// <None>

								// --------------------------------------------------
								// Pass

								HLSLPROGRAM

								// Pragmas
								#pragma target 2.0
								#pragma only_renderers gles gles3 glcore
								#pragma multi_compile_instancing
								#pragma vertex vert
								#pragma fragment frag

								// DotsInstancingOptions: <None>
								// HybridV1InjectedBuiltinProperties: <None>

								// Keywords
								// PassKeywords: <None>
								#pragma multi_compile_local _ MAIN_LIGHT_CALCULATE_SHADOWS
								#pragma multi_compile_local _ _MAIN_LIGHT_SHADOWS_CASCADE
								#pragma multi_compile_local _ _SHADOWS_SOFT
								#pragma multi_compile_local _ ADDITIONAL_LIGHT_CALCULATE_SHADOWS

								#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
									#define KEYWORD_PERMUTATION_0
								#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT)
									#define KEYWORD_PERMUTATION_1
								#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
									#define KEYWORD_PERMUTATION_2
								#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE)
									#define KEYWORD_PERMUTATION_3
								#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
									#define KEYWORD_PERMUTATION_4
								#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_SHADOWS_SOFT)
									#define KEYWORD_PERMUTATION_5
								#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
									#define KEYWORD_PERMUTATION_6
								#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
									#define KEYWORD_PERMUTATION_7
								#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
									#define KEYWORD_PERMUTATION_8
								#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT)
									#define KEYWORD_PERMUTATION_9
								#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
									#define KEYWORD_PERMUTATION_10
								#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE)
									#define KEYWORD_PERMUTATION_11
								#elif defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
									#define KEYWORD_PERMUTATION_12
								#elif defined(_SHADOWS_SOFT)
									#define KEYWORD_PERMUTATION_13
								#elif defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
									#define KEYWORD_PERMUTATION_14
								#else
									#define KEYWORD_PERMUTATION_15
								#endif


								// Defines
							#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
							#define _SURFACE_TYPE_TRANSPARENT 1
							#endif

							#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
							#define _AlphaClip 1
							#endif

							#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
							#define ATTRIBUTES_NEED_NORMAL
							#endif

							#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
							#define ATTRIBUTES_NEED_TANGENT
							#endif

							#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
							#define VARYINGS_NEED_POSITION_WS
							#endif

								#define FEATURES_GRAPH_VERTEX
								/* WARNING: $splice Could not find named fragment 'PassInstancing' */
								#define SHADERPASS SHADERPASS_DEPTHONLY
								/* WARNING: $splice Could not find named fragment 'DotsInstancingVars' */

								// Includes
								#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
								#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
								#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
								#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
								#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

								// --------------------------------------------------
								// Structs and Packing

								struct Attributes
								{
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									float3 positionOS : POSITION;
									#endif
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									float3 normalOS : NORMAL;
									#endif
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									float4 tangentOS : TANGENT;
									#endif
									#if UNITY_ANY_INSTANCING_ENABLED
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									uint instanceID : INSTANCEID_SEMANTIC;
									#endif
									#endif
								};
								struct Varyings
								{
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									float4 positionCS : SV_POSITION;
									#endif
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									float3 positionWS;
									#endif
									#if UNITY_ANY_INSTANCING_ENABLED
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									uint instanceID : CUSTOM_INSTANCE_ID;
									#endif
									#endif
									#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
									#endif
									#endif
									#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
									#endif
									#endif
									#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
									#endif
									#endif
								};
								struct SurfaceDescriptionInputs
								{
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									float3 WorldSpacePosition;
									#endif
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									float4 ScreenPosition;
									#endif
								};
								struct VertexDescriptionInputs
								{
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									float3 ObjectSpaceNormal;
									#endif
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									float3 ObjectSpaceTangent;
									#endif
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									float3 ObjectSpacePosition;
									#endif
								};
								struct PackedVaryings
								{
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									float4 positionCS : SV_POSITION;
									#endif
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									float3 interp0 : TEXCOORD0;
									#endif
									#if UNITY_ANY_INSTANCING_ENABLED
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									uint instanceID : CUSTOM_INSTANCE_ID;
									#endif
									#endif
									#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
									#endif
									#endif
									#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
									#endif
									#endif
									#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
									#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
									FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
									#endif
									#endif
								};

								#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
								PackedVaryings PackVaryings(Varyings input)
									{
										PackedVaryings output;
										output.positionCS = input.positionCS;
										output.interp0.xyz = input.positionWS;
										#if UNITY_ANY_INSTANCING_ENABLED
										output.instanceID = input.instanceID;
										#endif
										#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
										output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
										#endif
										#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
										output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
										#endif
										#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
										output.cullFace = input.cullFace;
										#endif
										return output;
									}
									Varyings UnpackVaryings(PackedVaryings input)
									{
										Varyings output;
										output.positionCS = input.positionCS;
										output.positionWS = input.interp0.xyz;
										#if UNITY_ANY_INSTANCING_ENABLED
										output.instanceID = input.instanceID;
										#endif
										#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
										output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
										#endif
										#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
										output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
										#endif
										#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
										output.cullFace = input.cullFace;
										#endif
										return output;
									}
								#endif

									// --------------------------------------------------
									// Graph

									// Graph Properties
									CBUFFER_START(UnityPerMaterial)
									float4 Texture2D_0a61719aa2ac4656a8ca661fb9b12425_TexelSize;
									float4 Texture2D_4c8109b3fd8b48968abc0c10fc765a06_TexelSize;
									float Vector1_8aa5e25adec34bdabf733d9a643aaf71;
									float Vector1_73ff9ffb74dd4d0687b6353354f5147f;
									float Vector1_366094730b0e4d7cb16f896c6e8f21f0;
									float2 _PositionP;
									float _SizeS;
									float Vector1_983e66acc7c84eeebb58420303a45a77;
									float Vector1_a65e3ce5f90b4c989b988ad54dfc8ca4;
									CBUFFER_END

										// Object and Global properties
										TEXTURE2D(Texture2D_0a61719aa2ac4656a8ca661fb9b12425);
										SAMPLER(samplerTexture2D_0a61719aa2ac4656a8ca661fb9b12425);
										TEXTURE2D(Texture2D_4c8109b3fd8b48968abc0c10fc765a06);
										SAMPLER(samplerTexture2D_4c8109b3fd8b48968abc0c10fc765a06);

										// Graph Functions

										void Unity_Remap_float2(float2 In, float2 InMinMax, float2 OutMinMax, out float2 Out)
										{
											Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
										}

										void Unity_Add_float2(float2 A, float2 B, out float2 Out)
										{
											Out = A + B;
										}

										void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
										{
											Out = UV * Tiling + Offset;
										}

										void Unity_Multiply_float(float2 A, float2 B, out float2 Out)
										{
											Out = A * B;
										}

										void Unity_Subtract_float2(float2 A, float2 B, out float2 Out)
										{
											Out = A - B;
										}

										void Unity_Divide_float(float A, float B, out float Out)
										{
											Out = A / B;
										}

										void Unity_Multiply_float(float A, float B, out float Out)
										{
											Out = A * B;
										}

										void Unity_Divide_float2(float2 A, float2 B, out float2 Out)
										{
											Out = A / B;
										}

										void Unity_Length_float2(float2 In, out float Out)
										{
											Out = length(In);
										}

										void Unity_OneMinus_float(float In, out float Out)
										{
											Out = 1 - In;
										}

										void Unity_Saturate_float(float In, out float Out)
										{
											Out = saturate(In);
										}

										void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
										{
											Out = smoothstep(Edge1, Edge2, In);
										}

										// Graph Vertex
										struct VertexDescription
										{
											float3 Position;
											float3 Normal;
											float3 Tangent;
										};

										VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
										{
											VertexDescription description = (VertexDescription)0;
											description.Position = IN.ObjectSpacePosition;
											description.Normal = IN.ObjectSpaceNormal;
											description.Tangent = IN.ObjectSpaceTangent;
											return description;
										}

										// Graph Pixel
										struct SurfaceDescription
										{
											float Alpha;
											float AlphaClipThreshold;
										};

										SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
										{
											SurfaceDescription surface = (SurfaceDescription)0;
											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											float _Property_722d3873d582435abe485e38cc24b2cf_Out_0 = Vector1_983e66acc7c84eeebb58420303a45a77;
											#endif
											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											float4 _ScreenPosition_9c48f7ea34234579bf12cce42a81188e_Out_0 = float4(IN.ScreenPosition.xy / IN.ScreenPosition.w, 0, 0);
											#endif
											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											float2 _Property_a03e88fcc10e499f99eed342d5292a88_Out_0 = _PositionP;
											#endif
											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											float2 _Remap_7e074b94ef264fc0b318441c100bd2cc_Out_3;
											Unity_Remap_float2(_Property_a03e88fcc10e499f99eed342d5292a88_Out_0, float2 (0, 1), float2 (0.5, -1.5), _Remap_7e074b94ef264fc0b318441c100bd2cc_Out_3);
											#endif
											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											float2 _Add_ccdd586c0b244e02a60e05afc82418f2_Out_2;
											Unity_Add_float2((_ScreenPosition_9c48f7ea34234579bf12cce42a81188e_Out_0.xy), _Remap_7e074b94ef264fc0b318441c100bd2cc_Out_3, _Add_ccdd586c0b244e02a60e05afc82418f2_Out_2);
											#endif
											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											float2 _TilingAndOffset_79894f2c83a447a89faf78ac8fe86d57_Out_3;
											Unity_TilingAndOffset_float((_ScreenPosition_9c48f7ea34234579bf12cce42a81188e_Out_0.xy), float2 (1, 1), _Add_ccdd586c0b244e02a60e05afc82418f2_Out_2, _TilingAndOffset_79894f2c83a447a89faf78ac8fe86d57_Out_3);
											#endif
											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											float2 _Multiply_9d847ff9ce1248a3a2774e001b139e74_Out_2;
											Unity_Multiply_float(_TilingAndOffset_79894f2c83a447a89faf78ac8fe86d57_Out_3, float2(2, 2), _Multiply_9d847ff9ce1248a3a2774e001b139e74_Out_2);
											#endif
											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											float2 _Subtract_96816b4647194f5b8f6fc08717ae1455_Out_2;
											Unity_Subtract_float2(_Multiply_9d847ff9ce1248a3a2774e001b139e74_Out_2, float2(1, 1), _Subtract_96816b4647194f5b8f6fc08717ae1455_Out_2);
											#endif
											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											float _Divide_4a30a1a0cd9a4110a0c3d5f73d4b00c5_Out_2;
											Unity_Divide_float(unity_OrthoParams.y, unity_OrthoParams.x, _Divide_4a30a1a0cd9a4110a0c3d5f73d4b00c5_Out_2);
											#endif
											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											float _Property_f112483e6e1e4931b7335acf88585f4b_Out_0 = _SizeS;
											#endif
											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											float _Multiply_1c6959130546437abc098a59891edfde_Out_2;
											Unity_Multiply_float(_Divide_4a30a1a0cd9a4110a0c3d5f73d4b00c5_Out_2, _Property_f112483e6e1e4931b7335acf88585f4b_Out_0, _Multiply_1c6959130546437abc098a59891edfde_Out_2);
											#endif
											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											float2 _Vector2_2ec4e4d241064c3dbf9dda843c3126a5_Out_0 = float2(_Multiply_1c6959130546437abc098a59891edfde_Out_2, _Property_f112483e6e1e4931b7335acf88585f4b_Out_0);
											#endif
											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											float2 _Divide_608ad307f8c44b8f82fdbd485fc435bd_Out_2;
											Unity_Divide_float2(_Subtract_96816b4647194f5b8f6fc08717ae1455_Out_2, _Vector2_2ec4e4d241064c3dbf9dda843c3126a5_Out_0, _Divide_608ad307f8c44b8f82fdbd485fc435bd_Out_2);
											#endif
											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											float _Length_2671319deb0846c586d0862346f04fc7_Out_1;
											Unity_Length_float2(_Divide_608ad307f8c44b8f82fdbd485fc435bd_Out_2, _Length_2671319deb0846c586d0862346f04fc7_Out_1);
											#endif
											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											float _OneMinus_a317c382855b4dfcb1a7ab6f5ff767dc_Out_1;
											Unity_OneMinus_float(_Length_2671319deb0846c586d0862346f04fc7_Out_1, _OneMinus_a317c382855b4dfcb1a7ab6f5ff767dc_Out_1);
											#endif
											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											float _Saturate_933b41d482394ae4a32b9f149f129f64_Out_1;
											Unity_Saturate_float(_OneMinus_a317c382855b4dfcb1a7ab6f5ff767dc_Out_1, _Saturate_933b41d482394ae4a32b9f149f129f64_Out_1);
											#endif
											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											float _Smoothstep_46f4a8caf1ac42f0ad005385aed8deb4_Out_3;
											Unity_Smoothstep_float(0, _Property_722d3873d582435abe485e38cc24b2cf_Out_0, _Saturate_933b41d482394ae4a32b9f149f129f64_Out_1, _Smoothstep_46f4a8caf1ac42f0ad005385aed8deb4_Out_3);
											#endif
											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											float _Property_6ab1ca603f15443da03497daee2ad631_Out_0 = Vector1_a65e3ce5f90b4c989b988ad54dfc8ca4;
											#endif
											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											float _Multiply_0b1d234506be449aac12054383b99708_Out_2;
											Unity_Multiply_float(_Smoothstep_46f4a8caf1ac42f0ad005385aed8deb4_Out_3, _Property_6ab1ca603f15443da03497daee2ad631_Out_0, _Multiply_0b1d234506be449aac12054383b99708_Out_2);
											#endif
											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											float _OneMinus_d49a076f00f746ca9b7c2d7f79323475_Out_1;
											Unity_OneMinus_float(_Multiply_0b1d234506be449aac12054383b99708_Out_2, _OneMinus_d49a076f00f746ca9b7c2d7f79323475_Out_1);
											#endif
											surface.Alpha = _OneMinus_d49a076f00f746ca9b7c2d7f79323475_Out_1;
											surface.AlphaClipThreshold = 0.5;
											return surface;
										}

										// --------------------------------------------------
										// Build Graph Inputs

										VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
										{
											VertexDescriptionInputs output;
											ZERO_INITIALIZE(VertexDescriptionInputs, output);

										#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
										output.ObjectSpaceNormal = input.normalOS;
										#endif

										#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
										output.ObjectSpaceTangent = input.tangentOS;
										#endif

										#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
										output.ObjectSpacePosition = input.positionOS;
										#endif


											return output;
										}

										SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
										{
											SurfaceDescriptionInputs output;
											ZERO_INITIALIZE(SurfaceDescriptionInputs, output);





										#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
										output.WorldSpacePosition = input.positionWS;
										#endif

										#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
										output.ScreenPosition = ComputeScreenPos(TransformWorldToHClip(input.positionWS), _ProjectionParams.x);
										#endif

										#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
										#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
										#else
										#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
										#endif
										#undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN

											return output;
										}


										// --------------------------------------------------
										// Main

										#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
										#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
										#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthOnlyPass.hlsl"

										ENDHLSL
									}
	}
		SubShader
										{
											Tags
											{
												"RenderPipeline" = "UniversalPipeline"
												"RenderType" = "Transparent"
												"UniversalMaterialType" = "Unlit"
												"Queue" = "Transparent"
											}
											Pass
											{
												Name "Pass"
												Tags
												{
											// LightMode: <None>
										}

										// Render State
										Cull Back
										Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
										ZTest LEqual
										ZWrite On

											// Debug
											// <None>

											// --------------------------------------------------
											// Pass

											HLSLPROGRAM

											// Pragmas
											#pragma target 4.5
											#pragma exclude_renderers gles gles3 glcore
											#pragma multi_compile_instancing
											#pragma multi_compile_fog
											#pragma multi_compile _ DOTS_INSTANCING_ON
											#pragma vertex vert
											#pragma fragment frag

											// DotsInstancingOptions: <None>
											// HybridV1InjectedBuiltinProperties: <None>

											// Keywords
											#pragma multi_compile _ LIGHTMAP_ON
											#pragma multi_compile _ DIRLIGHTMAP_COMBINED
											#pragma shader_feature _ _SAMPLE_GI
											#pragma multi_compile_local _ MAIN_LIGHT_CALCULATE_SHADOWS
											#pragma multi_compile_local _ _MAIN_LIGHT_SHADOWS_CASCADE
											#pragma multi_compile_local _ _SHADOWS_SOFT
											#pragma multi_compile_local _ ADDITIONAL_LIGHT_CALCULATE_SHADOWS

											#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
												#define KEYWORD_PERMUTATION_0
											#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT)
												#define KEYWORD_PERMUTATION_1
											#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
												#define KEYWORD_PERMUTATION_2
											#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE)
												#define KEYWORD_PERMUTATION_3
											#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
												#define KEYWORD_PERMUTATION_4
											#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_SHADOWS_SOFT)
												#define KEYWORD_PERMUTATION_5
											#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
												#define KEYWORD_PERMUTATION_6
											#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
												#define KEYWORD_PERMUTATION_7
											#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
												#define KEYWORD_PERMUTATION_8
											#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT)
												#define KEYWORD_PERMUTATION_9
											#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
												#define KEYWORD_PERMUTATION_10
											#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE)
												#define KEYWORD_PERMUTATION_11
											#elif defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
												#define KEYWORD_PERMUTATION_12
											#elif defined(_SHADOWS_SOFT)
												#define KEYWORD_PERMUTATION_13
											#elif defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
												#define KEYWORD_PERMUTATION_14
											#else
												#define KEYWORD_PERMUTATION_15
											#endif


											// Defines
										#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
										#define _SURFACE_TYPE_TRANSPARENT 1
										#endif

										#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
										#define _AlphaClip 1
										#endif

										#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
										#define ATTRIBUTES_NEED_NORMAL
										#endif

										#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
										#define ATTRIBUTES_NEED_TANGENT
										#endif

										#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
										#define ATTRIBUTES_NEED_TEXCOORD0
										#endif

										#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
										#define VARYINGS_NEED_POSITION_WS
										#endif

										#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
										#define VARYINGS_NEED_NORMAL_WS
										#endif

										#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
										#define VARYINGS_NEED_TEXCOORD0
										#endif

										#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
										#define VARYINGS_NEED_VIEWDIRECTION_WS
										#endif

											#define FEATURES_GRAPH_VERTEX
											/* WARNING: $splice Could not find named fragment 'PassInstancing' */
											#define SHADERPASS SHADERPASS_UNLIT
											/* WARNING: $splice Could not find named fragment 'DotsInstancingVars' */

											// Includes
											#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
											#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
											#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
											#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
											#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

											// --------------------------------------------------
											// Structs and Packing

											struct Attributes
											{
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float3 positionOS : POSITION;
												#endif
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float3 normalOS : NORMAL;
												#endif
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float4 tangentOS : TANGENT;
												#endif
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float4 uv0 : TEXCOORD0;
												#endif
												#if UNITY_ANY_INSTANCING_ENABLED
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												uint instanceID : INSTANCEID_SEMANTIC;
												#endif
												#endif
											};
											struct Varyings
											{
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float4 positionCS : SV_POSITION;
												#endif
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float3 positionWS;
												#endif
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float3 normalWS;
												#endif
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float4 texCoord0;
												#endif
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float3 viewDirectionWS;
												#endif
												#if UNITY_ANY_INSTANCING_ENABLED
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												uint instanceID : CUSTOM_INSTANCE_ID;
												#endif
												#endif
												#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
												#endif
												#endif
												#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
												#endif
												#endif
												#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
												#endif
												#endif
											};
											struct SurfaceDescriptionInputs
											{
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float3 WorldSpaceNormal;
												#endif
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float3 WorldSpaceViewDirection;
												#endif
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float3 WorldSpacePosition;
												#endif
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float3 AbsoluteWorldSpacePosition;
												#endif
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float4 ScreenPosition;
												#endif
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float4 uv0;
												#endif
											};
											struct VertexDescriptionInputs
											{
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float3 ObjectSpaceNormal;
												#endif
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float3 ObjectSpaceTangent;
												#endif
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float3 ObjectSpacePosition;
												#endif
											};
											struct PackedVaryings
											{
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float4 positionCS : SV_POSITION;
												#endif
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float3 interp0 : TEXCOORD0;
												#endif
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float3 interp1 : TEXCOORD1;
												#endif
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float4 interp2 : TEXCOORD2;
												#endif
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												float3 interp3 : TEXCOORD3;
												#endif
												#if UNITY_ANY_INSTANCING_ENABLED
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												uint instanceID : CUSTOM_INSTANCE_ID;
												#endif
												#endif
												#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
												#endif
												#endif
												#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
												#endif
												#endif
												#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
												#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
												FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
												#endif
												#endif
											};

											#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
											PackedVaryings PackVaryings(Varyings input)
												{
													PackedVaryings output;
													output.positionCS = input.positionCS;
													output.interp0.xyz = input.positionWS;
													output.interp1.xyz = input.normalWS;
													output.interp2.xyzw = input.texCoord0;
													output.interp3.xyz = input.viewDirectionWS;
													#if UNITY_ANY_INSTANCING_ENABLED
													output.instanceID = input.instanceID;
													#endif
													#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
													output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
													#endif
													#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
													output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
													#endif
													#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
													output.cullFace = input.cullFace;
													#endif
													return output;
												}
												Varyings UnpackVaryings(PackedVaryings input)
												{
													Varyings output;
													output.positionCS = input.positionCS;
													output.positionWS = input.interp0.xyz;
													output.normalWS = input.interp1.xyz;
													output.texCoord0 = input.interp2.xyzw;
													output.viewDirectionWS = input.interp3.xyz;
													#if UNITY_ANY_INSTANCING_ENABLED
													output.instanceID = input.instanceID;
													#endif
													#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
													output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
													#endif
													#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
													output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
													#endif
													#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
													output.cullFace = input.cullFace;
													#endif
													return output;
												}
											#endif

												// --------------------------------------------------
												// Graph

												// Graph Properties
												CBUFFER_START(UnityPerMaterial)
												float4 Texture2D_0a61719aa2ac4656a8ca661fb9b12425_TexelSize;
												float4 Texture2D_4c8109b3fd8b48968abc0c10fc765a06_TexelSize;
												float Vector1_8aa5e25adec34bdabf733d9a643aaf71;
												float Vector1_73ff9ffb74dd4d0687b6353354f5147f;
												float Vector1_366094730b0e4d7cb16f896c6e8f21f0;
												float2 _PositionP;
												float _SizeS;
												float Vector1_983e66acc7c84eeebb58420303a45a77;
												float Vector1_a65e3ce5f90b4c989b988ad54dfc8ca4;
												CBUFFER_END

													// Object and Global properties
													TEXTURE2D(Texture2D_0a61719aa2ac4656a8ca661fb9b12425);
													SAMPLER(samplerTexture2D_0a61719aa2ac4656a8ca661fb9b12425);
													TEXTURE2D(Texture2D_4c8109b3fd8b48968abc0c10fc765a06);
													SAMPLER(samplerTexture2D_4c8109b3fd8b48968abc0c10fc765a06);
													SAMPLER(_SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_Sampler_3_Linear_Repeat);
													SAMPLER(SamplerState_Linear_Clamp);

													// Graph Functions

													void Unity_Hue_Normalized_float(float3 In, float Offset, out float3 Out)
													{
														// RGB to HSV
														float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
														float4 P = lerp(float4(In.bg, K.wz), float4(In.gb, K.xy), step(In.b, In.g));
														float4 Q = lerp(float4(P.xyw, In.r), float4(In.r, P.yzx), step(P.x, In.r));
														float D = Q.x - min(Q.w, Q.y);
														float E = 1e-4;
														float3 hsv = float3(abs(Q.z + (Q.w - Q.y) / (6.0 * D + E)), D / (Q.x + E), Q.x);

														float hue = hsv.x + Offset;
														hsv.x = (hue < 0)
																? hue + 1
																: (hue > 1)
																	? hue - 1
																	: hue;

														// HSV to RGB
														float4 K2 = float4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
														float3 P2 = abs(frac(hsv.xxx + K2.xyz) * 6.0 - K2.www);
														Out = hsv.z * lerp(K2.xxx, saturate(P2 - K2.xxx), hsv.y);
													}

													void Unity_Saturation_float(float3 In, float Saturation, out float3 Out)
													{
														float luma = dot(In, float3(0.2126729, 0.7151522, 0.0721750));
														Out = luma.xxx + Saturation.xxx * (In - luma.xxx);
													}

													// 9ca2a8a42c7c596a4947b3e45af8bd53
													#include "Assets/Shaders/Includes/Lighting.hlsl"

													void Unity_Multiply_float(float A, float B, out float Out)
													{
														Out = A * B;
													}

													void Unity_DotProduct_float3(float3 A, float3 B, out float Out)
													{
														Out = dot(A, B);
													}

													void Unity_Saturate_float(float In, out float Out)
													{
														Out = saturate(In);
													}

													void Unity_Add_float3(float3 A, float3 B, out float3 Out)
													{
														Out = A + B;
													}

													void Unity_Normalize_float3(float3 In, out float3 Out)
													{
														Out = normalize(In);
													}

													void Unity_Add_float(float A, float B, out float Out)
													{
														Out = A + B;
													}

													void Unity_Exponential2_float(float In, out float Out)
													{
														Out = exp2(In);
													}

													struct Bindings_AdjustSmoothness_1f0d48e5497583a44bdffb31bb3df75e
													{
													};

													void SG_AdjustSmoothness_1f0d48e5497583a44bdffb31bb3df75e(float Vector1_92300b3c6e8b4e47b0655851599b0675, Bindings_AdjustSmoothness_1f0d48e5497583a44bdffb31bb3df75e IN, out float Out_1)
													{
														float _Property_221219d8b8a147ef91bbce6cbaba412b_Out_0 = Vector1_92300b3c6e8b4e47b0655851599b0675;
														float _Multiply_340f6bf5d24d4aaa8c2c8144570fd76c_Out_2;
														Unity_Multiply_float(_Property_221219d8b8a147ef91bbce6cbaba412b_Out_0, 10, _Multiply_340f6bf5d24d4aaa8c2c8144570fd76c_Out_2);
														float _Add_0007bea1646c493aaf75ba7e8a4f57bf_Out_2;
														Unity_Add_float(_Multiply_340f6bf5d24d4aaa8c2c8144570fd76c_Out_2, 1, _Add_0007bea1646c493aaf75ba7e8a4f57bf_Out_2);
														float _Exponential_031f9f41b8f6403db8693824caaa6008_Out_1;
														Unity_Exponential2_float(_Add_0007bea1646c493aaf75ba7e8a4f57bf_Out_2, _Exponential_031f9f41b8f6403db8693824caaa6008_Out_1);
														Out_1 = _Exponential_031f9f41b8f6403db8693824caaa6008_Out_1;
													}

													void Unity_Power_float(float A, float B, out float Out)
													{
														Out = pow(A, B);
													}

													struct Bindings_CalculateMainLight_461292f6b16b62549aeb8366345bb7a5
													{
														float3 WorldSpaceNormal;
														float3 WorldSpaceViewDirection;
														float3 AbsoluteWorldSpacePosition;
													};

													void SG_CalculateMainLight_461292f6b16b62549aeb8366345bb7a5(float Vector1_d7231844d8fb429da1fd259435bbbe93, Bindings_CalculateMainLight_461292f6b16b62549aeb8366345bb7a5 IN, out float3 Color_1, out float Diffuse_2, out float Specular_3)
													{
														float3 _CustomFunction_9dde773e33224a229db66bf007a422ed_Direction_1;
														float3 _CustomFunction_9dde773e33224a229db66bf007a422ed_Color_2;
														float _CustomFunction_9dde773e33224a229db66bf007a422ed_DistanceAtten_3;
														float _CustomFunction_9dde773e33224a229db66bf007a422ed_ShadowAtten_4;
														CalculateMainLight_float(IN.AbsoluteWorldSpacePosition, _CustomFunction_9dde773e33224a229db66bf007a422ed_Direction_1, _CustomFunction_9dde773e33224a229db66bf007a422ed_Color_2, _CustomFunction_9dde773e33224a229db66bf007a422ed_DistanceAtten_3, _CustomFunction_9dde773e33224a229db66bf007a422ed_ShadowAtten_4);
														float _Multiply_bcc526cf2b254856bcef8be86a554939_Out_2;
														Unity_Multiply_float(_CustomFunction_9dde773e33224a229db66bf007a422ed_DistanceAtten_3, _CustomFunction_9dde773e33224a229db66bf007a422ed_ShadowAtten_4, _Multiply_bcc526cf2b254856bcef8be86a554939_Out_2);
														float _DotProduct_53ce563ea07a45a196cbea76896406f1_Out_2;
														Unity_DotProduct_float3(_CustomFunction_9dde773e33224a229db66bf007a422ed_Direction_1, IN.WorldSpaceNormal, _DotProduct_53ce563ea07a45a196cbea76896406f1_Out_2);
														float _Saturate_c882e2c669084435ae24e75793861000_Out_1;
														Unity_Saturate_float(_DotProduct_53ce563ea07a45a196cbea76896406f1_Out_2, _Saturate_c882e2c669084435ae24e75793861000_Out_1);
														float _Multiply_cf752347adfe4ce1acc5720b09b138f3_Out_2;
														Unity_Multiply_float(_Multiply_bcc526cf2b254856bcef8be86a554939_Out_2, _Saturate_c882e2c669084435ae24e75793861000_Out_1, _Multiply_cf752347adfe4ce1acc5720b09b138f3_Out_2);
														float3 _Add_1bf26a2e3e584ffca9fe8ae253d477b4_Out_2;
														Unity_Add_float3(_CustomFunction_9dde773e33224a229db66bf007a422ed_Direction_1, IN.WorldSpaceViewDirection, _Add_1bf26a2e3e584ffca9fe8ae253d477b4_Out_2);
														float3 _Normalize_1d7fa61060db4168a5cdca058c45cf8c_Out_1;
														Unity_Normalize_float3(_Add_1bf26a2e3e584ffca9fe8ae253d477b4_Out_2, _Normalize_1d7fa61060db4168a5cdca058c45cf8c_Out_1);
														float _DotProduct_c3574d672061428ea7a2a4f16f3774da_Out_2;
														Unity_DotProduct_float3(IN.WorldSpaceNormal, _Normalize_1d7fa61060db4168a5cdca058c45cf8c_Out_1, _DotProduct_c3574d672061428ea7a2a4f16f3774da_Out_2);
														float _Saturate_ca971a87c15749c287c71e242366e810_Out_1;
														Unity_Saturate_float(_DotProduct_c3574d672061428ea7a2a4f16f3774da_Out_2, _Saturate_ca971a87c15749c287c71e242366e810_Out_1);
														float _Property_7499b0518cf0429bb646a1dc8f1ce4a0_Out_0 = Vector1_d7231844d8fb429da1fd259435bbbe93;
														Bindings_AdjustSmoothness_1f0d48e5497583a44bdffb31bb3df75e _AdjustSmoothness_8262d5b465704040807fa568851dc6d7;
														float _AdjustSmoothness_8262d5b465704040807fa568851dc6d7_Out_1;
														SG_AdjustSmoothness_1f0d48e5497583a44bdffb31bb3df75e(_Property_7499b0518cf0429bb646a1dc8f1ce4a0_Out_0, _AdjustSmoothness_8262d5b465704040807fa568851dc6d7, _AdjustSmoothness_8262d5b465704040807fa568851dc6d7_Out_1);
														float _Power_478980748dd544618cda00e6d75a6f84_Out_2;
														Unity_Power_float(_Saturate_ca971a87c15749c287c71e242366e810_Out_1, _AdjustSmoothness_8262d5b465704040807fa568851dc6d7_Out_1, _Power_478980748dd544618cda00e6d75a6f84_Out_2);
														float _Multiply_1d4463a4bfdc4aed9c821cb37d2a3f82_Out_2;
														Unity_Multiply_float(_Multiply_cf752347adfe4ce1acc5720b09b138f3_Out_2, _Power_478980748dd544618cda00e6d75a6f84_Out_2, _Multiply_1d4463a4bfdc4aed9c821cb37d2a3f82_Out_2);
														Color_1 = _CustomFunction_9dde773e33224a229db66bf007a422ed_Color_2;
														Diffuse_2 = _Multiply_cf752347adfe4ce1acc5720b09b138f3_Out_2;
														Specular_3 = _Multiply_1d4463a4bfdc4aed9c821cb37d2a3f82_Out_2;
													}

													struct Bindings_AddAdditionalLights_e0ca8cced9af1114f8d573bbf9267b91
													{
														float3 WorldSpaceNormal;
														float3 WorldSpaceViewDirection;
														float3 WorldSpacePosition;
													};

													void SG_AddAdditionalLights_e0ca8cced9af1114f8d573bbf9267b91(float Vector1_e3fc3430194347bc9dced066a4393e33, float Vector1_473b9a9f9006435a93128b3fe00e5fbc, float3 Vector3_4a3aa6554972429381fa75348b565937, float Vector1_924164549e4f48bfacd71aa424d9365d, Bindings_AddAdditionalLights_e0ca8cced9af1114f8d573bbf9267b91 IN, out float Diffuse_1, out float Specular_2, out float3 Color_3)
													{
														float _Property_fcfdff7c911f4bda8de84c236b30efc5_Out_0 = Vector1_924164549e4f48bfacd71aa424d9365d;
														Bindings_AdjustSmoothness_1f0d48e5497583a44bdffb31bb3df75e _AdjustSmoothness_29e7995fc47b4af8985d0401272852c3;
														float _AdjustSmoothness_29e7995fc47b4af8985d0401272852c3_Out_1;
														SG_AdjustSmoothness_1f0d48e5497583a44bdffb31bb3df75e(_Property_fcfdff7c911f4bda8de84c236b30efc5_Out_0, _AdjustSmoothness_29e7995fc47b4af8985d0401272852c3, _AdjustSmoothness_29e7995fc47b4af8985d0401272852c3_Out_1);
														float _Property_42736c8a41aa47ac92d9bdfbf8d54c11_Out_0 = Vector1_e3fc3430194347bc9dced066a4393e33;
														float _Property_245d51c3d18245cea338aa94387aa94c_Out_0 = Vector1_473b9a9f9006435a93128b3fe00e5fbc;
														float3 _Property_48c00e8d7da049b1860e05faff89a4e0_Out_0 = Vector3_4a3aa6554972429381fa75348b565937;
														float _CustomFunction_3b42e28b13124ba19b74421f276d7cbc_Diffuse_7;
														float _CustomFunction_3b42e28b13124ba19b74421f276d7cbc_Specular_8;
														float3 _CustomFunction_3b42e28b13124ba19b74421f276d7cbc_Color_9;
														AddAdditionalLights_float(_AdjustSmoothness_29e7995fc47b4af8985d0401272852c3_Out_1, IN.WorldSpaceNormal, IN.WorldSpacePosition, IN.WorldSpaceViewDirection, _Property_42736c8a41aa47ac92d9bdfbf8d54c11_Out_0, _Property_245d51c3d18245cea338aa94387aa94c_Out_0, _Property_48c00e8d7da049b1860e05faff89a4e0_Out_0, _CustomFunction_3b42e28b13124ba19b74421f276d7cbc_Diffuse_7, _CustomFunction_3b42e28b13124ba19b74421f276d7cbc_Specular_8, _CustomFunction_3b42e28b13124ba19b74421f276d7cbc_Color_9);
														Diffuse_1 = _CustomFunction_3b42e28b13124ba19b74421f276d7cbc_Diffuse_7;
														Specular_2 = _CustomFunction_3b42e28b13124ba19b74421f276d7cbc_Specular_8;
														Color_3 = _CustomFunction_3b42e28b13124ba19b74421f276d7cbc_Color_9;
													}

													void Unity_ColorspaceConversion_RGB_HSV_float(float3 In, out float3 Out)
													{
														float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
														float4 P = lerp(float4(In.bg, K.wz), float4(In.gb, K.xy), step(In.b, In.g));
														float4 Q = lerp(float4(P.xyw, In.r), float4(In.r, P.yzx), step(P.x, In.r));
														float D = Q.x - min(Q.w, Q.y);
														float  E = 1e-10;
														Out = float3(abs(Q.z + (Q.w - Q.y) / (6.0 * D + E)), D / (Q.x + E), Q.x);
													}

													void Unity_ColorspaceConversion_HSV_RGB_float(float3 In, out float3 Out)
													{
														float4 K = float4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
														float3 P = abs(frac(In.xxx + K.xyz) * 6.0 - K.www);
														Out = In.z * lerp(K.xxx, saturate(P - K.xxx), In.y);
													}

													struct Bindings_CalculateLights_0c86135d169f3ee4ca18edf1c652f7e3
													{
														float3 WorldSpaceNormal;
														float3 WorldSpaceViewDirection;
														float3 WorldSpacePosition;
														float3 AbsoluteWorldSpacePosition;
													};

													void SG_CalculateLights_0c86135d169f3ee4ca18edf1c652f7e3(float Vector1_7138480fa3104ac4b569fee691e242d3, Bindings_CalculateLights_0c86135d169f3ee4ca18edf1c652f7e3 IN, out float3 Color_1, out float Diffuse_2, out float Specular_3)
													{
														float _Property_ad061012c73c4cc08493cc074115a92b_Out_0 = Vector1_7138480fa3104ac4b569fee691e242d3;
														Bindings_CalculateMainLight_461292f6b16b62549aeb8366345bb7a5 _CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477;
														_CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477.WorldSpaceNormal = IN.WorldSpaceNormal;
														_CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477.WorldSpaceViewDirection = IN.WorldSpaceViewDirection;
														_CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
														float3 _CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477_Color_1;
														float _CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477_Diffuse_2;
														float _CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477_Specular_3;
														SG_CalculateMainLight_461292f6b16b62549aeb8366345bb7a5(_Property_ad061012c73c4cc08493cc074115a92b_Out_0, _CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477, _CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477_Color_1, _CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477_Diffuse_2, _CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477_Specular_3);
														float _Property_334be742dea14f93b71e80df2d722abb_Out_0 = Vector1_7138480fa3104ac4b569fee691e242d3;
														Bindings_AddAdditionalLights_e0ca8cced9af1114f8d573bbf9267b91 _AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9;
														_AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9.WorldSpaceNormal = IN.WorldSpaceNormal;
														_AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9.WorldSpaceViewDirection = IN.WorldSpaceViewDirection;
														_AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9.WorldSpacePosition = IN.WorldSpacePosition;
														float _AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9_Diffuse_1;
														float _AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9_Specular_2;
														float3 _AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9_Color_3;
														SG_AddAdditionalLights_e0ca8cced9af1114f8d573bbf9267b91(_CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477_Diffuse_2, _CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477_Specular_3, _CalculateMainLight_00a4a4ef1e624dd1a9c1a1a810b0c477_Color_1, _Property_334be742dea14f93b71e80df2d722abb_Out_0, _AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9, _AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9_Diffuse_1, _AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9_Specular_2, _AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9_Color_3);
														float3 _ColorspaceConversion_a1764797872441c6b4ff04cd46115484_Out_1;
														Unity_ColorspaceConversion_RGB_HSV_float(_AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9_Color_3, _ColorspaceConversion_a1764797872441c6b4ff04cd46115484_Out_1);
														float _Split_d62321a0c7b94d3395d1c407f8cb1c76_R_1 = _ColorspaceConversion_a1764797872441c6b4ff04cd46115484_Out_1[0];
														float _Split_d62321a0c7b94d3395d1c407f8cb1c76_G_2 = _ColorspaceConversion_a1764797872441c6b4ff04cd46115484_Out_1[1];
														float _Split_d62321a0c7b94d3395d1c407f8cb1c76_B_3 = _ColorspaceConversion_a1764797872441c6b4ff04cd46115484_Out_1[2];
														float _Split_d62321a0c7b94d3395d1c407f8cb1c76_A_4 = 0;
														float3 _Vector3_5ec7f6923ca642d5b880a19ad978fbb6_Out_0 = float3(_Split_d62321a0c7b94d3395d1c407f8cb1c76_R_1, _Split_d62321a0c7b94d3395d1c407f8cb1c76_G_2, 1);
														float3 _ColorspaceConversion_563826bff2204a9da3df9b4b1fb90832_Out_1;
														Unity_ColorspaceConversion_HSV_RGB_float(_Vector3_5ec7f6923ca642d5b880a19ad978fbb6_Out_0, _ColorspaceConversion_563826bff2204a9da3df9b4b1fb90832_Out_1);
														Color_1 = _ColorspaceConversion_563826bff2204a9da3df9b4b1fb90832_Out_1;
														Diffuse_2 = _AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9_Diffuse_1;
														Specular_3 = _AddAdditionalLights_9ee48c36fe834d3c9da17c5916568bf9_Specular_2;
													}

													void Unity_Multiply_float(float3 A, float3 B, out float3 Out)
													{
														Out = A * B;
													}

													struct Bindings_CalculateLightingRamp_f9083e7f4ef97944aa683bd2cc271eec
													{
													};

													void SG_CalculateLightingRamp_f9083e7f4ef97944aa683bd2cc271eec(float3 Vector3_93e84ad36d1b4ea8b8f6c0c9adcf0865, float Vector1_c32b4cfbaa0c443f8a7f5823fec8cd7e, TEXTURE2D_PARAM(Texture2D_1b486b175c1549408f04d81896a3d082, samplerTexture2D_1b486b175c1549408f04d81896a3d082), float4 Texture2D_1b486b175c1549408f04d81896a3d082_TexelSize, float Vector1_b73a3e9e7d8f4fbca4cd823bd00382b4, Bindings_CalculateLightingRamp_f9083e7f4ef97944aa683bd2cc271eec IN, out float3 Out_1)
													{
														float3 _Property_d6d30944102243d7bf7ba1eb098a4d84_Out_0 = Vector3_93e84ad36d1b4ea8b8f6c0c9adcf0865;
														float _Property_3bc98c59d28743c39c466fc49cf34921_Out_0 = Vector1_c32b4cfbaa0c443f8a7f5823fec8cd7e;
														float _Property_ae12adae892945b6b8c01902ce86a49c_Out_0 = Vector1_b73a3e9e7d8f4fbca4cd823bd00382b4;
														float2 _Vector2_fdbc5e83606a4783af197b11b3f73d8a_Out_0 = float2(_Property_3bc98c59d28743c39c466fc49cf34921_Out_0, _Property_ae12adae892945b6b8c01902ce86a49c_Out_0);
														#if defined(SHADER_API_GLES) && (SHADER_TARGET < 30)
														  float4 _SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_RGBA_0 = float4(0.0f, 0.0f, 0.0f, 1.0f);
														#else
														  float4 _SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_RGBA_0 = SAMPLE_TEXTURE2D_LOD(Texture2D_1b486b175c1549408f04d81896a3d082, SamplerState_Linear_Clamp, _Vector2_fdbc5e83606a4783af197b11b3f73d8a_Out_0, 0);
														#endif
														float _SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_R_5 = _SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_RGBA_0.r;
														float _SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_G_6 = _SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_RGBA_0.g;
														float _SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_B_7 = _SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_RGBA_0.b;
														float _SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_A_8 = _SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_RGBA_0.a;
														float3 _Multiply_8cfab02808e64cdfabeb670f144a1552_Out_2;
														Unity_Multiply_float(_Property_d6d30944102243d7bf7ba1eb098a4d84_Out_0, (_SampleTexture2DLOD_67695ef3fdda42d9a1f58532a49a9023_R_5.xxx), _Multiply_8cfab02808e64cdfabeb670f144a1552_Out_2);
														Out_1 = _Multiply_8cfab02808e64cdfabeb670f144a1552_Out_2;
													}

													void Unity_Remap_float2(float2 In, float2 InMinMax, float2 OutMinMax, out float2 Out)
													{
														Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
													}

													void Unity_Add_float2(float2 A, float2 B, out float2 Out)
													{
														Out = A + B;
													}

													void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
													{
														Out = UV * Tiling + Offset;
													}

													void Unity_Multiply_float(float2 A, float2 B, out float2 Out)
													{
														Out = A * B;
													}

													void Unity_Subtract_float2(float2 A, float2 B, out float2 Out)
													{
														Out = A - B;
													}

													void Unity_Divide_float(float A, float B, out float Out)
													{
														Out = A / B;
													}

													void Unity_Divide_float2(float2 A, float2 B, out float2 Out)
													{
														Out = A / B;
													}

													void Unity_Length_float2(float2 In, out float Out)
													{
														Out = length(In);
													}

													void Unity_OneMinus_float(float In, out float Out)
													{
														Out = 1 - In;
													}

													void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
													{
														Out = smoothstep(Edge1, Edge2, In);
													}

													// Graph Vertex
													struct VertexDescription
													{
														float3 Position;
														float3 Normal;
														float3 Tangent;
													};

													VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
													{
														VertexDescription description = (VertexDescription)0;
														description.Position = IN.ObjectSpacePosition;
														description.Normal = IN.ObjectSpaceNormal;
														description.Tangent = IN.ObjectSpaceTangent;
														return description;
													}

													// Graph Pixel
													struct SurfaceDescription
													{
														float3 BaseColor;
														float Alpha;
														float AlphaClipThreshold;
													};

													SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
													{
														SurfaceDescription surface = (SurfaceDescription)0;
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float4 _UV_458ec5651131453fadd17a8a489c5875_Out_0 = IN.uv0;
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float4 _SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_RGBA_0 = SAMPLE_TEXTURE2D(Texture2D_4c8109b3fd8b48968abc0c10fc765a06, samplerTexture2D_4c8109b3fd8b48968abc0c10fc765a06, (_UV_458ec5651131453fadd17a8a489c5875_Out_0.xy));
														float _SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_R_4 = _SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_RGBA_0.r;
														float _SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_G_5 = _SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_RGBA_0.g;
														float _SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_B_6 = _SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_RGBA_0.b;
														float _SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_A_7 = _SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_RGBA_0.a;
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float _Property_d0c829cc66e24e97b0d19a6d7c5816ea_Out_0 = Vector1_73ff9ffb74dd4d0687b6353354f5147f;
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float3 _Hue_9ee969bf899d49978e31bc9302db2279_Out_2;
														Unity_Hue_Normalized_float((_SampleTexture2D_f716c70efbaf4279833a7bbe5a9949b9_RGBA_0.xyz), _Property_d0c829cc66e24e97b0d19a6d7c5816ea_Out_0, _Hue_9ee969bf899d49978e31bc9302db2279_Out_2);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float _Property_cad7851042934a1f8f47516d97d09f82_Out_0 = Vector1_366094730b0e4d7cb16f896c6e8f21f0;
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float3 _Saturation_37ef3e5174ee458da3d81de2303d4fea_Out_2;
														Unity_Saturation_float(_Hue_9ee969bf899d49978e31bc9302db2279_Out_2, _Property_cad7851042934a1f8f47516d97d09f82_Out_0, _Saturation_37ef3e5174ee458da3d81de2303d4fea_Out_2);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float _Property_40fc2359ba494b1eacab89c4cac69363_Out_0 = Vector1_8aa5e25adec34bdabf733d9a643aaf71;
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														Bindings_CalculateLights_0c86135d169f3ee4ca18edf1c652f7e3 _CalculateLights_7c0e90cd22134717bebf3338457ac5b2;
														_CalculateLights_7c0e90cd22134717bebf3338457ac5b2.WorldSpaceNormal = IN.WorldSpaceNormal;
														_CalculateLights_7c0e90cd22134717bebf3338457ac5b2.WorldSpaceViewDirection = IN.WorldSpaceViewDirection;
														_CalculateLights_7c0e90cd22134717bebf3338457ac5b2.WorldSpacePosition = IN.WorldSpacePosition;
														_CalculateLights_7c0e90cd22134717bebf3338457ac5b2.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
														float3 _CalculateLights_7c0e90cd22134717bebf3338457ac5b2_Color_1;
														float _CalculateLights_7c0e90cd22134717bebf3338457ac5b2_Diffuse_2;
														float _CalculateLights_7c0e90cd22134717bebf3338457ac5b2_Specular_3;
														SG_CalculateLights_0c86135d169f3ee4ca18edf1c652f7e3(_Property_40fc2359ba494b1eacab89c4cac69363_Out_0, _CalculateLights_7c0e90cd22134717bebf3338457ac5b2, _CalculateLights_7c0e90cd22134717bebf3338457ac5b2_Color_1, _CalculateLights_7c0e90cd22134717bebf3338457ac5b2_Diffuse_2, _CalculateLights_7c0e90cd22134717bebf3338457ac5b2_Specular_3);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														Bindings_CalculateLightingRamp_f9083e7f4ef97944aa683bd2cc271eec _CalculateLightingRamp_f078baa6a2784b519454bec52f750c84;
														float3 _CalculateLightingRamp_f078baa6a2784b519454bec52f750c84_Out_1;
														SG_CalculateLightingRamp_f9083e7f4ef97944aa683bd2cc271eec(_CalculateLights_7c0e90cd22134717bebf3338457ac5b2_Color_1, _CalculateLights_7c0e90cd22134717bebf3338457ac5b2_Diffuse_2, TEXTURE2D_ARGS(Texture2D_0a61719aa2ac4656a8ca661fb9b12425, samplerTexture2D_0a61719aa2ac4656a8ca661fb9b12425), Texture2D_0a61719aa2ac4656a8ca661fb9b12425_TexelSize, 0, _CalculateLightingRamp_f078baa6a2784b519454bec52f750c84, _CalculateLightingRamp_f078baa6a2784b519454bec52f750c84_Out_1);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float3 _Multiply_927d6fde4cdd4536a09806be7f40975a_Out_2;
														Unity_Multiply_float(_Saturation_37ef3e5174ee458da3d81de2303d4fea_Out_2, _CalculateLightingRamp_f078baa6a2784b519454bec52f750c84_Out_1, _Multiply_927d6fde4cdd4536a09806be7f40975a_Out_2);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														Bindings_CalculateLightingRamp_f9083e7f4ef97944aa683bd2cc271eec _CalculateLightingRamp_c24f577623c24c05993c6c2fc9b5ca5b;
														float3 _CalculateLightingRamp_c24f577623c24c05993c6c2fc9b5ca5b_Out_1;
														SG_CalculateLightingRamp_f9083e7f4ef97944aa683bd2cc271eec(_CalculateLights_7c0e90cd22134717bebf3338457ac5b2_Color_1, _CalculateLights_7c0e90cd22134717bebf3338457ac5b2_Specular_3, TEXTURE2D_ARGS(Texture2D_0a61719aa2ac4656a8ca661fb9b12425, samplerTexture2D_0a61719aa2ac4656a8ca661fb9b12425), Texture2D_0a61719aa2ac4656a8ca661fb9b12425_TexelSize, 1, _CalculateLightingRamp_c24f577623c24c05993c6c2fc9b5ca5b, _CalculateLightingRamp_c24f577623c24c05993c6c2fc9b5ca5b_Out_1);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float3 _Add_28314a78e110405bb42f86246d854582_Out_2;
														Unity_Add_float3(_Multiply_927d6fde4cdd4536a09806be7f40975a_Out_2, _CalculateLightingRamp_c24f577623c24c05993c6c2fc9b5ca5b_Out_1, _Add_28314a78e110405bb42f86246d854582_Out_2);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float _Property_722d3873d582435abe485e38cc24b2cf_Out_0 = Vector1_983e66acc7c84eeebb58420303a45a77;
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float4 _ScreenPosition_9c48f7ea34234579bf12cce42a81188e_Out_0 = float4(IN.ScreenPosition.xy / IN.ScreenPosition.w, 0, 0);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float2 _Property_a03e88fcc10e499f99eed342d5292a88_Out_0 = _PositionP;
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float2 _Remap_7e074b94ef264fc0b318441c100bd2cc_Out_3;
														Unity_Remap_float2(_Property_a03e88fcc10e499f99eed342d5292a88_Out_0, float2 (0, 1), float2 (0.5, -1.5), _Remap_7e074b94ef264fc0b318441c100bd2cc_Out_3);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float2 _Add_ccdd586c0b244e02a60e05afc82418f2_Out_2;
														Unity_Add_float2((_ScreenPosition_9c48f7ea34234579bf12cce42a81188e_Out_0.xy), _Remap_7e074b94ef264fc0b318441c100bd2cc_Out_3, _Add_ccdd586c0b244e02a60e05afc82418f2_Out_2);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float2 _TilingAndOffset_79894f2c83a447a89faf78ac8fe86d57_Out_3;
														Unity_TilingAndOffset_float((_ScreenPosition_9c48f7ea34234579bf12cce42a81188e_Out_0.xy), float2 (1, 1), _Add_ccdd586c0b244e02a60e05afc82418f2_Out_2, _TilingAndOffset_79894f2c83a447a89faf78ac8fe86d57_Out_3);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float2 _Multiply_9d847ff9ce1248a3a2774e001b139e74_Out_2;
														Unity_Multiply_float(_TilingAndOffset_79894f2c83a447a89faf78ac8fe86d57_Out_3, float2(2, 2), _Multiply_9d847ff9ce1248a3a2774e001b139e74_Out_2);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float2 _Subtract_96816b4647194f5b8f6fc08717ae1455_Out_2;
														Unity_Subtract_float2(_Multiply_9d847ff9ce1248a3a2774e001b139e74_Out_2, float2(1, 1), _Subtract_96816b4647194f5b8f6fc08717ae1455_Out_2);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float _Divide_4a30a1a0cd9a4110a0c3d5f73d4b00c5_Out_2;
														Unity_Divide_float(unity_OrthoParams.y, unity_OrthoParams.x, _Divide_4a30a1a0cd9a4110a0c3d5f73d4b00c5_Out_2);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float _Property_f112483e6e1e4931b7335acf88585f4b_Out_0 = _SizeS;
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float _Multiply_1c6959130546437abc098a59891edfde_Out_2;
														Unity_Multiply_float(_Divide_4a30a1a0cd9a4110a0c3d5f73d4b00c5_Out_2, _Property_f112483e6e1e4931b7335acf88585f4b_Out_0, _Multiply_1c6959130546437abc098a59891edfde_Out_2);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float2 _Vector2_2ec4e4d241064c3dbf9dda843c3126a5_Out_0 = float2(_Multiply_1c6959130546437abc098a59891edfde_Out_2, _Property_f112483e6e1e4931b7335acf88585f4b_Out_0);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float2 _Divide_608ad307f8c44b8f82fdbd485fc435bd_Out_2;
														Unity_Divide_float2(_Subtract_96816b4647194f5b8f6fc08717ae1455_Out_2, _Vector2_2ec4e4d241064c3dbf9dda843c3126a5_Out_0, _Divide_608ad307f8c44b8f82fdbd485fc435bd_Out_2);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float _Length_2671319deb0846c586d0862346f04fc7_Out_1;
														Unity_Length_float2(_Divide_608ad307f8c44b8f82fdbd485fc435bd_Out_2, _Length_2671319deb0846c586d0862346f04fc7_Out_1);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float _OneMinus_a317c382855b4dfcb1a7ab6f5ff767dc_Out_1;
														Unity_OneMinus_float(_Length_2671319deb0846c586d0862346f04fc7_Out_1, _OneMinus_a317c382855b4dfcb1a7ab6f5ff767dc_Out_1);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float _Saturate_933b41d482394ae4a32b9f149f129f64_Out_1;
														Unity_Saturate_float(_OneMinus_a317c382855b4dfcb1a7ab6f5ff767dc_Out_1, _Saturate_933b41d482394ae4a32b9f149f129f64_Out_1);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float _Smoothstep_46f4a8caf1ac42f0ad005385aed8deb4_Out_3;
														Unity_Smoothstep_float(0, _Property_722d3873d582435abe485e38cc24b2cf_Out_0, _Saturate_933b41d482394ae4a32b9f149f129f64_Out_1, _Smoothstep_46f4a8caf1ac42f0ad005385aed8deb4_Out_3);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float _Property_6ab1ca603f15443da03497daee2ad631_Out_0 = Vector1_a65e3ce5f90b4c989b988ad54dfc8ca4;
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float _Multiply_0b1d234506be449aac12054383b99708_Out_2;
														Unity_Multiply_float(_Smoothstep_46f4a8caf1ac42f0ad005385aed8deb4_Out_3, _Property_6ab1ca603f15443da03497daee2ad631_Out_0, _Multiply_0b1d234506be449aac12054383b99708_Out_2);
														#endif
														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float _OneMinus_d49a076f00f746ca9b7c2d7f79323475_Out_1;
														Unity_OneMinus_float(_Multiply_0b1d234506be449aac12054383b99708_Out_2, _OneMinus_d49a076f00f746ca9b7c2d7f79323475_Out_1);
														#endif
														surface.BaseColor = _Add_28314a78e110405bb42f86246d854582_Out_2;
														surface.Alpha = _OneMinus_d49a076f00f746ca9b7c2d7f79323475_Out_1;
														surface.AlphaClipThreshold = 0.5;
														return surface;
													}

													// --------------------------------------------------
													// Build Graph Inputs

													VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
													{
														VertexDescriptionInputs output;
														ZERO_INITIALIZE(VertexDescriptionInputs, output);

													#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
													output.ObjectSpaceNormal = input.normalOS;
													#endif

													#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
													output.ObjectSpaceTangent = input.tangentOS;
													#endif

													#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
													output.ObjectSpacePosition = input.positionOS;
													#endif


														return output;
													}

													SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
													{
														SurfaceDescriptionInputs output;
														ZERO_INITIALIZE(SurfaceDescriptionInputs, output);

													#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														// must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
														#endif

														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														float3 unnormalizedNormalWS = input.normalWS;
														#endif

														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														const float renormFactor = 1.0 / length(unnormalizedNormalWS);
														#endif



														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;		// we want a unit length Normal Vector node in shader graph
														#endif



														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														output.WorldSpaceViewDirection = input.viewDirectionWS; //TODO: by default normalized in HD, but not in universal
														#endif

														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														output.WorldSpacePosition = input.positionWS;
														#endif

														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
														#endif

														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														output.ScreenPosition = ComputeScreenPos(TransformWorldToHClip(input.positionWS), _ProjectionParams.x);
														#endif

														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														output.uv0 = input.texCoord0;
														#endif

														#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
														#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
														#else
														#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
														#endif
														#undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN

															return output;
														}


													// --------------------------------------------------
													// Main

													#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
													#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
													#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/UnlitPass.hlsl"

													ENDHLSL
												}
												Pass
												{
													Name "ShadowCaster"
													Tags
													{
														"LightMode" = "ShadowCaster"
													}

														// Render State
														Cull Back
														Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
														ZTest LEqual
														ZWrite On
														ColorMask 0

														// Debug
														// <None>

														// --------------------------------------------------
														// Pass

														HLSLPROGRAM

														// Pragmas
														#pragma target 4.5
														#pragma exclude_renderers gles gles3 glcore
														#pragma multi_compile_instancing
														#pragma multi_compile _ DOTS_INSTANCING_ON
														#pragma vertex vert
														#pragma fragment frag

														// DotsInstancingOptions: <None>
														// HybridV1InjectedBuiltinProperties: <None>

														// Keywords
														// PassKeywords: <None>
														#pragma multi_compile_local _ MAIN_LIGHT_CALCULATE_SHADOWS
														#pragma multi_compile_local _ _MAIN_LIGHT_SHADOWS_CASCADE
														#pragma multi_compile_local _ _SHADOWS_SOFT
														#pragma multi_compile_local _ ADDITIONAL_LIGHT_CALCULATE_SHADOWS

														#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
															#define KEYWORD_PERMUTATION_0
														#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT)
															#define KEYWORD_PERMUTATION_1
														#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
															#define KEYWORD_PERMUTATION_2
														#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE)
															#define KEYWORD_PERMUTATION_3
														#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
															#define KEYWORD_PERMUTATION_4
														#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_SHADOWS_SOFT)
															#define KEYWORD_PERMUTATION_5
														#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
															#define KEYWORD_PERMUTATION_6
														#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
															#define KEYWORD_PERMUTATION_7
														#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
															#define KEYWORD_PERMUTATION_8
														#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT)
															#define KEYWORD_PERMUTATION_9
														#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
															#define KEYWORD_PERMUTATION_10
														#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE)
															#define KEYWORD_PERMUTATION_11
														#elif defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
															#define KEYWORD_PERMUTATION_12
														#elif defined(_SHADOWS_SOFT)
															#define KEYWORD_PERMUTATION_13
														#elif defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
															#define KEYWORD_PERMUTATION_14
														#else
															#define KEYWORD_PERMUTATION_15
														#endif


														// Defines
													#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
													#define _SURFACE_TYPE_TRANSPARENT 1
													#endif

													#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
													#define _AlphaClip 1
													#endif

													#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
													#define ATTRIBUTES_NEED_NORMAL
													#endif

													#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
													#define ATTRIBUTES_NEED_TANGENT
													#endif

													#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
													#define VARYINGS_NEED_POSITION_WS
													#endif

														#define FEATURES_GRAPH_VERTEX
														/* WARNING: $splice Could not find named fragment 'PassInstancing' */
														#define SHADERPASS SHADERPASS_SHADOWCASTER
														/* WARNING: $splice Could not find named fragment 'DotsInstancingVars' */

														// Includes
														#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
														#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
														#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
														#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
														#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

														// --------------------------------------------------
														// Structs and Packing

														struct Attributes
														{
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															float3 positionOS : POSITION;
															#endif
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															float3 normalOS : NORMAL;
															#endif
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															float4 tangentOS : TANGENT;
															#endif
															#if UNITY_ANY_INSTANCING_ENABLED
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															uint instanceID : INSTANCEID_SEMANTIC;
															#endif
															#endif
														};
														struct Varyings
														{
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															float4 positionCS : SV_POSITION;
															#endif
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															float3 positionWS;
															#endif
															#if UNITY_ANY_INSTANCING_ENABLED
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															uint instanceID : CUSTOM_INSTANCE_ID;
															#endif
															#endif
															#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
															#endif
															#endif
															#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
															#endif
															#endif
															#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
															#endif
															#endif
														};
														struct SurfaceDescriptionInputs
														{
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															float3 WorldSpacePosition;
															#endif
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															float4 ScreenPosition;
															#endif
														};
														struct VertexDescriptionInputs
														{
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															float3 ObjectSpaceNormal;
															#endif
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															float3 ObjectSpaceTangent;
															#endif
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															float3 ObjectSpacePosition;
															#endif
														};
														struct PackedVaryings
														{
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															float4 positionCS : SV_POSITION;
															#endif
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															float3 interp0 : TEXCOORD0;
															#endif
															#if UNITY_ANY_INSTANCING_ENABLED
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															uint instanceID : CUSTOM_INSTANCE_ID;
															#endif
															#endif
															#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
															#endif
															#endif
															#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
															#endif
															#endif
															#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
															#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
															FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
															#endif
															#endif
														};

														#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
														PackedVaryings PackVaryings(Varyings input)
															{
																PackedVaryings output;
																output.positionCS = input.positionCS;
																output.interp0.xyz = input.positionWS;
																#if UNITY_ANY_INSTANCING_ENABLED
																output.instanceID = input.instanceID;
																#endif
																#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
																output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
																#endif
																#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
																output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
																#endif
																#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
																output.cullFace = input.cullFace;
																#endif
																return output;
															}
															Varyings UnpackVaryings(PackedVaryings input)
															{
																Varyings output;
																output.positionCS = input.positionCS;
																output.positionWS = input.interp0.xyz;
																#if UNITY_ANY_INSTANCING_ENABLED
																output.instanceID = input.instanceID;
																#endif
																#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
																output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
																#endif
																#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
																output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
																#endif
																#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
																output.cullFace = input.cullFace;
																#endif
																return output;
															}
														#endif

															// --------------------------------------------------
															// Graph

															// Graph Properties
															CBUFFER_START(UnityPerMaterial)
															float4 Texture2D_0a61719aa2ac4656a8ca661fb9b12425_TexelSize;
															float4 Texture2D_4c8109b3fd8b48968abc0c10fc765a06_TexelSize;
															float Vector1_8aa5e25adec34bdabf733d9a643aaf71;
															float Vector1_73ff9ffb74dd4d0687b6353354f5147f;
															float Vector1_366094730b0e4d7cb16f896c6e8f21f0;
															float2 _PositionP;
															float _SizeS;
															float Vector1_983e66acc7c84eeebb58420303a45a77;
															float Vector1_a65e3ce5f90b4c989b988ad54dfc8ca4;
															CBUFFER_END

																// Object and Global properties
																TEXTURE2D(Texture2D_0a61719aa2ac4656a8ca661fb9b12425);
																SAMPLER(samplerTexture2D_0a61719aa2ac4656a8ca661fb9b12425);
																TEXTURE2D(Texture2D_4c8109b3fd8b48968abc0c10fc765a06);
																SAMPLER(samplerTexture2D_4c8109b3fd8b48968abc0c10fc765a06);

																// Graph Functions

																void Unity_Remap_float2(float2 In, float2 InMinMax, float2 OutMinMax, out float2 Out)
																{
																	Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
																}

																void Unity_Add_float2(float2 A, float2 B, out float2 Out)
																{
																	Out = A + B;
																}

																void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
																{
																	Out = UV * Tiling + Offset;
																}

																void Unity_Multiply_float(float2 A, float2 B, out float2 Out)
																{
																	Out = A * B;
																}

																void Unity_Subtract_float2(float2 A, float2 B, out float2 Out)
																{
																	Out = A - B;
																}

																void Unity_Divide_float(float A, float B, out float Out)
																{
																	Out = A / B;
																}

																void Unity_Multiply_float(float A, float B, out float Out)
																{
																	Out = A * B;
																}

																void Unity_Divide_float2(float2 A, float2 B, out float2 Out)
																{
																	Out = A / B;
																}

																void Unity_Length_float2(float2 In, out float Out)
																{
																	Out = length(In);
																}

																void Unity_OneMinus_float(float In, out float Out)
																{
																	Out = 1 - In;
																}

																void Unity_Saturate_float(float In, out float Out)
																{
																	Out = saturate(In);
																}

																void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
																{
																	Out = smoothstep(Edge1, Edge2, In);
																}

																// Graph Vertex
																struct VertexDescription
																{
																	float3 Position;
																	float3 Normal;
																	float3 Tangent;
																};

																VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
																{
																	VertexDescription description = (VertexDescription)0;
																	description.Position = IN.ObjectSpacePosition;
																	description.Normal = IN.ObjectSpaceNormal;
																	description.Tangent = IN.ObjectSpaceTangent;
																	return description;
																}

																// Graph Pixel
																struct SurfaceDescription
																{
																	float Alpha;
																	float AlphaClipThreshold;
																};

																SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
																{
																	SurfaceDescription surface = (SurfaceDescription)0;
																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	float _Property_722d3873d582435abe485e38cc24b2cf_Out_0 = Vector1_983e66acc7c84eeebb58420303a45a77;
																	#endif
																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	float4 _ScreenPosition_9c48f7ea34234579bf12cce42a81188e_Out_0 = float4(IN.ScreenPosition.xy / IN.ScreenPosition.w, 0, 0);
																	#endif
																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	float2 _Property_a03e88fcc10e499f99eed342d5292a88_Out_0 = _PositionP;
																	#endif
																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	float2 _Remap_7e074b94ef264fc0b318441c100bd2cc_Out_3;
																	Unity_Remap_float2(_Property_a03e88fcc10e499f99eed342d5292a88_Out_0, float2 (0, 1), float2 (0.5, -1.5), _Remap_7e074b94ef264fc0b318441c100bd2cc_Out_3);
																	#endif
																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	float2 _Add_ccdd586c0b244e02a60e05afc82418f2_Out_2;
																	Unity_Add_float2((_ScreenPosition_9c48f7ea34234579bf12cce42a81188e_Out_0.xy), _Remap_7e074b94ef264fc0b318441c100bd2cc_Out_3, _Add_ccdd586c0b244e02a60e05afc82418f2_Out_2);
																	#endif
																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	float2 _TilingAndOffset_79894f2c83a447a89faf78ac8fe86d57_Out_3;
																	Unity_TilingAndOffset_float((_ScreenPosition_9c48f7ea34234579bf12cce42a81188e_Out_0.xy), float2 (1, 1), _Add_ccdd586c0b244e02a60e05afc82418f2_Out_2, _TilingAndOffset_79894f2c83a447a89faf78ac8fe86d57_Out_3);
																	#endif
																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	float2 _Multiply_9d847ff9ce1248a3a2774e001b139e74_Out_2;
																	Unity_Multiply_float(_TilingAndOffset_79894f2c83a447a89faf78ac8fe86d57_Out_3, float2(2, 2), _Multiply_9d847ff9ce1248a3a2774e001b139e74_Out_2);
																	#endif
																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	float2 _Subtract_96816b4647194f5b8f6fc08717ae1455_Out_2;
																	Unity_Subtract_float2(_Multiply_9d847ff9ce1248a3a2774e001b139e74_Out_2, float2(1, 1), _Subtract_96816b4647194f5b8f6fc08717ae1455_Out_2);
																	#endif
																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	float _Divide_4a30a1a0cd9a4110a0c3d5f73d4b00c5_Out_2;
																	Unity_Divide_float(unity_OrthoParams.y, unity_OrthoParams.x, _Divide_4a30a1a0cd9a4110a0c3d5f73d4b00c5_Out_2);
																	#endif
																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	float _Property_f112483e6e1e4931b7335acf88585f4b_Out_0 = _SizeS;
																	#endif
																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	float _Multiply_1c6959130546437abc098a59891edfde_Out_2;
																	Unity_Multiply_float(_Divide_4a30a1a0cd9a4110a0c3d5f73d4b00c5_Out_2, _Property_f112483e6e1e4931b7335acf88585f4b_Out_0, _Multiply_1c6959130546437abc098a59891edfde_Out_2);
																	#endif
																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	float2 _Vector2_2ec4e4d241064c3dbf9dda843c3126a5_Out_0 = float2(_Multiply_1c6959130546437abc098a59891edfde_Out_2, _Property_f112483e6e1e4931b7335acf88585f4b_Out_0);
																	#endif
																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	float2 _Divide_608ad307f8c44b8f82fdbd485fc435bd_Out_2;
																	Unity_Divide_float2(_Subtract_96816b4647194f5b8f6fc08717ae1455_Out_2, _Vector2_2ec4e4d241064c3dbf9dda843c3126a5_Out_0, _Divide_608ad307f8c44b8f82fdbd485fc435bd_Out_2);
																	#endif
																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	float _Length_2671319deb0846c586d0862346f04fc7_Out_1;
																	Unity_Length_float2(_Divide_608ad307f8c44b8f82fdbd485fc435bd_Out_2, _Length_2671319deb0846c586d0862346f04fc7_Out_1);
																	#endif
																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	float _OneMinus_a317c382855b4dfcb1a7ab6f5ff767dc_Out_1;
																	Unity_OneMinus_float(_Length_2671319deb0846c586d0862346f04fc7_Out_1, _OneMinus_a317c382855b4dfcb1a7ab6f5ff767dc_Out_1);
																	#endif
																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	float _Saturate_933b41d482394ae4a32b9f149f129f64_Out_1;
																	Unity_Saturate_float(_OneMinus_a317c382855b4dfcb1a7ab6f5ff767dc_Out_1, _Saturate_933b41d482394ae4a32b9f149f129f64_Out_1);
																	#endif
																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	float _Smoothstep_46f4a8caf1ac42f0ad005385aed8deb4_Out_3;
																	Unity_Smoothstep_float(0, _Property_722d3873d582435abe485e38cc24b2cf_Out_0, _Saturate_933b41d482394ae4a32b9f149f129f64_Out_1, _Smoothstep_46f4a8caf1ac42f0ad005385aed8deb4_Out_3);
																	#endif
																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	float _Property_6ab1ca603f15443da03497daee2ad631_Out_0 = Vector1_a65e3ce5f90b4c989b988ad54dfc8ca4;
																	#endif
																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	float _Multiply_0b1d234506be449aac12054383b99708_Out_2;
																	Unity_Multiply_float(_Smoothstep_46f4a8caf1ac42f0ad005385aed8deb4_Out_3, _Property_6ab1ca603f15443da03497daee2ad631_Out_0, _Multiply_0b1d234506be449aac12054383b99708_Out_2);
																	#endif
																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	float _OneMinus_d49a076f00f746ca9b7c2d7f79323475_Out_1;
																	Unity_OneMinus_float(_Multiply_0b1d234506be449aac12054383b99708_Out_2, _OneMinus_d49a076f00f746ca9b7c2d7f79323475_Out_1);
																	#endif
																	surface.Alpha = _OneMinus_d49a076f00f746ca9b7c2d7f79323475_Out_1;
																	surface.AlphaClipThreshold = 0.5;
																	return surface;
																}

																// --------------------------------------------------
																// Build Graph Inputs

																VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
																{
																	VertexDescriptionInputs output;
																	ZERO_INITIALIZE(VertexDescriptionInputs, output);

																#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																output.ObjectSpaceNormal = input.normalOS;
																#endif

																#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																output.ObjectSpaceTangent = input.tangentOS;
																#endif

																#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																output.ObjectSpacePosition = input.positionOS;
																#endif


																	return output;
																}

																SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
																{
																	SurfaceDescriptionInputs output;
																	ZERO_INITIALIZE(SurfaceDescriptionInputs, output);





																#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																output.WorldSpacePosition = input.positionWS;
																#endif

																#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																output.ScreenPosition = ComputeScreenPos(TransformWorldToHClip(input.positionWS), _ProjectionParams.x);
																#endif

																#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
																#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
																#else
																#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
																#endif
																#undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN

																	return output;
																}


																// --------------------------------------------------
																// Main

																#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
																#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
																#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShadowCasterPass.hlsl"

																ENDHLSL
															}
															Pass
															{
																Name "DepthOnly"
																Tags
																{
																	"LightMode" = "DepthOnly"
																}

																	// Render State
																	Cull Back
																	Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
																	ZTest LEqual
																	ZWrite On
																	ColorMask 0

																	// Debug
																	// <None>

																	// --------------------------------------------------
																	// Pass

																	HLSLPROGRAM

																	// Pragmas
																	#pragma target 4.5
																	#pragma exclude_renderers gles gles3 glcore
																	#pragma multi_compile_instancing
																	#pragma multi_compile _ DOTS_INSTANCING_ON
																	#pragma vertex vert
																	#pragma fragment frag

																	// DotsInstancingOptions: <None>
																	// HybridV1InjectedBuiltinProperties: <None>

																	// Keywords
																	// PassKeywords: <None>
																	#pragma multi_compile_local _ MAIN_LIGHT_CALCULATE_SHADOWS
																	#pragma multi_compile_local _ _MAIN_LIGHT_SHADOWS_CASCADE
																	#pragma multi_compile_local _ _SHADOWS_SOFT
																	#pragma multi_compile_local _ ADDITIONAL_LIGHT_CALCULATE_SHADOWS

																	#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
																		#define KEYWORD_PERMUTATION_0
																	#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT)
																		#define KEYWORD_PERMUTATION_1
																	#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
																		#define KEYWORD_PERMUTATION_2
																	#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_MAIN_LIGHT_SHADOWS_CASCADE)
																		#define KEYWORD_PERMUTATION_3
																	#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
																		#define KEYWORD_PERMUTATION_4
																	#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(_SHADOWS_SOFT)
																		#define KEYWORD_PERMUTATION_5
																	#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
																		#define KEYWORD_PERMUTATION_6
																	#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
																		#define KEYWORD_PERMUTATION_7
																	#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
																		#define KEYWORD_PERMUTATION_8
																	#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(_SHADOWS_SOFT)
																		#define KEYWORD_PERMUTATION_9
																	#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
																		#define KEYWORD_PERMUTATION_10
																	#elif defined(_MAIN_LIGHT_SHADOWS_CASCADE)
																		#define KEYWORD_PERMUTATION_11
																	#elif defined(_SHADOWS_SOFT) && defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
																		#define KEYWORD_PERMUTATION_12
																	#elif defined(_SHADOWS_SOFT)
																		#define KEYWORD_PERMUTATION_13
																	#elif defined(ADDITIONAL_LIGHT_CALCULATE_SHADOWS)
																		#define KEYWORD_PERMUTATION_14
																	#else
																		#define KEYWORD_PERMUTATION_15
																	#endif


																	// Defines
																#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																#define _SURFACE_TYPE_TRANSPARENT 1
																#endif

																#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																#define _AlphaClip 1
																#endif

																#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																#define ATTRIBUTES_NEED_NORMAL
																#endif

																#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																#define ATTRIBUTES_NEED_TANGENT
																#endif

																#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																#define VARYINGS_NEED_POSITION_WS
																#endif

																	#define FEATURES_GRAPH_VERTEX
																	/* WARNING: $splice Could not find named fragment 'PassInstancing' */
																	#define SHADERPASS SHADERPASS_DEPTHONLY
																	/* WARNING: $splice Could not find named fragment 'DotsInstancingVars' */

																	// Includes
																	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
																	#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
																	#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
																	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
																	#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

																	// --------------------------------------------------
																	// Structs and Packing

																	struct Attributes
																	{
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		float3 positionOS : POSITION;
																		#endif
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		float3 normalOS : NORMAL;
																		#endif
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		float4 tangentOS : TANGENT;
																		#endif
																		#if UNITY_ANY_INSTANCING_ENABLED
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		uint instanceID : INSTANCEID_SEMANTIC;
																		#endif
																		#endif
																	};
																	struct Varyings
																	{
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		float4 positionCS : SV_POSITION;
																		#endif
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		float3 positionWS;
																		#endif
																		#if UNITY_ANY_INSTANCING_ENABLED
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		uint instanceID : CUSTOM_INSTANCE_ID;
																		#endif
																		#endif
																		#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
																		#endif
																		#endif
																		#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
																		#endif
																		#endif
																		#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
																		#endif
																		#endif
																	};
																	struct SurfaceDescriptionInputs
																	{
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		float3 WorldSpacePosition;
																		#endif
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		float4 ScreenPosition;
																		#endif
																	};
																	struct VertexDescriptionInputs
																	{
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		float3 ObjectSpaceNormal;
																		#endif
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		float3 ObjectSpaceTangent;
																		#endif
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		float3 ObjectSpacePosition;
																		#endif
																	};
																	struct PackedVaryings
																	{
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		float4 positionCS : SV_POSITION;
																		#endif
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		float3 interp0 : TEXCOORD0;
																		#endif
																		#if UNITY_ANY_INSTANCING_ENABLED
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		uint instanceID : CUSTOM_INSTANCE_ID;
																		#endif
																		#endif
																		#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
																		#endif
																		#endif
																		#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
																		#endif
																		#endif
																		#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
																		#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																		FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
																		#endif
																		#endif
																	};

																	#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																	PackedVaryings PackVaryings(Varyings input)
																		{
																			PackedVaryings output;
																			output.positionCS = input.positionCS;
																			output.interp0.xyz = input.positionWS;
																			#if UNITY_ANY_INSTANCING_ENABLED
																			output.instanceID = input.instanceID;
																			#endif
																			#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
																			output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
																			#endif
																			#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
																			output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
																			#endif
																			#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
																			output.cullFace = input.cullFace;
																			#endif
																			return output;
																		}
																		Varyings UnpackVaryings(PackedVaryings input)
																		{
																			Varyings output;
																			output.positionCS = input.positionCS;
																			output.positionWS = input.interp0.xyz;
																			#if UNITY_ANY_INSTANCING_ENABLED
																			output.instanceID = input.instanceID;
																			#endif
																			#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
																			output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
																			#endif
																			#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
																			output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
																			#endif
																			#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
																			output.cullFace = input.cullFace;
																			#endif
																			return output;
																		}
																	#endif

																		// --------------------------------------------------
																		// Graph

																		// Graph Properties
																		CBUFFER_START(UnityPerMaterial)
																		float4 Texture2D_0a61719aa2ac4656a8ca661fb9b12425_TexelSize;
																		float4 Texture2D_4c8109b3fd8b48968abc0c10fc765a06_TexelSize;
																		float Vector1_8aa5e25adec34bdabf733d9a643aaf71;
																		float Vector1_73ff9ffb74dd4d0687b6353354f5147f;
																		float Vector1_366094730b0e4d7cb16f896c6e8f21f0;
																		float2 _PositionP;
																		float _SizeS;
																		float Vector1_983e66acc7c84eeebb58420303a45a77;
																		float Vector1_a65e3ce5f90b4c989b988ad54dfc8ca4;
																		CBUFFER_END

																			// Object and Global properties
																			TEXTURE2D(Texture2D_0a61719aa2ac4656a8ca661fb9b12425);
																			SAMPLER(samplerTexture2D_0a61719aa2ac4656a8ca661fb9b12425);
																			TEXTURE2D(Texture2D_4c8109b3fd8b48968abc0c10fc765a06);
																			SAMPLER(samplerTexture2D_4c8109b3fd8b48968abc0c10fc765a06);

																			// Graph Functions

																			void Unity_Remap_float2(float2 In, float2 InMinMax, float2 OutMinMax, out float2 Out)
																			{
																				Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
																			}

																			void Unity_Add_float2(float2 A, float2 B, out float2 Out)
																			{
																				Out = A + B;
																			}

																			void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
																			{
																				Out = UV * Tiling + Offset;
																			}

																			void Unity_Multiply_float(float2 A, float2 B, out float2 Out)
																			{
																				Out = A * B;
																			}

																			void Unity_Subtract_float2(float2 A, float2 B, out float2 Out)
																			{
																				Out = A - B;
																			}

																			void Unity_Divide_float(float A, float B, out float Out)
																			{
																				Out = A / B;
																			}

																			void Unity_Multiply_float(float A, float B, out float Out)
																			{
																				Out = A * B;
																			}

																			void Unity_Divide_float2(float2 A, float2 B, out float2 Out)
																			{
																				Out = A / B;
																			}

																			void Unity_Length_float2(float2 In, out float Out)
																			{
																				Out = length(In);
																			}

																			void Unity_OneMinus_float(float In, out float Out)
																			{
																				Out = 1 - In;
																			}

																			void Unity_Saturate_float(float In, out float Out)
																			{
																				Out = saturate(In);
																			}

																			void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
																			{
																				Out = smoothstep(Edge1, Edge2, In);
																			}

																			// Graph Vertex
																			struct VertexDescription
																			{
																				float3 Position;
																				float3 Normal;
																				float3 Tangent;
																			};

																			VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
																			{
																				VertexDescription description = (VertexDescription)0;
																				description.Position = IN.ObjectSpacePosition;
																				description.Normal = IN.ObjectSpaceNormal;
																				description.Tangent = IN.ObjectSpaceTangent;
																				return description;
																			}

																			// Graph Pixel
																			struct SurfaceDescription
																			{
																				float Alpha;
																				float AlphaClipThreshold;
																			};

																			SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
																			{
																				SurfaceDescription surface = (SurfaceDescription)0;
																				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																				float _Property_722d3873d582435abe485e38cc24b2cf_Out_0 = Vector1_983e66acc7c84eeebb58420303a45a77;
																				#endif
																				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																				float4 _ScreenPosition_9c48f7ea34234579bf12cce42a81188e_Out_0 = float4(IN.ScreenPosition.xy / IN.ScreenPosition.w, 0, 0);
																				#endif
																				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																				float2 _Property_a03e88fcc10e499f99eed342d5292a88_Out_0 = _PositionP;
																				#endif
																				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																				float2 _Remap_7e074b94ef264fc0b318441c100bd2cc_Out_3;
																				Unity_Remap_float2(_Property_a03e88fcc10e499f99eed342d5292a88_Out_0, float2 (0, 1), float2 (0.5, -1.5), _Remap_7e074b94ef264fc0b318441c100bd2cc_Out_3);
																				#endif
																				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																				float2 _Add_ccdd586c0b244e02a60e05afc82418f2_Out_2;
																				Unity_Add_float2((_ScreenPosition_9c48f7ea34234579bf12cce42a81188e_Out_0.xy), _Remap_7e074b94ef264fc0b318441c100bd2cc_Out_3, _Add_ccdd586c0b244e02a60e05afc82418f2_Out_2);
																				#endif
																				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																				float2 _TilingAndOffset_79894f2c83a447a89faf78ac8fe86d57_Out_3;
																				Unity_TilingAndOffset_float((_ScreenPosition_9c48f7ea34234579bf12cce42a81188e_Out_0.xy), float2 (1, 1), _Add_ccdd586c0b244e02a60e05afc82418f2_Out_2, _TilingAndOffset_79894f2c83a447a89faf78ac8fe86d57_Out_3);
																				#endif
																				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																				float2 _Multiply_9d847ff9ce1248a3a2774e001b139e74_Out_2;
																				Unity_Multiply_float(_TilingAndOffset_79894f2c83a447a89faf78ac8fe86d57_Out_3, float2(2, 2), _Multiply_9d847ff9ce1248a3a2774e001b139e74_Out_2);
																				#endif
																				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																				float2 _Subtract_96816b4647194f5b8f6fc08717ae1455_Out_2;
																				Unity_Subtract_float2(_Multiply_9d847ff9ce1248a3a2774e001b139e74_Out_2, float2(1, 1), _Subtract_96816b4647194f5b8f6fc08717ae1455_Out_2);
																				#endif
																				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																				float _Divide_4a30a1a0cd9a4110a0c3d5f73d4b00c5_Out_2;
																				Unity_Divide_float(unity_OrthoParams.y, unity_OrthoParams.x, _Divide_4a30a1a0cd9a4110a0c3d5f73d4b00c5_Out_2);
																				#endif
																				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																				float _Property_f112483e6e1e4931b7335acf88585f4b_Out_0 = _SizeS;
																				#endif
																				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																				float _Multiply_1c6959130546437abc098a59891edfde_Out_2;
																				Unity_Multiply_float(_Divide_4a30a1a0cd9a4110a0c3d5f73d4b00c5_Out_2, _Property_f112483e6e1e4931b7335acf88585f4b_Out_0, _Multiply_1c6959130546437abc098a59891edfde_Out_2);
																				#endif
																				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																				float2 _Vector2_2ec4e4d241064c3dbf9dda843c3126a5_Out_0 = float2(_Multiply_1c6959130546437abc098a59891edfde_Out_2, _Property_f112483e6e1e4931b7335acf88585f4b_Out_0);
																				#endif
																				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																				float2 _Divide_608ad307f8c44b8f82fdbd485fc435bd_Out_2;
																				Unity_Divide_float2(_Subtract_96816b4647194f5b8f6fc08717ae1455_Out_2, _Vector2_2ec4e4d241064c3dbf9dda843c3126a5_Out_0, _Divide_608ad307f8c44b8f82fdbd485fc435bd_Out_2);
																				#endif
																				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																				float _Length_2671319deb0846c586d0862346f04fc7_Out_1;
																				Unity_Length_float2(_Divide_608ad307f8c44b8f82fdbd485fc435bd_Out_2, _Length_2671319deb0846c586d0862346f04fc7_Out_1);
																				#endif
																				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																				float _OneMinus_a317c382855b4dfcb1a7ab6f5ff767dc_Out_1;
																				Unity_OneMinus_float(_Length_2671319deb0846c586d0862346f04fc7_Out_1, _OneMinus_a317c382855b4dfcb1a7ab6f5ff767dc_Out_1);
																				#endif
																				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																				float _Saturate_933b41d482394ae4a32b9f149f129f64_Out_1;
																				Unity_Saturate_float(_OneMinus_a317c382855b4dfcb1a7ab6f5ff767dc_Out_1, _Saturate_933b41d482394ae4a32b9f149f129f64_Out_1);
																				#endif
																				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																				float _Smoothstep_46f4a8caf1ac42f0ad005385aed8deb4_Out_3;
																				Unity_Smoothstep_float(0, _Property_722d3873d582435abe485e38cc24b2cf_Out_0, _Saturate_933b41d482394ae4a32b9f149f129f64_Out_1, _Smoothstep_46f4a8caf1ac42f0ad005385aed8deb4_Out_3);
																				#endif
																				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																				float _Property_6ab1ca603f15443da03497daee2ad631_Out_0 = Vector1_a65e3ce5f90b4c989b988ad54dfc8ca4;
																				#endif
																				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																				float _Multiply_0b1d234506be449aac12054383b99708_Out_2;
																				Unity_Multiply_float(_Smoothstep_46f4a8caf1ac42f0ad005385aed8deb4_Out_3, _Property_6ab1ca603f15443da03497daee2ad631_Out_0, _Multiply_0b1d234506be449aac12054383b99708_Out_2);
																				#endif
																				#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																				float _OneMinus_d49a076f00f746ca9b7c2d7f79323475_Out_1;
																				Unity_OneMinus_float(_Multiply_0b1d234506be449aac12054383b99708_Out_2, _OneMinus_d49a076f00f746ca9b7c2d7f79323475_Out_1);
																				#endif
																				surface.Alpha = _OneMinus_d49a076f00f746ca9b7c2d7f79323475_Out_1;
																				surface.AlphaClipThreshold = 0.5;
																				return surface;
																			}

																			// --------------------------------------------------
																			// Build Graph Inputs

																			VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
																			{
																				VertexDescriptionInputs output;
																				ZERO_INITIALIZE(VertexDescriptionInputs, output);

																			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																			output.ObjectSpaceNormal = input.normalOS;
																			#endif

																			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																			output.ObjectSpaceTangent = input.tangentOS;
																			#endif

																			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																			output.ObjectSpacePosition = input.positionOS;
																			#endif


																				return output;
																			}

																			SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
																			{
																				SurfaceDescriptionInputs output;
																				ZERO_INITIALIZE(SurfaceDescriptionInputs, output);





																			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																			output.WorldSpacePosition = input.positionWS;
																			#endif

																			#if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1) || defined(KEYWORD_PERMUTATION_2) || defined(KEYWORD_PERMUTATION_3) || defined(KEYWORD_PERMUTATION_4) || defined(KEYWORD_PERMUTATION_5) || defined(KEYWORD_PERMUTATION_6) || defined(KEYWORD_PERMUTATION_7) || defined(KEYWORD_PERMUTATION_8) || defined(KEYWORD_PERMUTATION_9) || defined(KEYWORD_PERMUTATION_10) || defined(KEYWORD_PERMUTATION_11) || defined(KEYWORD_PERMUTATION_12) || defined(KEYWORD_PERMUTATION_13) || defined(KEYWORD_PERMUTATION_14) || defined(KEYWORD_PERMUTATION_15)
																			output.ScreenPosition = ComputeScreenPos(TransformWorldToHClip(input.positionWS), _ProjectionParams.x);
																			#endif

																			#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
																			#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
																			#else
																			#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
																			#endif
																			#undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN

																				return output;
																			}


																			// --------------------------------------------------
																			// Main

																			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
																			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
																			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthOnlyPass.hlsl"

																			ENDHLSL
																		}
										}
											FallBack "Hidden/Shader Graph/FallbackError"
}