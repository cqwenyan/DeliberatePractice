Shader "WhaleYan/MRT" {
	Properties{
		_MainTex("Base (RGB)", 2D) = "white" {}
	}
		SubShader{
		Tags{ "RenderType" = "Transparent" "Queue" = "Transparent" }

		Pass{
		ZTest Always
		Cull Off
		ZWrite Off

		CGPROGRAM

		#pragma glsl
		#pragma fragmentoption ARB_precision_hint_fastest
		#pragma target 3.0
		#pragma vertex vert
		#pragma fragment frag
		#include "unityCG.cginc"

		sampler2D _CameraDepthTexture;
		uniform sampler2D _MainTex;
		uniform sampler2D _Tex;

	struct v2f {
		float4 pos : SV_POSITION;
		float4 scrPos:TEXCOORD0;
		float2 uv : TEXCOORD1;
	};
	struct fout {
		float4 col0 : COLOR0;
		float4 col1 : COLOR1;
	};

	v2f vert(appdata_base v) {
		v2f o;
		o.pos = UnityObjectToClipPos(v.vertex);
		o.scrPos = ComputeScreenPos(o.pos);
		o.uv = v.texcoord.xy;
		return o;
	}

	fout frag(v2f i)
	{
		fout o;
		o.col0 = tex2D(_Tex, i.uv);;
		o.col1 = float4(1.0f, 0.0f, 0.0f, 0.7f);
		return o;
	}
	ENDCG
	}
	}
		FallBack "Diffuse"
}
