Shader "WhaleYan/VariableSector"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_RelativeHeight("Relative Height", Float) = 1
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma enable_d3d11_debug_symbols

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
				float4 myVertex : TEXCOORD1;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;
			float _RelativeHeight;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.myVertex = v.vertex;
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 col;
				float x = (i.myVertex.x - 0.5) * 2;
				float y = (i.myVertex.y - 0.5) * 2;

				// 玩，此处不考虑优化
				if (y > 0)
				{
					if ((x*x + y * y) < 1) {
						if ((y / abs(x)) > _RelativeHeight) {
							col = tex2D(_MainTex, i.uv);
						}
					}
				}
				else {
					col = (0, 0, 0, 0);
				}
				return col;
			}
			ENDCG
		}
	}
}
