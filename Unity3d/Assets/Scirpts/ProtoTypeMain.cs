using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace ProtoType
{
    public class ProtoTypeMain : MonoBehaviour
    {
        void Start()
        {
            ShallowCopyAtkMsg shallow = new ShallowCopyAtkMsg("shallow");
            ShallowCopyAtkMsg shallowClone = (ShallowCopyAtkMsg)shallow.Clone();
            shallow.ID = "shallowChange";
            Debug.Log(shallowClone.ID);


            //结果不对
            DeepCopyMsg deepCopyMsg = new DeepCopyMsg(new DeepCopyClassInMsg(1));
            deepCopyMsg.Age = 11;
            DeepCopyMsg shallowCopyMsgShallowClone = (DeepCopyMsg)deepCopyMsg.ShallowClone();
            DeepCopyMsg deepCopyMsgShallowClone = (DeepCopyMsg)deepCopyMsg.DeepClone();
            Debug.Log("Before DeepClone" + deepCopyMsgShallowClone.Age+ ":" + deepCopyMsgShallowClone.deepCopyClassInMsg.ID);
            Debug.Log("Before ShallowClone" + shallowCopyMsgShallowClone.Age + ":" + shallowCopyMsgShallowClone.deepCopyClassInMsg.ID);
            deepCopyMsg.Age = 111;
            deepCopyMsg.deepCopyClassInMsg.ID = 1111;
            Debug.Log("after DeepClone" + deepCopyMsgShallowClone.Age + ":" + deepCopyMsgShallowClone.deepCopyClassInMsg.ID);
            Debug.Log("after ShallowClone" + shallowCopyMsgShallowClone.Age + ":" + shallowCopyMsgShallowClone.deepCopyClassInMsg.ID);
        }
    }

    #region 浅拷贝
    abstract class ShallowCopyMsg
    {
        string id;

        public ShallowCopyMsg(string id)
        {
            this.id = id;
        }

        public string ID
        {
            get { return id; }
            set { id = value; }
        }

        public abstract ShallowCopyMsg Clone();
    }

    class ShallowCopyAtkMsg : ShallowCopyMsg
    {
        public ShallowCopyAtkMsg(string id) : base(id) { }

        public override ShallowCopyMsg Clone()
        {
            return (ShallowCopyMsg)this.MemberwiseClone();
        }
    }
    #endregion

    #region 深拷贝
    interface ICloneable
    {
        object ShallowClone();
        object DeepClone();
    }

    class DeepCopyClassInMsg : ICloneable
    {
        int id;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        public DeepCopyClassInMsg(int id)
        {
            this.id = id;
        }

        public object ShallowClone()
        {
            return this.MemberwiseClone();
        }

        public object DeepClone()
        {
            return this.MemberwiseClone();
        }
    }

    class DeepCopyMsg : ICloneable
    {
        int age;
        DeepCopyClassInMsg mDeepCopyClassInMsg;

        public DeepCopyClassInMsg deepCopyClassInMsg
        {
            get { return mDeepCopyClassInMsg; }
            set { mDeepCopyClassInMsg = value; }
        }

        public DeepCopyMsg(DeepCopyClassInMsg deepCopyClassInMsg)
        {
            mDeepCopyClassInMsg = deepCopyClassInMsg;
        }

        public int Age
        {
            get { return age; }
            set { age = value; }
        }

        public object ShallowClone()
        {
            return this.MemberwiseClone();
        }

        public object DeepClone()
        {
            DeepCopyMsg deepCopyMsg = new DeepCopyMsg(mDeepCopyClassInMsg);
            deepCopyMsg.age = age;
            return deepCopyMsg;
        }
    }

    #endregion

}
