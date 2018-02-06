// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:1,cusa:True,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:True,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:True,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:1873,x:33229,y:32719,varname:node_1873,prsc:2|emission-8556-OUT,alpha-8556-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:4828,x:32079,y:32739,varname:node_4828,prsc:2;n:type:ShaderForge.SFN_ObjectPosition,id:3361,x:32079,y:32880,varname:node_3361,prsc:2;n:type:ShaderForge.SFN_Subtract,id:7183,x:32281,y:32832,varname:node_7183,prsc:2|A-4828-XYZ,B-3361-XYZ;n:type:ShaderForge.SFN_ComponentMask,id:4652,x:32442,y:32832,varname:node_4652,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-7183-OUT;n:type:ShaderForge.SFN_Multiply,id:6453,x:32609,y:32832,varname:node_6453,prsc:2|A-4652-OUT,B-9149-OUT;n:type:ShaderForge.SFN_Slider,id:9149,x:32285,y:33020,ptovrint:False,ptlb:node_9149,ptin:_node_9149,varname:node_9149,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2.55478,max:10;n:type:ShaderForge.SFN_Subtract,id:4514,x:32776,y:32843,varname:node_4514,prsc:2|A-6453-OUT,B-759-R;n:type:ShaderForge.SFN_Tex2d,id:759,x:32619,y:33044,ptovrint:False,ptlb:node_759,ptin:_node_759,varname:node_759,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Clamp01,id:8556,x:33018,y:32843,varname:node_8556,prsc:2|IN-4180-OUT;n:type:ShaderForge.SFN_Multiply,id:4180,x:32829,y:33007,varname:node_4180,prsc:2|A-4514-OUT,B-9348-OUT;n:type:ShaderForge.SFN_Slider,id:9348,x:32493,y:33260,ptovrint:False,ptlb:node_9348,ptin:_node_9348,varname:node_9348,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.122918,max:1;proporder:9149-759-9348;pass:END;sub:END;*/

Shader "Shader Forge/2DWater" {
    Properties {
        _node_9149 ("node_9149", Range(0, 10)) = 2.55478
        _node_759 ("node_759", 2D) = "white" {}
        _node_9348 ("node_9348", Range(0, 1)) = 0.122918
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
        [MaterialToggle] PixelSnap ("Pixel snap", Float) = 0
        _Stencil ("Stencil ID", Float) = 0
        _StencilReadMask ("Stencil Read Mask", Float) = 255
        _StencilWriteMask ("Stencil Write Mask", Float) = 255
        _StencilComp ("Stencil Comparison", Float) = 8
        _StencilOp ("Stencil Operation", Float) = 0
        _StencilOpFail ("Stencil Fail Operation", Float) = 0
        _StencilOpZFail ("Stencil Z-Fail Operation", Float) = 0
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
            "CanUseSpriteAtlas"="True"
            "PreviewType"="Plane"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #pragma multi_compile _ PIXELSNAP_ON
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d11 glcore gles gles3 
            #pragma target 3.0
            uniform float _node_9149;
            uniform sampler2D _node_759; uniform float4 _node_759_ST;
            uniform float _node_9348;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                #ifdef PIXELSNAP_ON
                    o.pos = UnityPixelSnap(o.pos);
                #endif
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
////// Lighting:
////// Emissive:
                float4 _node_759_var = tex2D(_node_759,TRANSFORM_TEX(i.uv0, _node_759));
                float node_8556 = saturate(((((i.posWorld.rgb-objPos.rgb).g*_node_9149)-_node_759_var.r)*_node_9348));
                float3 emissive = float3(node_8556,node_8556,node_8556);
                float3 finalColor = emissive;
                return fixed4(finalColor,node_8556);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #pragma multi_compile _ PIXELSNAP_ON
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d11 glcore gles gles3 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                #ifdef PIXELSNAP_ON
                    o.pos = UnityPixelSnap(o.pos);
                #endif
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
