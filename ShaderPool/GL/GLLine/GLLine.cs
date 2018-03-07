using UnityEngine;

public class RadialBlur : MonoBehaviour
{
    private void Start()
    {
        lineMaterial = new Material(Shader.Find(@"WhaleYan/GLLineMaterial"));
    }
    
    Material lineMaterial;
    void OnPostRender()
    {
        lineMaterial.SetPass(0);//设置该材质通道，0为默认值  
        GL.LoadOrtho();//设置绘制2d图像  
        GL.Begin(GL.LINES);//绘制类型为线段  
        GL.Color(Color.red);
        DrawLine(0, 0, 500, 500);
        DrawLine(0, 50, 1000, 500);
        DrawLine(0, 100, 700, 1080);
        GL.End();
    }
    
    void DrawLine(float x1, float y1, float x2, float y2)
    {
        GL.Vertex(new Vector3(x1 / Screen.width, y1 / Screen.height, 0));
        GL.Vertex(new Vector3(x2 / Screen.width, y2 / Screen.height, 0));
    }
}
