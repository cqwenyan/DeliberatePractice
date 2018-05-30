using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Experimental.Rendering;

// �����ʲ�������Scriptable Render Pipeline Setting��Editor->Project Settings->Graphics��
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
        // �½�һ�������������������Ⱦ�����ķ�������
        var cmd = new CommandBuffer();
        // ����һ�������ȾĿ�������
        cmd.ClearRenderTarget(true, true, m_ClearColor);
        // ִ��������Ⱦ��
        context.ExecuteCommandBuffer(cmd);
        cmd.Release();
        context.Submit();
    }
}
