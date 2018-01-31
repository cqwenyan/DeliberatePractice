using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using ProtoBuf;
using System.IO;
using System;

namespace TeamInterface
{
    public interface IScriptObj
    {
        string PbPath { get; set; }
        void Save();
        void Unsave();

    }

    [ProtoContract]
    [Serializable]
    [Sirenix.OdinInspector.ShowOdinSerializedPropertiesInInspector()]
    public class MagicTmpl
    {
        [ProtoMember(0)]
        public byte MagicType;
        [ProtoMember(1)]
        public int Id;
        [ProtoMember(2)]
        public int BaseDamge;
    }

    public class MagicTmplScriptableObject : ScriptableObject, IScriptObj
    {
        public string PbPath { get; set; }

        public List<MagicTmpl> list = new List<MagicTmpl>();


        public void Save()
        {
            Tools.SavePbFile(list, Application.streamingAssetsPath + PbPath);
        }

        public void Unsave()
        {
            Tools.ResetPbFile(ref list, Application.streamingAssetsPath + PbPath);
        }
    }

    public class TestScriptableObject
    {
        [UnityEditor.MenuItem("Lake/MagicTmpl")]
        public static void SelectMagic()
        {
            EditorTools.EditorScriptObject<MagicTmplScriptableObject>("/Datas/MagicTmpl");
        }
        
    }

    public class EditorTools
    {
        public static void EditorScriptObject<T>(string path) where T : ScriptableObject, IScriptObj
        {
            string assetPath = "Assets" + path + ".asset";
            T assetObj = UnityEditor.AssetDatabase.LoadAssetAtPath<T>(assetPath);
            if (assetObj == null)
            {
                assetObj = ScriptableObject.CreateInstance<T>();
                UnityEditor.AssetDatabase.CreateAsset(assetObj, assetPath);
                assetObj = UnityEditor.AssetDatabase.LoadAssetAtPath<T>(assetPath);
            }
            assetObj.PbPath = path + ".pb";

            UnityEditor.Selection.activeObject = assetObj;
            UnityEditor.Selection.selectionChanged = () =>
            {
                if (UnityEditor.EditorUtility.DisplayDialog(" ", "保存修改?", "是", "否"))
                    assetObj.Save();
            };
        }
    }

    public class Tools
    { 

        public static bool SavePbFile<T>(T needSavedObj, string path)
        {
            Directory.CreateDirectory(path);

            try
            {
                var memoryStream = new MemoryStream();
                ProtoBuf.Serializer.Serialize<T>(memoryStream, needSavedObj);
                byte[] buf = memoryStream.ToArray();
                using (FileStream fileStream = new FileStream(path, FileMode.Create))
                    fileStream.Write(buf, 0, buf.Length);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static void ResetPbFile<T>(ref T needSavedObj, string path)
        {
            using (FileStream fileStream = new FileStream(path, FileMode.Open))
                needSavedObj = ProtoBuf.Serializer.Deserialize<T>(fileStream);
        }
    }
}
