using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class NewAWindow : EditorWindow {

    // 打开方式
    [MenuItem("GameObject/OpenNewAWindow")]
    public static void OpenNewAWindow() {
        Rect size = new Rect(0f, 0f, 500f, 500f);
        NewAWindow newAWindow = (NewAWindow)GetWindowWithRect(typeof(NewAWindow), size, true, "window name");
        newAWindow.Show();
    }


}
