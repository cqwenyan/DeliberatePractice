// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:False,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32929,y:32713,varname:node_3138,prsc:2|emission-6813-OUT,alpha-9551-OUT;n:type:ShaderForge.SFN_TexCoord,id:3216,x:31730,y:32686,varname:node_3216,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Distance,id:3940,x:31937,y:32724,varname:node_3940,prsc:2|A-3216-U,B-1395-OUT;n:type:ShaderForge.SFN_OneMinus,id:7001,x:32107,y:32724,varname:node_7001,prsc:2|IN-3940-OUT;n:type:ShaderForge.SFN_Power,id:8815,x:32274,y:32724,varname:node_8815,prsc:2|VAL-7001-OUT,EXP-8809-OUT;n:type:ShaderForge.SFN_Slider,id:8809,x:31968,y:32922,ptovrint:False,ptlb:lineWidth,ptin:_lineWidth,varname:node_8809,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:6.702677,max:10;n:type:ShaderForge.SFN_Tex2d,id:8109,x:32519,y:32994,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_8109,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-7607-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:7607,x:32356,y:32994,varname:node_7607,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_VertexColor,id:6835,x:32505,y:33179,varname:node_6835,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9551,x:32685,y:33095,varname:node_9551,prsc:2|A-8109-A,B-6835-A;n:type:ShaderForge.SFN_Add,id:6813,x:32749,y:32812,varname:node_6813,prsc:2|A-2348-OUT,B-8109-RGB;n:type:ShaderForge.SFN_Slider,id:1177,x:31306,y:33137,ptovrint:False,ptlb:moveSpeed,ptin:_moveSpeed,varname:node_1177,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.4058825,max:0.5;n:type:ShaderForge.SFN_Time,id:503,x:31463,y:32984,varname:node_503,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1175,x:31649,y:32997,varname:node_1175,prsc:2|A-503-T,B-1177-OUT;n:type:ShaderForge.SFN_Frac,id:1395,x:31805,y:32997,varname:node_1395,prsc:2|IN-1175-OUT;n:type:ShaderForge.SFN_Color,id:8135,x:32274,y:32572,ptovrint:False,ptlb:lineColor,ptin:_lineColor,varname:node_8135,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:0.2,c4:1;n:type:ShaderForge.SFN_Multiply,id:2348,x:32526,y:32670,varname:node_2348,prsc:2|A-8135-RGB,B-8815-OUT;n:type:ShaderForge.SFN_Tex2d,id:5096,x:32648,y:32423,ptovrint:False,ptlb:node_5096,ptin:_node_5096,varname:node_5096,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|MIP-8815-OUT;proporder:8809-8109-1177-8135;pass:END;sub:END;*/

Shader "WhaleYan/FlowLight_1" {
    Properties {
        _lineWidth ("lineWidth", Range(0, 10)) = 6.702677
        _MainTex ("MainTex", 2D) = "white" {}
        _moveSpeed ("moveSpeed", Range(0, 0.5)) = 0.4058825
        _lineColor ("lineColor", Color) = (1,1,0.2,1)
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _lineWidth;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _moveSpeed;
            uniform float4 _lineColor;
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
                float4 node_503 = _Time;
                float node_8815 = pow((1.0 - distance(i.uv0.r,frac((node_503.g*_moveSpeed)))),_lineWidth);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 emissive = ((_lineColor.rgb*node_8815)+_MainTex_var.rgb);
                float3 finalColor = emissive;
                return fixed4(finalColor,(_MainTex_var.a*i.vertexColor.a));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
