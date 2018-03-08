using UnityEngine;

public class RadialBlur : MonoBehaviour
{
    public float 模糊程度 = 1;
    public float 模糊作用范围 = 1;
    // 模糊贴图大小的倒数
    public int QualityNegativeCorFactor = 8;
    public Material radialBlurMaterial;

    void OnRenderImage(RenderTexture sourceTexture, RenderTexture destTexture)
    {
        if (模糊程度 != 0f && 模糊作用范围 != 0f && radialBlurMaterial != null)
        {
            int texWidth = sourceTexture.width / QualityNegativeCorFactor;
            int texHight = sourceTexture.height / QualityNegativeCorFactor;
            radialBlurMaterial.SetFloat("_BlurDegree", 模糊程度);
            radialBlurMaterial.SetFloat("_BlurWidth", 模糊作用范围);
            RenderTexture simpleSourceTexture = RenderTexture.GetTemporary(texWidth, texHight, 0, RenderTextureFormat.Default);
            simpleSourceTexture.filterMode = FilterMode.Bilinear;
            Graphics.Blit(sourceTexture, simpleSourceTexture);
            RenderTexture blurReTex = RenderTexture.GetTemporary(texWidth, texHight, 0, RenderTextureFormat.Default);
            blurReTex.filterMode = FilterMode.Bilinear;
            Graphics.Blit(simpleSourceTexture, blurReTex, radialBlurMaterial, 0);
            radialBlurMaterial.SetTexture("_BlurTex", blurReTex);
            Graphics.Blit(sourceTexture, destTexture, radialBlurMaterial, 1);
            RenderTexture.ReleaseTemporary(simpleSourceTexture);
            RenderTexture.ReleaseTemporary(blurReTex);
        }
        else
        {
            Graphics.Blit(sourceTexture, destTexture);
        }
    }
}
