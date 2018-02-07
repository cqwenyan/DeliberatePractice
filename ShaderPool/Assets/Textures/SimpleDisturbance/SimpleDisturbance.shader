// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:False,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33006,y:32588,varname:node_3138,prsc:2|emission-8866-RGB,alpha-2766-A;n:type:ShaderForge.SFN_VertexColor,id:2766,x:32723,y:33019,varname:node_2766,prsc:2;n:type:ShaderForge.SFN_TexCoord,id:3483,x:31374,y:32852,varname:node_3483,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Time,id:9169,x:31289,y:33036,varname:node_9169,prsc:2;n:type:ShaderForge.SFN_Slider,id:5740,x:31144,y:33180,ptovrint:False,ptlb:node_5740,ptin:_node_5740,varname:node_5740,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.04863562,max:1;n:type:ShaderForge.SFN_Multiply,id:2169,x:31461,y:33058,varname:node_2169,prsc:2|A-9169-T,B-5740-OUT;n:type:ShaderForge.SFN_Panner,id:656,x:31628,y:32852,varname:node_656,prsc:2,spu:1,spv:0|UVIN-3483-UVOUT,DIST-2169-OUT;n:type:ShaderForge.SFN_Time,id:4845,x:31289,y:32604,varname:node_4845,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1797,x:31476,y:32549,varname:node_1797,prsc:2|A-4845-T,B-4406-OUT;n:type:ShaderForge.SFN_Slider,id:4406,x:31132,y:32747,ptovrint:False,ptlb:node_4406,ptin:_node_4406,varname:node_4406,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.07491256,max:1;n:type:ShaderForge.SFN_Panner,id:8324,x:31667,y:32614,varname:node_8324,prsc:2,spu:0,spv:1|UVIN-3483-UVOUT,DIST-1797-OUT;n:type:ShaderForge.SFN_ComponentMask,id:3619,x:31828,y:32614,varname:node_3619,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-8324-UVOUT;n:type:ShaderForge.SFN_ComponentMask,id:8655,x:31787,y:32852,varname:node_8655,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-656-UVOUT;n:type:ShaderForge.SFN_Append,id:3222,x:31980,y:32714,varname:node_3222,prsc:2|A-8655-OUT,B-3619-OUT;n:type:ShaderForge.SFN_Tex2d,id:6016,x:32145,y:32754,ptovrint:False,ptlb:node_6016,ptin:_node_6016,varname:node_6016,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True|UVIN-3222-OUT;n:type:ShaderForge.SFN_ComponentMask,id:5724,x:32316,y:32754,varname:node_5724,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-6016-RGB;n:type:ShaderForge.SFN_Color,id:3345,x:32483,y:32574,ptovrint:False,ptlb:node_3345,ptin:_node_3345,varname:node_3345,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:8390,x:32510,y:32775,varname:node_8390,prsc:2|A-5724-OUT,B-8211-OUT;n:type:ShaderForge.SFN_Slider,id:8211,x:32145,y:32934,ptovrint:False,ptlb:node_8211,ptin:_node_8211,varname:node_8211,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3203368,max:1;n:type:ShaderForge.SFN_Tex2d,id:8866,x:32743,y:32758,ptovrint:False,ptlb:node_8866,ptin:_node_8866,varname:node_8866,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-8390-OUT;proporder:5740-4406-6016-3345-8211-8866;pass:END;sub:END;*/

Shader "WhaleYan/SimpleDisturbance" {
    Properties {
        _node_5740 ("node_5740", Range(0, 1)) = 0.04863562
        _node_4406 ("node_4406", Range(0, 1)) = 0.07491256
        _node_6016 ("node_6016", 2D) = "bump" {}
        _node_3345 ("node_3345", Color) = (1,0.5,0.5,1)
        _node_8211 ("node_8211", Range(0, 1)) = 0.3203368
        _node_8866 ("node_8866", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d11 glcore gles 
            #pragma target 3.0
            uniform float _node_5740;
            uniform float _node_4406;
            uniform sampler2D _node_6016; uniform float4 _node_6016_ST;
            uniform float _node_8211;
            uniform sampler2D _node_8866; uniform float4 _node_8866_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 node_9169 = _Time;
                float4 node_4845 = _Time;
                float2 node_3222 = float2((i.uv0+(node_9169.g*_node_5740)*float2(1,0)).r,(i.uv0+(node_4845.g*_node_4406)*float2(0,1)).g);
                float3 _node_6016_var = UnpackNormal(tex2D(_node_6016,TRANSFORM_TEX(node_3222, _node_6016)));
                float2 node_8390 = (_node_6016_var.rgb.rg*_node_8211);
                float4 _node_8866_var = tex2D(_node_8866,TRANSFORM_TEX(node_8390, _node_8866));
                float3 emissive = _node_8866_var.rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,i.vertexColor.a);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
