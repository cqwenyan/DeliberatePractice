using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using TeamInterface;

public class CommonWindow : EditorWindow {

    private void OnGUI()
    {
        if (GUILayout.Button("配置魔法"))
            TestScriptableObject.SelectMagic();
    }
}
