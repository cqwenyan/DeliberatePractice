using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace DesignMode.Template
{
    public class TemplateMain : MonoBehaviour
    {

        void Start()
        {
            WeaponBase weaponBase;
            weaponBase = new DepletedUraniumGatling();
            weaponBase.装备该武器();
            weaponBase = new DoomsdayTorpedo();
            weaponBase.装备该武器();
        }

    }

    abstract class WeaponBase
    {
        public abstract void 对攻击的影响();
        public abstract void 对防御的影响();

        public void 装备该武器()
        {
            对攻击的影响();
            对防御的影响();
        }
    }

    class DepletedUraniumGatling : WeaponBase
    {
        public override void 对攻击的影响()
        {
            Debug.Log("攻击速率*2");
        }

        public override void 对防御的影响()
        {
            Debug.Log("免疫一切动能武器的伤害");
        }
    }

    class DoomsdayTorpedo : WeaponBase
    {
        public override void 对攻击的影响()
        {
            Debug.Log("有20%概率直接击毁非量子态飞船");
        }

        public override void 对防御的影响()
        {
            Debug.Log("对无人机造成伤害*10");
        }
    }
}
