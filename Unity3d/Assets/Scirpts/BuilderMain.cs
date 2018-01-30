using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Builder
{
    public class BuilderMain : MonoBehaviour
    {

        void Start()
        {
            Director director = new Director();
            TankBuilder apocalypseTankBuilder = new ApocalypseTankBuilder();
            director.Construct(apocalypseTankBuilder);
            Tank tank = apocalypseTankBuilder.生产坦克();
            tank.ShowTank();
        }

    }

    class Tank
    {
        IList<string> 部件List = new List<string>();

        public void Add(string 部件)
        {
            部件List.Add(部件);
        }

        public void ShowTank()
        {
            foreach (var item in 部件List)
                Debug.Log(item);
        }
    }


    abstract class TankBuilder
    {
        public abstract void 装甲();
        public abstract void 炮管();
        public abstract void 引擎();
        public abstract Tank 生产坦克();
    }

    class MirageTankBuilder : TankBuilder
    {
        Tank tank = new Tank();

        public override void 引擎()
        {
            tank.Add("V6引擎");
        }

        public override void 炮管()
        {
            tank.Add("120mm炮管");
        }

        public override void 装甲()
        {
            tank.Add("拟态装甲");
        }

        public override Tank 生产坦克()
        {
            return tank;
        }
    }

    class ApocalypseTankBuilder : TankBuilder
    {
        Tank tank = new Tank();

        public override void 引擎()
        {
            tank.Add("V12引擎");
        }

        public override void 炮管()
        {
            tank.Add("200mm炮管");
        }

        public override void 装甲()
        {
            tank.Add("镂空的铁板");
        }

        public override Tank 生产坦克()
        {
            return tank;
        }
    }

    class Director
    {
        public void Construct(TankBuilder tankBuilder)
        {
            tankBuilder.引擎();
            tankBuilder.炮管();
            tankBuilder.装甲();
        }
    }
}
