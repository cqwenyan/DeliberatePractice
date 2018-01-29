using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DecoratorMain : MonoBehaviour {

	void Start ()
    {
        ConcreateComponent concreateComponent = new ConcreateComponent();
        ADecorator aDecorator = new ADecorator();
        BDecorator bDecorator = new BDecorator();
        aDecorator.SetComponent(concreateComponent);
        bDecorator.SetComponent(aDecorator);
        bDecorator.Operation();
    }

}

abstract class Component
{
    public abstract void Operation();
}

class ConcreateComponent : Component
{
    public override void Operation()
    {
        Debug.Log("I'm concreate component");
    }
}

class Decorator : Component
{
    protected Component component;

    public void SetComponent(Component component)
    {
        this.component = component;
    }

    public override void Operation()
    {
        if (component != null)
        {
            component.Operation();
        }
    }
}

class ADecorator : Decorator
{
    static string AAddectivePart = "I'm A";

    public override void Operation()
    {
        base.Operation();
        Debug.Log(AAddectivePart);
    }
}

class BDecorator : Decorator
{
    static string BAddectivePart = "I'm B";
    public override void Operation()
    {
        base.Operation();
        Debug.Log(BAddectivePart);
    }
}
