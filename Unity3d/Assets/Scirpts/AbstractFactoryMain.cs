using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AbstractFactory
{
    public class AbstractFactoryMain : MonoBehaviour
    {

        void Start()
        {
            IRaceFactory raceFactory = new DwarfFactory();
            FrostMagic 冰系矮人 = raceFactory.创建冰系角色();
            冰系矮人.Atk();
        }

    }

    interface IMagicOption
    {

    }

    abstract class FireMagic : IMagicOption
    {
        public abstract void Atk();
    }

    abstract class FrostMagic : IMagicOption
    {
        public abstract void Atk();
    }

    interface IRaceFactory
    {
        FireMagic 创建火系角色();
        FrostMagic 创建冰系角色();
    }

    class FireDwarf : FireMagic
    {
        public override void Atk()
        {
            Debug.Log("矮人踢出了有古典气息的一脚");
        }
    }

    class FireOrcish : FireMagic
    {
        public override void Atk()
        {
            Debug.Log("兽人踢出了意味深长的一脚");
        }
    }

    class FrostDwarf : FrostMagic
    {
        public override void Atk()
        {
            Debug.Log("矮人发起了冰冻攻击");
        }
    }

    class FrostOrcish : FrostMagic
    {
        public override void Atk()
        {
            Debug.Log("兽人发起了冰冻攻击");
        }
    }

    class DwarfFactory : IRaceFactory
    {
        public FireMagic 创建火系角色()
        {
            return new FireDwarf();
        }

        public FrostMagic 创建冰系角色()
        {
            return new FrostDwarf();
        }
    }

    class OrcishFactory : IRaceFactory
    {
        public FireMagic 创建火系角色()
        {
            return new FireOrcish();
        }

        public FrostMagic 创建冰系角色()
        {
            return new FrostOrcish();
        }
    }
}
