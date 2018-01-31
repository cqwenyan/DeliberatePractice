using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace DesignMode.Flyweight
{
    public class FlyweightMain : MonoBehaviour
    {

        void Start()
        {
            int inputValue = 1;
            FlyweightFactory flyweightFactory = new FlyweightFactory();
            Flyweight fa = flyweightFactory.GetFlyweight("A");
            fa.Operation(inputValue);
            Flyweight fb = flyweightFactory.GetFlyweight("B");
            fb.Operation(inputValue);
        }
    }

    abstract class Flyweight
    {
        public abstract void Operation(int extrinsicstate);
    }

    class AA : Flyweight
    {
        public override void Operation(int extrinsicstate)
        {
            throw new System.NotImplementedException();
        }
    }

    class BB : Flyweight
    {
        public override void Operation(int extrinsicstate)
        {
            throw new System.NotImplementedException();
        }
    }

    class FlyweightFactory
    {
        Hashtable flyweights = new Hashtable();

        public FlyweightFactory()
        {
            flyweights.Add("A", new AA());
            flyweights.Add("B", new BB());
        }

        public Flyweight GetFlyweight(string key)
        {
            return (Flyweight)flyweights[key];
        }
    }
}