Shader "WhaleYan/Radial Blur"
{
	Properties{
		_Color("Color Tint", Color) = (1, 1, 1, 1)
		_MainTex("Main Tex", 2D) = "white" {}
		[KeywordEnum(Line, Power2)] _BlurType("Blur Type", Float) = 0
	}
		SubShader{
			Tags { "RenderType" = "Opaque" "Queue" = "Geometry"}

			Pass{
				CGPROGRAM

				#pragma vertex vert
				#pragma fragment frag
				#include "UnityCG.cginc"

				float _BlurDegree;
				sampler2D _MainTex;
				float4 _MainTex_ST;

				struct v2f {
					float4 pos : SV_POSITION;
					float2 texcoord : TEXCOORD0;
				};

				v2f vert(appdata_base v)
				{
					v2f o;
					o.pos = UnityObjectToClipPos(v.vertex);
					o.texcoord = TRANSFORM_TEX(v.texcoord, _MainTex);
					return o;
				}

				fixed4 frag(v2f i) : COLOR
				{
					//计算距中心点方向  
					fixed2 dir = 0.5 - i.texcoord;
				//计算取样像素点到中心点距离  
				fixed dist = length(dir);
				dir /= dist;
				dir *= _BlurDegree;

				fixed4 sum = tex2D(_MainTex, i.texcoord - dir * 0.01);
				sum += tex2D(_MainTex, i.texcoord - dir * 0.02);
				sum += tex2D(_MainTex, i.texcoord - dir * 0.03);
				sum += tex2D(_MainTex, i.texcoord - dir * 0.05);
				sum += tex2D(_MainTex, i.texcoord - dir * 0.08);
				sum += tex2D(_MainTex, i.texcoord + dir * 0.01);
				sum += tex2D(_MainTex, i.texcoord + dir * 0.02);
				sum += tex2D(_MainTex, i.texcoord + dir * 0.03);
				sum += tex2D(_MainTex, i.texcoord + dir * 0.05);
				sum += tex2D(_MainTex, i.texcoord + dir * 0.08);
				sum *= 0.1;
				return sum;
			}
			ENDCG
		}


		Pass{
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile _BlurType_LINE _BlurType_Power2
			#include "UnityCG.cginc"

			float _BlurWidth;
			sampler2D _MainTex;
			float4 _MainTex_ST;
			sampler2D _BlurTex;

			struct v2f {
				float4 pos : SV_POSITION;
				float2 texcoord : TEXCOORD0;
			};

			v2f vert(appdata_base v)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				o.texcoord = TRANSFORM_TEX(v.texcoord, _MainTex);
				return o;
			}

			fixed4 frag(v2f i) : COLOR
			{
				fixed dist = length(0.5 - i.texcoord);
				fixed4 col = tex2D(_MainTex, i.texcoord);
				fixed4 blur = tex2D(_BlurTex, i.texcoord);

				#if _BlurType_LINE
				col = lerp(col, blur, saturate(_BlurWidth*dist));
				#elif _BlurType_POWER2
				col = lerp(col, blur, saturate(_BlurWidth*dist*dist));
				#endif
				return col;
			}
			ENDCG
		}
	}
	FallBack "Diffuse"
}
