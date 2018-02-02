// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.1280277,fgcg:0.1953466,fgcb:0.2352941,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9465,x:32843,y:32656,varname:node_9465,prsc:2|emission-563-OUT;n:type:ShaderForge.SFN_VertexColor,id:6456,x:32399,y:32716,varname:node_6456,prsc:2;n:type:ShaderForge.SFN_Posterize,id:563,x:32678,y:32777,varname:node_563,prsc:2|IN-6456-RGB,STPS-9735-OUT;n:type:ShaderForge.SFN_Slider,id:4697,x:31972,y:32929,ptovrint:False,ptlb:node_4697,ptin:_node_4697,varname:node_4697,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1529254,max:1;n:type:ShaderForge.SFN_Power,id:6688,x:32338,y:32926,varname:node_6688,prsc:2|VAL-4697-OUT,EXP-4870-OUT;n:type:ShaderForge.SFN_Slider,id:4870,x:32017,y:33066,ptovrint:False,ptlb:node_4870,ptin:_node_4870,varname:node_4870,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.4521245,max:1;n:type:ShaderForge.SFN_ConstantLerp,id:9735,x:32523,y:32906,varname:node_9735,prsc:2,a:0.5,b:12|IN-6688-OUT;proporder:4697-4870;pass:END;sub:END;*/

Shader "WhaleYan/10. Unlit Vertex Colored" {
    Properties {
        _node_4697 ("node_4697", Range(0, 1)) = 0.1529254
        _node_4870 ("node_4870", Range(0, 1)) = 0.4521245
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 100
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _node_4697;
            uniform float _node_4870;
            struct VertexInput {
                float4 vertex : POSITION;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(0)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float node_9735 = lerp(0.5,12,pow(_node_4697,_node_4870));
                float3 emissive = floor(i.vertexColor.rgb * node_9735) / (node_9735 - 1);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
