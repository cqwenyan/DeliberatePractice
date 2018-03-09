Shader "WhaleYan/SpecluarLight"
{
	Properties
	{
		_MainTex("Texture", 2D) = "white" {}
		_Color("COLOR", COLOR) = (1,1,1,1)
		_DiffuseColor("Diffuse Color", COLOR) = (1,1,1,1)
		_SpecluarColor("Specluar Color", COLOR) = (1,1,1,1)
		_Gloss("Gloss", Float) = 1
	}
		SubShader
		{
			Tags { "RenderType" = "Opaque" "Queue" = "Geometry"}
			LOD 100

			Pass
			{
				CGPROGRAM
				#pragma vertex vert
				#pragma fragment frag

				#include "UnityCG.cginc"
				#include "Lighting.cginc"

				struct v2f
				{
					float2 uv : TEXCOORD0;
					float4 vertex : SV_POSITION;
					float4 color : COLOR;
					float4 worldPos : TEXCOORD1;
					float3 worldNormal : NORMAL;
				};

				sampler2D _MainTex;
				float4 _MainTex_ST;
				fixed3 _Color;
				fixed4 _DiffuseColor;
				fixed4 _SpecluarColor;
				float _Gloss;

				v2f vert(appdata_base v)
				{
					v2f o;
					o.vertex = UnityObjectToClipPos(v.vertex);
					o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
					o.worldPos = mul(unity_ObjectToWorld, v.vertex);
					o.worldNormal = UnityObjectToWorldNormal(v.normal);
					return o;
				}

				fixed4 frag(v2f i) : SV_Target
				{
					fixed4 texCol = tex2D(_MainTex, i.uv);
					fixed3 albedo = texCol * _Color;
					fixed3 ambient = UNITY_LIGHTMODEL_AMBIENT.xyz * albedo;

					float3 worldNormal = normalize(i.worldNormal);
					float3 worldLightDir = norm alize(UnityWorldSpaceLightDir(i.worldPos));
					fixed3 diffuse = _LightColor0 * albedo * max(0, dot(worldLightDir, worldNormal));

					float3 worldViewDir = normalize(_WorldSpaceCameraPos.xyz - i.worldPos);
					float3 worldRefDir = normalize(reflect(-worldLightDir, worldNormal));
					float3 halfRefDir = normalize(worldRefDir + worldViewDir);
					fixed3 specluar = _LightColor0 * _SpecluarColor.rgb * pow(max(0, dot(halfRefDir, worldNormal)), _Gloss);

					return fixed4(ambient + diffuse + specluar, texCol.a);
				}
				ENDCG
			}
		}
}
