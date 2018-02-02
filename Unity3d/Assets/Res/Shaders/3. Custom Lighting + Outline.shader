// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.1280277,fgcg:0.1953466,fgcb:0.2352941,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:35,x:32719,y:32712,varname:node_35,prsc:2|normal-141-RGB,custl-9226-OUT,olwid-5852-OUT,olcol-1388-RGB;n:type:ShaderForge.SFN_Tex2d,id:141,x:32552,y:32612,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:node_141,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:cf20bfced7e912046a9ce991a4d775ec,ntxv:3,isnm:True;n:type:ShaderForge.SFN_ValueProperty,id:5852,x:32533,y:33133,ptovrint:False,ptlb:Outline,ptin:_Outline,varname:node_5852,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.1;n:type:ShaderForge.SFN_Color,id:1388,x:32533,y:33230,ptovrint:False,ptlb:Outline Color,ptin:_OutlineColor,varname:node_1388,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:9226,x:32487,y:32864,varname:node_9226,prsc:2|A-5926-OUT,B-1251-RGB,C-4672-OUT;n:type:ShaderForge.SFN_LightColor,id:1251,x:32233,y:32761,varname:node_1251,prsc:2;n:type:ShaderForge.SFN_LightAttenuation,id:5926,x:32243,y:32639,varname:node_5926,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:4005,x:31584,y:33208,prsc:2,pt:False;n:type:ShaderForge.SFN_Tex2d,id:8432,x:31747,y:32793,ptovrint:False,ptlb:node_8432,ptin:_node_8432,varname:node_8432,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:8993b617f08498f43adcbd90697f1c5d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_HalfVector,id:1998,x:31538,y:33075,varname:node_1998,prsc:2;n:type:ShaderForge.SFN_Dot,id:320,x:31764,y:33158,varname:node_320,prsc:2,dt:0|A-1998-OUT,B-4005-OUT;n:type:ShaderForge.SFN_Power,id:1631,x:31965,y:33212,varname:node_1631,prsc:2|VAL-320-OUT,EXP-5266-OUT;n:type:ShaderForge.SFN_Slider,id:5266,x:31442,y:33405,ptovrint:False,ptlb:node_5266,ptin:_node_5266,varname:node_5266,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3721747,max:1;n:type:ShaderForge.SFN_Multiply,id:388,x:31933,y:32833,varname:node_388,prsc:2|A-8432-RGB,B-6255-RGB;n:type:ShaderForge.SFN_Color,id:6255,x:31747,y:32979,ptovrint:False,ptlb:node_6255,ptin:_node_6255,varname:node_6255,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.7426471,c3:0.7426471,c4:0.5;n:type:ShaderForge.SFN_Add,id:4672,x:32131,y:32931,varname:node_4672,prsc:2|A-388-OUT,B-1757-RGB,C-1631-OUT;n:type:ShaderForge.SFN_AmbientLight,id:1757,x:31933,y:32959,varname:node_1757,prsc:2;proporder:141-5852-1388-8432-5266-6255;pass:END;sub:END;*/

Shader "WhaleYan/3. Custom Lighting + Outline" {
    Properties {
        _Normal ("Normal", 2D) = "bump" {}
        _Outline ("Outline", Float ) = 0.1
        _OutlineColor ("Outline Color", Color) = (0,0,0,1)
        _node_8432 ("node_8432", 2D) = "white" {}
        _node_5266 ("node_5266", Range(0, 1)) = 0.3721747
        _node_6255 ("node_6255", Color) = (1,0.7426471,0.7426471,0.5)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 100
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _Outline;
            uniform float4 _OutlineColor;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_FOG_COORDS(0)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( float4(v.vertex.xyz + v.normal*_Outline,1) );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                return fixed4(_OutlineColor.rgb,0);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform sampler2D _node_8432; uniform float4 _node_8432_ST;
            uniform float _node_5266;
            uniform float4 _node_6255;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _Normal_var = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(i.uv0, _Normal)));
                float3 normalLocal = _Normal_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float4 _node_8432_var = tex2D(_node_8432,TRANSFORM_TEX(i.uv0, _node_8432));
                float node_1631 = pow(dot(halfDirection,i.normalDir),_node_5266);
                float3 node_4672 = ((_node_8432_var.rgb*_node_6255.rgb)+UNITY_LIGHTMODEL_AMBIENT.rgb+node_1631);
                float3 finalColor = (attenuation*_LightColor0.rgb*node_4672);
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform sampler2D _node_8432; uniform float4 _node_8432_ST;
            uniform float _node_5266;
            uniform float4 _node_6255;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _Normal_var = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(i.uv0, _Normal)));
                float3 normalLocal = _Normal_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float4 _node_8432_var = tex2D(_node_8432,TRANSFORM_TEX(i.uv0, _node_8432));
                float node_1631 = pow(dot(halfDirection,i.normalDir),_node_5266);
                float3 node_4672 = ((_node_8432_var.rgb*_node_6255.rgb)+UNITY_LIGHTMODEL_AMBIENT.rgb+node_1631);
                float3 finalColor = (attenuation*_LightColor0.rgb*node_4672);
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
