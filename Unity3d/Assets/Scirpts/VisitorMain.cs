using System.Collections;
using System.Collections.Generic;
using UnityEngine;

abstract class Visitor
{

    public abstract void 狂战士反应(MadWarrior 狂战士);
    public abstract void 牧师反应(Priest 牧师);
}

class AttackVisitor : Visitor
{
    public override void 牧师反应(Priest 牧师)
    {
        Debug.Log(System.Reflection.MethodBase.GetCurrentMethod().Name + ":" + GetType().Name);
    }

    public override void 狂战士反应(MadWarrior 狂战士)
    {
        Debug.Log(System.Reflection.MethodBase.GetCurrentMethod().Name + ":" + GetType().Name);
    }
}

class HitedVisitor : Visitor
{
    public override void 牧师反应(Priest 牧师)
    {
        Debug.Log(System.Reflection.MethodBase.GetCurrentMethod().Name + ":" + GetType().Name);
    }

    public override void 狂战士反应(MadWarrior 狂战士)
    {
        Debug.Log(System.Reflection.MethodBase.GetCurrentMethod().Name + ":" + GetType().Name);
    }
}

abstract class BaseRoleType
{
    public abstract void 接受反应(Visitor 访问者);
}

class Priest : BaseRoleType
{
    public override void 接受反应(Visitor 访问者)
    {
        访问者.牧师反应(this);
    }
}

class MadWarrior : BaseRoleType
{
    public override void 接受反应(Visitor 访问者)
    {
        访问者.狂战士反应(this);
    }
}

class RoleTypeMgr
{
    IList<BaseRoleType> baseRoleTypeList = new List<BaseRoleType>();

    public void Add(BaseRoleType baseRoleType)
    {
        baseRoleTypeList.Add(baseRoleType);
    }
    public void Remove(BaseRoleType baseRoleType)
    {
        baseRoleTypeList.Remove(baseRoleType);
    }
    public void 接受反应(Visitor visitor)
    {
        foreach (var item in baseRoleTypeList)
            item.接受反应(visitor);
    }
}

public class VisitorMain : MonoBehaviour
{
    private void Start()
    {
        RoleTypeMgr roleTypeMgr = new RoleTypeMgr();
        roleTypeMgr.Add(new MadWarrior());
        roleTypeMgr.Add(new Priest());
        AttackVisitor 攻击 = new AttackVisitor();
        HitedVisitor 受击 = new HitedVisitor();
        roleTypeMgr.接受反应(攻击);
        roleTypeMgr.接受反应(受击);
    }
}
