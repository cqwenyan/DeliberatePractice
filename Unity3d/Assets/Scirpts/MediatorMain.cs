using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MediatorMain : MonoBehaviour
{

    void Start()
    {
        ConcreteMediator concreteMediator = new ConcreteMediator();
        PlayerA playerA = new PlayerA(concreteMediator);
        PlayerB playerB = new PlayerB(concreteMediator);
        concreteMediator.playerA = playerA;
        concreteMediator.playerB = playerB;
        playerA.通知("Hello");
        playerB.通知("Shut down");
    }
}

abstract class Mediator
{
    public abstract void 发送(string 信息, Player 接收对象);
}

abstract class Player
{
    protected Mediator mediator;
    public Player(Mediator mediator)
    {
        this.mediator = mediator;
    }
    public abstract void 发送(string msg);
    public abstract void 通知(string msg);
}

class PlayerA : Player
{
    public PlayerA(Mediator mediator) : base(mediator) { }
    public override void 发送(string 信息)
    {
        mediator.发送(信息, this);
    }
    public override void 通知(string msg)
    {
        
    }
}

class PlayerB : Player
{
    public PlayerB(Mediator mediator) : base(mediator) { }
    public override void 发送(string 信息)
    {
        mediator.发送(信息, this);
    }
    public override void 通知(string msg)
    {
        throw new System.NotImplementedException();
    }
}

class ConcreteMediator : Mediator
{
    PlayerA thePlayerA;
    PlayerB thePlayerB;

    public PlayerA playerA
    {
        set { thePlayerA = value; }
    }
    public PlayerB playerB
    {
        set { thePlayerB = value; }
    }
    public override void 发送(string 信息, Player 接收对象)
    {
        if (thePlayerA == 接收对象)
            thePlayerB.通知(信息);
        else
            thePlayerA.通知(信息);
    }
}
