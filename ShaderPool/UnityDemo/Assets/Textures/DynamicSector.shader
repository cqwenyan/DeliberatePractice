Shader "WhaleYan/Dynamic Sector of Skill" {// 使用shader画扇面
	Properties{
		_MainTex("Main Texture", 2D) = "white" {}
		_Color("Color", Color) = (0.17,0.36,0.81,0.0)
		_Angle("Angle", Range(0, 360)) = 60
		_Gradient("Gradient", Range(0, 1)) = 0
	}

	SubShader{
		Tags{ "Queue" = "Transparent" "RenderType" = "Transparent" "IgnoreProjector" = "True" }
		Pass{
			ZWrite Off
			Blend SrcAlpha OneMinusSrcAlpha
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

			sampler2D _MainTex;
			fixed4 _Color;
			float _Angle;
			float _Gradient;

			struct v2f {
				float4 pos : SV_POSITION;
				float2 uv : TEXTCOORD0;
			};

			v2f vert(appdata_base v)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				o.uv = v.texcoord.xy;
				return o;
			}

			fixed4 frag(v2f i) : SV_Target
			{
				fixed4 texCol = tex2D(_MainTex, i.uv);
				// 离中心点的距离
				float distance = sqrt(pow(i.uv.x - 0.5, 2) + pow(i.uv.y - 0.5, 2));
				// 在圆外
				texCol.a = step(distance, 0.5);
				float deg2rad = 0.017453;   // 角度转弧度
				float x = i.uv.x;
				float y = i.uv.y;
				texCol.a *= lerp(sign(step(y, 0.5) + step(abs(0.5 - y), abs(0.5 - x) / tan((180 - _Angle / 2) * deg2rad))), (step(y, 0.5) * (step(abs(0.5 - x) / tan(_Angle / 2 * deg2rad), abs(0.5 - y)))), step(_Angle, 180));
				float grediant = (1 - distance - 0.5 * _Gradient) / 0.5;
				fixed4 result = texCol * _Color * fixed4(1,1,1, grediant);
				return result;
			}
			ENDCG
		}
	}
	FallBack "Diffuse"
}
