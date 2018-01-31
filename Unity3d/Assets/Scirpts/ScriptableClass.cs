using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class ScriptableClass : ScriptableObject
{
    public float mFloat;
    public List<Vector3> pos = new List<Vector3>();
}

[CreateAssetMenu(fileName = "AScriptableClassTwo", menuName = "CreateScriptFile")]
[System.Serializable]
public class ScriptableClassTwo : ScriptableObject
{
    public int mInt;
}
