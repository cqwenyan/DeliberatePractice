Shader "WhaleYan/2Dwater" {
	Properties{
		[PerRendererData]_MainTex("MainTex", 2D) = "white" {}
		_noisePower("noisePower", Range(0, 0.2)) = 0
		_waterSpeed("waterSpeed", Range(-5, 5)) = 0
		_noiseSpeed("noiseSpeed", Range(-5, 5)) = 0
		_waterTopNoise("waterTopNoise", Float) = 0
		_waterTopHigh("waterTopHigh", Float) = 5
		_watertopspeed("watertopspeed", Float) = 0
		_NOISE("NOISE", 2D) = "white" {}
		[HideInInspector]_Cutoff("Alpha cutoff", Range(0,1)) = 0.5
			//[MaterialToggle] PixelSnap("Pixel snap", Float) = 0
			_Stencil("Stencil ID", Float) = 0
			_StencilReadMask("Stencil Read Mask", Float) = 255
			_StencilWriteMask("Stencil Write Mask", Float) = 255
			_StencilComp("Stencil Comparison", Float) = 8
			_StencilOp("Stencil Operation", Float) = 0
			_StencilOpFail("Stencil Fail Operation", Float) = 0
			_StencilOpZFail("Stencil Z-Fail Operation", Float) = 0
	}
		SubShader{
			Tags {
				"IgnoreProjector" = "True"
				"Queue" = "Transparent"
				"RenderType" = "Transparent"
				"CanUseSpriteAtlas" = "True"
				"PreviewType" = "Plane"
			}
			Pass {
				Name "FORWARD"
				Tags {
					"LightMode" = "ForwardBase"
				}
				Blend SrcAlpha OneMinusSrcAlpha
				Cull Off
				ZWrite Off

				Stencil {
					Ref[_Stencil]
					ReadMask[_StencilReadMask]
					WriteMask[_StencilWriteMask]
					Comp[_StencilComp]
					Pass[_StencilOp]
					Fail[_StencilOpFail]
					ZFail[_StencilOpZFail]
				}
				CGPROGRAM
				#pragma vertex vert
				#pragma fragment frag
				#define UNITY_PASS_FORWARDBASE
				#pragma multi_compile
				#include "UnityCG.cginc"
				#pragma multi_compile_fwdbase
				#pragma target 3.0
				uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
				uniform float _noisePower;
				uniform float _waterSpeed;
				uniform float _noiseSpeed;
				uniform float _waterTopNoise;
				uniform float _waterTopHigh;
				uniform float _watertopspeed;
				uniform sampler2D _NOISE; uniform float4 _NOISE_ST;
				struct VertexInput {
					float4 vertex : POSITION;
					float2 texcoord0 : TEXCOORD0;
					float4 vertexColor : COLOR;
				};
				struct VertexOutput {
					float4 pos : SV_POSITION;
					float2 uv0 : TEXCOORD0;
					float2 posWorld : TEXCOORD1;
					float2 TopUv : TEXCOORD2;
					float4 vertexColor : COLOR;
				};

				VertexOutput vert(VertexInput v) {
					VertexOutput o = (VertexOutput)0;
					o.uv0 = v.texcoord0;
					o.vertexColor = v.vertexColor;
					float4 objPos = mul(unity_ObjectToWorld, float4(0,0,0,1));
					float objY = objPos.g;
					o.pos = UnityObjectToClipPos(v.vertex);

					o.posWorld = mul(unity_ObjectToWorld, v.vertex).rg;
					o.TopUv = (o.posWorld + (_watertopspeed* _Time.r)) * _waterTopNoise;
					o.posWorld.g = objY - o.posWorld.g;
					return o;
				}

				float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
					float stime = _Time.r;
					fixed2 NoiseUV = i.uv0 + stime*_noiseSpeed;
					fixed4 TexUVnoise = tex2D(_NOISE,TRANSFORM_TEX(NoiseUV, _NOISE));
					fixed2 TexUV = (i.uv0 + (1.0 - TexUVnoise.r * 2)*_noisePower);
					TexUV.r += stime*_waterSpeed;
					fixed4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(TexUV, _MainTex));

					fixed4 Topnoise = tex2D(_NOISE,TRANSFORM_TEX(i.TopUv, _NOISE));
					fixed TopAlpha =  saturate(_waterTopHigh * i.posWorld.g - Topnoise.r);
					fixed3 emissive = lerp(_MainTex_var.rgb* (_MainTex_var.a * i.vertexColor.a * TopAlpha), 1.7, 1.0 - TopAlpha);

					return fixed4(emissive,(TopAlpha*i.vertexColor.a));

				}
				ENDCG
			}
		}
			FallBack "Diffuse"
}
