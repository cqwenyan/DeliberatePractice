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
            #region 剔除
            // 控制剔除过程参数的结构体
            ScriptableCullingParameters cullingParams;
            // 获得剔除参数
            if (!CullResults.GetCullingParameters(camera, out cullingParams))
                continue;

            // 是否是正交
            cullingParams.isOrthographic = false;
            // 执行剔除
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

            #region 绘制设置
            // Draw opaque objects using BasicPass shader pass
            // 新建绘制设置（与shader pass中Tags { "LightMode" = "BasicPass" }对应）
            var settings = new DrawRendererSettings(camera, new ShaderPassName("BasicPass"));
            // 设置排序方式
            settings.sorting.flags = SortFlags.CommonOpaque;
            // 运行使用GPU实例化
            settings.flags = DrawRendererFlags.EnableInstancing;
            // 传递光照探针和光照贴图数据给所有待渲染的物体
            settings.rendererConfiguration = RendererConfiguration.PerObjectLightProbe | RendererConfiguration.PerObjectLightmaps;

            #endregion
            #region 过滤
            //  渲染过滤器设置（设置渲染队列范围）
            var filterSettings = new FilterRenderersSettings(true) { renderQueueRange = RenderQueueRange.opaque };
            #endregion

            // 绘制可见的渲染器
            context.DrawRenderers(cull.visibleRenderers, ref settings, filterSettings);
            // Draw skybox
            context.DrawSkybox(camera);
            // 提交上下文，执行所以队列中的命令
            context.Submit();
        }
    }
}
