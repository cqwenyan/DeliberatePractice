Shader "WhaleYan/CrossLight"
{
	// 相交高亮
	Properties
	{
		_NoCrossColor("No Cross Color", Color) = (0,0,0,0)
		_CrossColor("Cross Color", Color) = (0,0,0,0)
		_Threshold("Threshold", Float) = 2
	}

	SubShader
	{
		ZWrite Off
		Cull Off
		Blend SrcAlpha OneMinusSrcAlpha

		Tags
		{
				"RenderType" = "Transparent"
				"Queue" = "Transparent"
		}

		Pass
		{
			CGPROGRAM
			#pragma target 3.0
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			struct v2f
			{
				float4 pos : SV_POSITION;
				float4 transparentAndOpaquePos : TEXCOORD0;
			};

			v2f vert(appdata_base v)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				// 参考文献：https://www.cnblogs.com/murongxiaopifu/p/7050233.html
				o.transparentAndOpaquePos = ComputeScreenPos(o.pos);
				COMPUTE_EYEDEPTH(o.transparentAndOpaquePos.z);
				return o;
			}

			fixed4 _NoCrossColor;
			fixed4 _CrossColor;
			float _Threshold;
			sampler2D _CameraDepthTexture;

			fixed4 frag(v2f i) : SV_TARGET
			{
				float4 col = _NoCrossColor;
				float opaqueNonLinearDepth = SAMPLE_DEPTH_TEXTURE_PROJ(_CameraDepthTexture, UNITY_PROJ_COORD(i.transparentAndOpaquePos));
				float opaqueLinearDepth = LinearEyeDepth(opaqueNonLinearDepth);
				// 深度图里面只要不透明物体的深度数据, 而COMPUTE_EYEDEPTH()可以得到场景中透明和不透明片的深度
				float crossDegree = min((abs(opaqueLinearDepth - i.transparentAndOpaquePos.z)) / _Threshold, 1);
				col = lerp(_CrossColor, _NoCrossColor, crossDegree);
				return col;
			}
			ENDCG
		}
	}
}
