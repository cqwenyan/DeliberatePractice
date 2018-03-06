Shader "Whale/CustomerMaterial"
{
	Properties
	{
		[PerRenderData] _MainTex ("Texture", 2D) = "white" {}
		[Header(The Header)] _Header("Header", Float) = 1
		[Space] _Space("Space", Float) = 1
		[Space(50)] _Space50("Space50", Float) = 1
		[Toggle] _Toggle("Toggle", Float) = 0
		[Toggle(Meet_The_Condition)] _Toggle_Meet_The_Condition("Condition Toggle", Float) = 0
		[PowerSlider(2.0)] _PowerSlider("Power Slider", Range(0, 1)) = 0.25 // 滑动条中滑动进度的平方 0.5*0.5
		[KeywordEnum(None, Half, Full)] _KeywordEnum("Overlay mode", Float) = 0

		[Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend("Src Blend Mode", Float) = 1
		[Enum(Zero, 0, One, 1, Two, 2)] _ZWriteEnum("Z Write", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)] _ZTestEnum("Z Test Enum", Float) = 0
		[Enum(UnityEngine.Rendering.CullMode)] _CullEnum("Cull Mode ", Float) = 1

	}

	SubShader
	{
		Tags { "Queue" = "Transparent" "RenderType"="Transparent" }
		Blend [_SrcBlend] OneMinusSrcAlpha
		ZWrite [_ZWriteEnum]
		ZTest [_ZTestEnum]
		Cull [_CullEnum]

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#pragma shader_feature Meet_The_Condition
			#pragma multi_compile _KeywordEnum_NONE _KeywordEnum_HALF _KeywordEnum_FULL

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
			float _Speed;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex) + frac(float2(1,0)*_Time.y * _Speed);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 col = tex2D(_MainTex, i.uv);
				# if Meet_The_Condition
				col.a = 0.2;
				# endif

				# if _KeywordEnum_NONE
				col.a *= 0;
				# elif _KeywordEnum_HALF
				col.a *= 0.5;
				# elif _KeywordEnum_FULL
				col.a *= 1;
				# endif

				return col;
			}
			ENDCG
		}
	}
}
