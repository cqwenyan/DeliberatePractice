using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestDrawBorder : MonoBehaviour {

    Material mat;
    void Start() {
        mat = new Material(Shader.Find("Unlit/Test"));
    }

    // Update is called once per frame
    void Update() {

    }

    private void OnPostRender() {
        
    }

    private void OnRenderImage(RenderTexture source, RenderTexture destination) {
        DrawBorder(source, mat);
        Graphics.Blit(source, destination);
    }

    protected void DrawBorder(RenderTexture dest, Material material) {
        //float x1;
        //float x2;
        //float y1;
        //float y2;

        //RenderTexture.active = dest;
        //bool invertY = true; // source.texelSize.y < 0.0ff;
        //                     // Set up the simple Matrix
        //GL.PushMatrix();
        //GL.LoadOrtho();

        //for (int i = 0; i < material.passCount; i++) {
        //    material.SetPass(i);

        //    float y1_; float y2_;
        //    if (invertY) {
        //        y1_ = 1.0f; y2_ = 0.0f;
        //    }
        //    else {
        //        y1_ = 0.0f; y2_ = 1.0f;
        //    }

        //    GL.Begin(GL.QUADS);

        //    // left
        //    x1 = 0.0f;
        //    x2 = 0.0f + 1.0f / (dest.width * 1.0f);
        //    y1 = 0.0f;
        //    y2 = 1.0f;
        //    GL.TexCoord2(0.0f, y1_); GL.Vertex3(x1, y1, 0.1f);
        //    GL.TexCoord2(1.0f, y1_); GL.Vertex3(x2, y1, 0.1f);
        //    GL.TexCoord2(1.0f, y2_); GL.Vertex3(x2, y2, 0.1f);
        //    GL.TexCoord2(0.0f, y2_); GL.Vertex3(x1, y2, 0.1f);
        //    // right
        //    x1 = 1.0f - 1.0f / (dest.width * 1.0f);
        //    x2 = 1.0f;
        //    y1 = 0.0f;
        //    y2 = 1.0f;
        //    GL.TexCoord2(0.0f, y1_); GL.Vertex3(x1, y1, 0.1f);
        //    GL.TexCoord2(1.0f, y1_); GL.Vertex3(x2, y1, 0.1f);
        //    GL.TexCoord2(1.0f, y2_); GL.Vertex3(x2, y2, 0.1f);
        //    GL.TexCoord2(0.0f, y2_); GL.Vertex3(x1, y2, 0.1f);
        //    // top
        //    x1 = 0.0f;
        //    x2 = 1.0f;
        //    y1 = 0.0f;
        //    y2 = 0.0f + 1.0f / (dest.height * 1.0f);
        //    GL.TexCoord2(0.0f, y1_); GL.Vertex3(x1, y1, 0.1f);
        //    GL.TexCoord2(1.0f, y1_); GL.Vertex3(x2, y1, 0.1f);
        //    GL.TexCoord2(1.0f, y2_); GL.Vertex3(x2, y2, 0.1f);
        //    GL.TexCoord2(0.0f, y2_); GL.Vertex3(x1, y2, 0.1f);
        //    // bottom
        //    x1 = 0.0f;
        //    x2 = 1.0f;
        //    y1 = 1.0f - 1.0f / (dest.height * 1.0f);
        //    y2 = 1.0f;
        //    GL.TexCoord2(0.0f, y1_); GL.Vertex3(x1, y1, 0.1f);
        //    GL.TexCoord2(1.0f, y1_); GL.Vertex3(x2, y1, 0.1f);
        //    GL.TexCoord2(1.0f, y2_); GL.Vertex3(x2, y2, 0.1f);
        //    GL.TexCoord2(0.0f, y2_); GL.Vertex3(x1, y2, 0.1f);

        //    GL.Vertex3(0f, 0.5f, 0f); GL.Color(Color.red);
        //    GL.Vertex3(1f, 0.5f, 0f); GL.Color(Color.red);
        //    GL.Vertex3(0.5f, 0f, 0f); GL.Color(Color.red);


        //    GL.End();
        //}

        //GL.PopMatrix();



        GL.Clear(true, true, Color.black);
        // 将当前矩阵变换对象push缓存下来，防止自己的操作影响到其它渲染操作
        GL.PushMatrix();
        // 设置绘制模式为2D绘制，设置这个模式之后屏幕左下角变为(0,0)，屏幕右上角变为(1,1)，注释之后变为3D真实坐标
        GL.LoadOrtho();
        // 绘制过程
        for (var i = 0; i < mat.passCount; ++i) {
            // 设置shader，用过OpenGL ES2.0的同志应该知道，这个类似于combine glsl的过程，这里么有自己写，用的unity自带的sprite的shader
            // 由于shader可能存在多个pass通道，所以采用遍历的方式将每个通道都绘制一遍，当然有些shader只有一个通道，比如这个自带的sprite的shader
            // 也可以设置成SetPass(0)，就是使用默认的第一个通道进行渲染
            mat.SetPass(i);
            // 设置绘制模式为线条模式（这个模式每两个顶点为一组）
            GL.Begin(GL.LINES);
            // 设置顶点颜色（设置下一个顶点的颜色，如果后面没有更改，继续保留这个颜色属性直至被更改）
            GL.Color(Color.red);
            // 向GL中增加一个点的坐标
            GL.Vertex3(0, 0, 0);
            GL.Vertex3(0.5F, 0.5F, 0);
            GL.Color(Color.white);
            GL.Vertex3(0.5F, 0.5F, 0);
            GL.Color(Color.blue);
            GL.Vertex3(1F, 0F, 0);
            // 通知GL关闭当前绘制模式
            GL.End();
        }
        // 将矩阵对象还原，与之前的push操作相对应
        GL.PopMatrix();
    }
}

