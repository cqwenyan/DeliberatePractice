using UnityEngine;

[ExecuteInEditMode]
public class CrossLight : MonoBehaviour
{
    void OnEnable()
    {
        GetComponent<Camera>().depthTextureMode |= DepthTextureMode.DepthNormals;
    }

    void OnDisable()
    {
        GetComponent<Camera>().depthTextureMode &= ~DepthTextureMode.DepthNormals;
    }
}
