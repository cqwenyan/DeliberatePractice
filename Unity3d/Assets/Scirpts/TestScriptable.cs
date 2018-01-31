using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestScriptable : MonoBehaviour {


    [Sirenix.OdinInspector.Button]
    void 生成Script文件()
    {
        string path = "Assets/x.asset";
        if (System.IO.File.Exists(path))
            return;
        ScriptableClass scriptableClass = ScriptableObject.CreateInstance<ScriptableClass>();
        UnityEditor.AssetDatabase.CreateAsset(scriptableClass, path);
        UnityEditor.AssetDatabase.SaveAssets();
        UnityEditor.AssetDatabase.Refresh();
    }

    [Sirenix.OdinInspector.Button]
    void AssetDatabase加载()
    {
        ScriptableClass scriptableClass = UnityEditor.AssetDatabase.LoadAssetAtPath<ScriptableClass>("Assets/x.asset");
        Debug.Log(scriptableClass.mFloat);
    }

    [Sirenix.OdinInspector.Button]
    void 加载AScriptableClassTwo()
    {
        ScriptableClass scriptableClass = UnityEditor.AssetDatabase.LoadAssetAtPath<ScriptableClass>("Assets/AScriptableClassTwo.asset");
        Debug.Log(scriptableClass.mFloat);
    }
}



