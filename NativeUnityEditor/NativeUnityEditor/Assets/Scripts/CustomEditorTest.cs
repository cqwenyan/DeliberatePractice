using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CustomEditorTest : MonoBehaviour {

    [HideInInspector] [SerializeField] public Rect mRectValue { get; set; }
    [HideInInspector] [SerializeField] public Texture texture { get; set; }
}
