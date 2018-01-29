using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Factory
{
    public class FactoryMain : MonoBehaviour
    {

        void Start()
        {
            IFactory iFactory = new AddFactory();
            Operation operation = iFactory.CreateOperation();
            operation.numberA = 1f;
            operation.numberB = 2f;
            operation.GetResult();
            iFactory = new SubtractionFactory();
            operation = iFactory.CreateOperation();
            operation.numberA = 10f;
            operation.numberB = 20f;
            operation.GetResult();
        }
    }

    abstract class Operation
    {
        public float numberA;
        public float numberB;

        public abstract void GetResult();
    }

    class AddOperation : Operation
    {
        public override void GetResult()
        {
            Debug.Log(numberA + numberB);
        }
    }

    class SubtractionOperation : Operation
    {
        public override void GetResult()
        {
            Debug.Log(numberA - numberB);
        }
    }

    interface IFactory
    {
        Operation CreateOperation();
    }

    class AddFactory : IFactory
    {
        public Operation CreateOperation()
        {
            return new AddOperation();
        }
    }

    class SubtractionFactory : IFactory
    {
        public Operation CreateOperation()
        {
            return new SubtractionOperation();
        }
    }
}
