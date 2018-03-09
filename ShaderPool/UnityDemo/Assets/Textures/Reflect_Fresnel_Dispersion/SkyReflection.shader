Shader "WhaleYan/SkyReflection"
{
	//天空盒反射
	Properties
	{
		[KeywordEnum(Low, High)] _Quality("Quality(逐顶点/逐像素)", Float) = 0
	}
	SubShader
	{
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile _Quality_LOW _Quality_HIGHT

			#include "UnityCG.cginc"

			struct v2f
			{
				float3 normal:NORMAL;
				float4 pos : SV_POSITION;
				float4 objectPOS:float;
#if _Quality_LOW
				float3 worldRefl : TEXCOORD0;
#endif
			};

			v2f vert(float4 vertex : POSITION, float3 normal : NORMAL)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(vertex);
				o.normal = normal;
				o.objectPOS = vertex;
#if _Quality_LOW
				float3 worldNormal = UnityObjectToWorldNormal(normal);
				float3 worldPos = mul(unity_ObjectToWorld, vertex).xyz;
				//worldViewDir为由反射点射向camera的一条向量。
				float3 worldViewDir = UnityWorldSpaceViewDir(worldPos);
				//所以在reflect函数中要使用-worldViewDir，将方向颠倒过来。
				o.worldRefl = reflect(-worldViewDir, worldNormal);
#endif
				return o;
			}

			fixed4 frag(v2f i) : SV_Target
			{
				float3 worldRefl;
#if _Quality_HIGHT
				float3 worldNormal = UnityObjectToWorldNormal(i.normal);
				float3 worldPos = mul(unity_ObjectToWorld, i.objectPOS).xyz;
				float3 worldViewDir = UnityWorldSpaceViewDir(worldPos);
				worldRefl = reflect(-worldViewDir, worldNormal);
#elif _Quality_LOW
				worldRefl = i.worldRefl;
#endif
				// 使用反射向量对默认的反射cubemap进行立方体采样，既是根据上图中的r寻找立方盒上的点R。
				// unity_SpecCube0 : 天空盒贴图
				half4 skyData = UNITY_SAMPLE_TEXCUBE(unity_SpecCube0, worldRefl);
				// 解码cubemap数据成实际的颜色
				half3 skyColor = DecodeHDR(skyData, unity_SpecCube0_HDR);
				fixed4 c = 0;
				c.rgb = skyColor;
				return c;
			}
			ENDCG
		}
	}
}