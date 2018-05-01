using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(CustomEditorTest))]
[ExecuteInEditMode]
public class CustomEditorTestEditor : Editor {

    public override void OnInspectorGUI() {
        base.OnInspectorGUI();

        CustomEditorTest test = (CustomEditorTest)target;
        test.mRectValue = EditorGUILayout.RectField("窗口坐标", test.mRectValue);
        test.texture = EditorGUILayout.ObjectField("增加一个贴图", test.texture, typeof(Texture), true) as Texture;
    }
}
