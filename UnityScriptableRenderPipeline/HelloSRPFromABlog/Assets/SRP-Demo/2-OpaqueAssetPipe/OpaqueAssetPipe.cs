using System;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Experimental.Rendering;

[ExecuteInEditMode]
public class OpaqueAssetPipe : RenderPipelineAsset
{
#if UNITY_EDITOR
    [UnityEditor.MenuItem("SRP-Demo/02 - Create Opaque Asset Pipeline")]
    static void CreateBasicAssetPipeline()
    {
        var instance = ScriptableObject.CreateInstance<OpaqueAssetPipe>();
        UnityEditor.AssetDatabase.CreateAsset(instance, "Assets/SRP-Demo/2-OpaqueAssetPipe/OpaqueAssetPipe.asset");
    }
#endif

    protected override IRenderPipeline InternalCreatePipeline()
    {
        return new OpaqueAssetPipeInstance();
    }
}

public class OpaqueAssetPipeInstance : RenderPipeline
{
    public override void Render(ScriptableRenderContext context, Camera[] cameras)
    {
        base.Render(context, cameras);

        foreach (var camera in cameras)
        {
            #region �޳�
            // �����޳����̲����Ľṹ��
            ScriptableCullingParameters cullingParams;
            // ����޳�����
            if (!CullResults.GetCullingParameters(camera, out cullingParams))
                continue;

            // �Ƿ�������
            cullingParams.isOrthographic = false;
            // ִ���޳�
            CullResults cull = CullResults.Cull(ref cullingParams, context); 
            #endregion

            // Setup camera for rendering (sets render target, view/projection matrices and other
            // per-camera built-in shader variables).
            context.SetupCameraProperties(camera);

            // clear depth buffer
            var cmd = new CommandBuffer();
            cmd.ClearRenderTarget(true, false, Color.black);
            context.ExecuteCommandBuffer(cmd);
            cmd.Release();

            #region ��������
            // Draw opaque objects using BasicPass shader pass
            // �½��������ã���shader pass��Tags { "LightMode" = "BasicPass" }��Ӧ��
            var settings = new DrawRendererSettings(camera, new ShaderPassName("BasicPass"));
            // ��������ʽ
            settings.sorting.flags = SortFlags.CommonOpaque;
            // ����ʹ��GPUʵ����
            settings.flags = DrawRendererFlags.EnableInstancing;
            // ���ݹ���̽��͹�����ͼ���ݸ����д���Ⱦ������
            settings.rendererConfiguration = RendererConfiguration.PerObjectLightProbe | RendererConfiguration.PerObjectLightmaps;

            #endregion
            #region ����
            //  ��Ⱦ���������ã�������Ⱦ���з�Χ��
            var filterSettings = new FilterRenderersSettings(true) { renderQueueRange = RenderQueueRange.opaque };
            #endregion

            // ���ƿɼ�����Ⱦ��
            context.DrawRenderers(cull.visibleRenderers, ref settings, filterSettings);
            // Draw skybox
            context.DrawSkybox(camera);
            // �ύ�����ģ�ִ�����Զ����е�����
            context.Submit();
        }
    }
}
