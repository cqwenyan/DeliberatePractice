using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TeamInterface;

public class TestTeamInterface : MonoBehaviour
{

    void Start()
    {
        #region Server-side
        List<MagicTmpl> magicTmplOne = null;
        // path can change to anything else.
        Tools.LoadConfigFileInServer<List<MagicTmpl>>(ref magicTmplOne, Application.streamingAssetsPath + "/Datas/MagicTmpl.pb");
        foreach (var item in magicTmplOne)
            Debug.Log("one:" + item.BaseDamge + ":" + item.Id + ":" + item.MagicType);
        #endregion

        #region Client-side
        List<MagicTmpl> magicTmplTwo = new List<MagicTmpl>();
        StartCoroutine(Tools.LoadConfigFileInClient<List<MagicTmpl>>((data) => magicTmplTwo = data, "MagicTmpl.pb"));
        foreach (var item in magicTmplTwo)
            Debug.Log("two:" + item.BaseDamge + ":" + item.Id + ":" + item.MagicType);
        #endregion
    }


}
