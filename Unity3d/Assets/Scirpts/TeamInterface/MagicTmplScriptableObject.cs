using System.Collections;
using System.Collections.Generic;
using UnityEngine;
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

    // 编辑器
    public class MagicTmplScriptableObject : ScriptableObject, IScriptObj
    {
        public string PbPath { get; set; }

        public List<MagicTmpl> magicList = new List<MagicTmpl>();

        [Sirenix.OdinInspector.Button(Sirenix.OdinInspector.ButtonSizes.Large)]
        public void Save()
        {
            Tools.SavePbFile(magicList, Application.streamingAssetsPath + PbPath);
        }

        [Sirenix.OdinInspector.Button(Sirenix.OdinInspector.ButtonSizes.Medium)]
        public void Unsave()
        {
            Tools.ResetPbFile(ref magicList, Application.streamingAssetsPath + PbPath);
        }
    }

    public class TestScriptableObject
    {
        [UnityEditor.MenuItem("Lake/TeamInterface")]
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
            Directory.CreateDirectory(Path.GetDirectoryName(path));

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

        // 模拟服务端
        public static bool LoadConfigFileInServer<T>(ref T data, string path)
        {
            if (File.Exists(path) == false)
                throw new Exception("No Configuration file in " + path);

            try
            {
                using (var fs = new FileStream(path, FileMode.Open))
                    data = ProtoBuf.Serializer.Deserialize<T>(fs);
            }
            catch (Exception ex)
            {
                throw new Exception("Something is wrong in:" + path, ex);
            }
            return true;
        }

        // 客户端
        public static IEnumerator LoadConfigFileInClient<T>(Action<T> action, string path)
        {
            var www = new WWW(Application.streamingAssetsPath + "/Datas/" + path);
            while (www.isDone == false)
            {
                if (string.IsNullOrWhiteSpace(www.error) == false)
                    throw new Exception(www.error);

                //W.progress shown the load progress
                yield return null;
            }
            //if (string.IsNullOrWhiteSpace(W.error) == false)
            //    throw new Exception(W.error);

            try
            {
                var memoryStream = new MemoryStream(www.bytes);
                var data = ProtoBuf.Serializer.Deserialize<T>(memoryStream);
                action.Invoke(data);
            }
            catch (Exception exception)
            {
                throw new Exception("read configuration file wrong in " + path, exception);
            }

        }
    }
}
