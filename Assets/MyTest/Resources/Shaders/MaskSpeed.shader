Shader "GD3D/MaskSpeed"
{
    //面板参数
    Properties
    {
        _Color("Color",color)          =(1,1,1,1)

        _MainTex ("Texture", 2D)     = "white" {}
        _MainTexUspeed("U_Speed",float)  =0
        _MainTexVspeed("V_Speed",float)  =0

         _MaskTex ("MaskTexture", 2D)     = "white" {}
        //_MaskTexUspeed("M_U_Speed",float)  =0
        //_MaskTexVspeed("M_V_Speed",float)  =0
    }
    SubShader
    {
        Blend SrcAlpha one 
        Cull off
        Tags { "RenderType"="Opaque" "Queue"="Transparent"}
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

          uniform sampler2D _MainTex;     //贴图
          uniform sampler2D _MaskTex;     //遮罩贴图
          uniform float4 _MainTex_ST;
          uniform float4 _MaskTex_ST;
          
          uniform float4 _Color;          //颜色
          uniform float _MainTexUspeed;   //u速度
          uniform float _MainTexVspeed;   //v速度

          uniform float _MaskTexUspeed;   //遮罩u速度
          uniform float _MaskTexVspeed;   //遮罩v速度


            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
				fixed4 color: COLOR;
            };

            struct v2f
            {
                float4 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
				fixed4 color: COLOR;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv.xy  = TRANSFORM_TEX(v.uv, _MainTex)+float2(_MainTexUspeed,_MainTexVspeed)*_Time.y;
                o.uv.zw  = TRANSFORM_TEX(v.uv, _MaskTex)+float2(_MaskTexUspeed,_MaskTexVspeed)*_Time.y;
                o.color  = v.color;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 c    = tex2D(_MainTex, i.uv.xy)*_Color;
                fixed4 mask = tex2D(_MaskTex, i.uv.zw);
                 c *=mask*i.color;
                return c;
            }
            ENDCG
        }
    }
}
