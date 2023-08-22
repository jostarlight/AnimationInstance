// Upgrade NOTE: replaced '_Projector' with 'unity_Projector'
// Upgrade NOTE: replaced '_ProjectorClip' with 'unity_ProjectorClip'

Shader "Unlit/NewUnlitShader"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _CloudTex("Texture", 2D) = "white" {}
        _AlphaScale ("Alpha Scale", Range(0, 1)) = 1
        _Tiling ("Tiling", Int) = 10
        _HorizontalAmount ("Horizontal Amount", Range(-1, 1)) = 1
    	_VerticalAmount ("Vertical Amount", Range(-1, 1)) = 1
    	_Speed ("Speed", Range(0, 1)) = 1
    }
    SubShader
    {
        Tags { "RenderType"="Transparent"  "Queue" = "Transparent"}
        LOD 100

        Pass
        {
            ZWrite Off
            Blend SrcAlpha OneMinusSrcAlpha

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            sampler2D _CloudTex;
            fixed _AlphaScale;
            int _Tiling;

            float _HorizontalAmount;
			float _VerticalAmount;
			float _Speed;

            
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                //o.uv = TRANSFORM_TEX(v.uv + _Time.x * _Speed * float2(_HorizontalAmount, _VerticalAmount), _MainTex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
                fixed2 uv = fixed2(((i.uv.x + _Time.x * _Speed * _HorizontalAmount) * _Tiling), ((i.uv.y +  + _Time.x * _Speed * _VerticalAmount) * _Tiling));
                fixed4 texColor = tex2D(_MainTex, uv);

                float a = tex2D(_CloudTex, i.uv).a;
                fixed4 result = texColor * a;
                fixed3 result_rgb = result.rgb;
                float result_a = result.a * _AlphaScale;
                return fixed4(result_rgb * 0.002, min(result_a, 0.98));

                //ºÚÎíÐ§¹û
                //return fixed4(0, 0,0, 1 * tex2D(_CloudTex, i.uv).a);
            }
         
            ENDCG
        }
    }
}
