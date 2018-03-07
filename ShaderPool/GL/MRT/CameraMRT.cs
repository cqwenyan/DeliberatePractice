using UnityEngine;
using System.Collections;

[RequireComponent(typeof(Camera))]
[ExecuteInEditMode]
//多重渲染目标（Multiple Render Target）:想同时获得一个画面的不同后期效果,但是又不想进行多次处理浪费性能
public class CameraMRT : MonoBehaviour
{
    Material material;
    RenderTexture[] rTex = new RenderTexture[2];
    RenderBuffer[] rBuf = new RenderBuffer[2];
    Texture2D texRGB, texDepth;
    int texWidth = 512, texHeight = 256;

    void Start()
    {
        material = new Material(Shader.Find("WhaleYan/MRT"));
        texRGB = new Texture2D(texWidth, texHeight);
        texDepth = new Texture2D(texWidth / 2, texHeight);
        rTex[0] = new RenderTexture(texWidth, texHeight, 24, RenderTextureFormat.ARGB32);
        rTex[1] = new RenderTexture(texWidth, texHeight, 24, RenderTextureFormat.ARGB32);
        rBuf[0] = rTex[0].colorBuffer;
        rBuf[1] = rTex[1].colorBuffer;

        StartCoroutine(cameraProcess(rTex[0], rTex[1]));
    }

    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {

        RenderTexture oldRT = RenderTexture.active;
        Graphics.SetRenderTarget(rBuf, rTex[0].depthBuffer);

        GL.Clear(false, true, Color.clear);
        GL.PushMatrix();// 保存之前平移旋转等操作
        // 参考文献: http://blog.csdn.net/passtome/article/details/7768379
        GL.LoadOrtho();
        material.SetPass(0);
        GL.Begin(GL.QUADS);
        //GL.Color(Color.blue);
        GL.TexCoord2(0.0f, 0.0f); GL.Vertex3(0.0f, 0.0f, 0.0f); //GL.TexCoord2(x, y)第一个参数代表X坐标。 0.0f 是纹理的左侧。 0.5f是中， 1.0f是右
        GL.TexCoord2(1.0f, 0.0f); GL.Vertex3(1.0f, 0.0f, 0.0f); //GL.Vertex3f()是配置图形坐标，常与GL.TexCoord2()配合使用
        GL.TexCoord2(1.0f, 1.0f); GL.Vertex3(1.0f, 1.0f, 0.0f);
        GL.TexCoord2(0.0f, 1.0f); GL.Vertex3(0.0f, 1.0f, 0.0f);
        GL.End();
        GL.PopMatrix();// 恢复到PushMatrix()之前的位置角度等
        /*PushMatrix(), PopMatrix()成对的使用可以保证GL.PopMatrix()之后的进行的操作的坐标系原点依然是世界坐标系的原点，
        因为PushMatrix()进行的旋转、平移等操作改变了坐标系的位置。*/

        RenderTexture.active = oldRT;
        material.SetTexture("_Tex", source);
        Graphics.Blit(source, destination, material, 0);
    }

    WaitForEndOfFrame waitForEndOfFrame = new WaitForEndOfFrame();
    //将RenderTexture转换为Texture2D
    IEnumerator cameraProcess(RenderTexture rtColor, RenderTexture rtDepth)
    {
        while (true)
        {
            yield return waitForEndOfFrame;

            #region 将RenderTexture转化为Texture2D，虽然两者都继承与Texture，但此处不能简单强转，只能这样做
            RenderTexture.active = rtColor; // SetRenderTarget(RenderTexture rt）类似于 RenderTexture.active = rt
            texRGB.ReadPixels(new Rect(0f, 0f, rtColor.width, rtColor.height), 0, 0);
            RenderTexture.active = null;
            texRGB.Apply();
            #endregion

            //同理
            RenderTexture.active = rtDepth;
            texDepth.ReadPixels(new Rect(0f, 0f, rtDepth.width, rtDepth.height), 0, 0);
            RenderTexture.active = null;
            texDepth.Apply();
        }
    }

    //将转换得到的图片显示在屏幕上
    void OnGUI()
    {
        if (material == null)
            return;

        GUI.DrawTexture(new Rect(Screen.width - texRGB.width, Screen.height - texRGB.height, texRGB.width, texRGB.height), texRGB);
        GUI.DrawTexture(new Rect(0, Screen.height - texDepth.height, texDepth.width, texDepth.height), texDepth);
    }
}
