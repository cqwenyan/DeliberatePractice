using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Experimental.Rendering;

// 将本资产设置于Scriptable Render Pipeline Setting（Editor->Project Settings->Graphics）
[ExecuteInEditMode]
public class BasicAssetPipe : RenderPipelineAsset
{
    public Color clearColor = Color.green;

#if UNITY_EDITOR
    [UnityEditor.MenuItem("SRP-Demo/01 - Create Basic Asset Pipeline")]
    static void CreateBasicAssetPipeline()
    {
        var instance = ScriptableObject.CreateInstance<BasicAssetPipe>();
        UnityEditor.AssetDatabase.CreateAsset(instance, "Assets/SRP-Demo/1-BasicAssetPipe/BasicAssetPipe.asset");
    }
#endif

    protected override IRenderPipeline InternalCreatePipeline()
    {
        return new BasicPipeInstance(clearColor);
    }
}

public class BasicPipeInstance : RenderPipeline
{
    private Color m_ClearColor = Color.black;

    public BasicPipeInstance(Color clearColor)
    {
        m_ClearColor = clearColor;
    }

    public override void Render(ScriptableRenderContext context, Camera[] cameras)
    {
        // does not so much yet :()
        base.Render(context, cameras);

        // clear buffers to the configured color
        // 新建一个命令缓冲区，用于向渲染上下文发送命令
        var cmd = new CommandBuffer();
        // 发送一个清除渲染目标的命令
        cmd.ClearRenderTarget(true, true, m_ClearColor);
        // 执行命令渲染区
        context.ExecuteCommandBuffer(cmd);
        cmd.Release();
        context.Submit();
    }
}
