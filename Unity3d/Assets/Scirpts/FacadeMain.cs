using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Facade
{

    public class FacadeMain : MonoBehaviour
    {

        void Start()
        {
            DamageMgr damageMgr = new DamageMgr();
            damageMgr.击中驾驶室();
            damageMgr.击中油箱();
        }

    }

    class CalculateDamage
    {
        public void 击中伤害数值计算()
        {
            Debug.Log("击中伤害数值计算");
        }
    }

    class Fire
    {
        public void 起火()
        {
            Debug.Log("起火");
        }
    }

    class ComponentDestroy
    {
        public void 部件损坏()
        {
            Debug.Log("部件损坏");
        }
    }

    class PassengerInjure
    {
        public void 成员受伤()
        {
            Debug.Log("成员受伤");
        }
    }

    class MoveRelatedEffect
    {
        public void 移动速度减少()
        {
            Debug.Log("移动速度减少");
        }
    }

    class DamageMgr
    {
        CalculateDamage calculateDamage;
        Fire fire;
        ComponentDestroy componentDestroy;
        PassengerInjure passengerInjure;
        MoveRelatedEffect moveRelatedEffect;

        public DamageMgr()
        {
            calculateDamage = new CalculateDamage();
            fire = new Fire();
            componentDestroy = new ComponentDestroy();
            passengerInjure = new PassengerInjure();
            moveRelatedEffect = new MoveRelatedEffect();
        }

        public void 击中驾驶室()
        {
            calculateDamage.击中伤害数值计算();
            passengerInjure.成员受伤();
        }

        public void 击中油箱()
        {
            calculateDamage.击中伤害数值计算();
            fire.起火();
        }

        public void 击中履带()
        {
            calculateDamage.击中伤害数值计算();
            componentDestroy.部件损坏();
            moveRelatedEffect.移动速度减少();
        }
    }
}
