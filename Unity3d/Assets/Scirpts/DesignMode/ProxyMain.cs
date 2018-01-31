using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace DesignMode.ProxyMain
{
    public class ProxyMain : MonoBehaviour
    {

        void Start()
        {
            Proxy proxy = new Proxy();
            proxy.Request();
        }
    }

    abstract class Subject
    {
        public abstract void Request();
    }

    class ConcreateSubject : Subject
    {
        public override void Request()
        {
            Debug.Log("I'm ConcreateSubject");
        }
    }

    class Proxy : Subject
    {
        ConcreateSubject concreateSubject;

        public override void Request()
        {
            if (concreateSubject == null)
                concreateSubject = new ConcreateSubject();
            concreateSubject.Request();
        }
    }
}