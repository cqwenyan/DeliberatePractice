using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace DesignMode.Interpreter
{
    public class InterpreterMain : MonoBehaviour
    {
        IList<AbstractExpression> abstractExpression = new List<AbstractExpression>();
        private void Start()
        {
            Context context = new Context();
            abstractExpression.Add(new DecreaseHpBuffer());
            abstractExpression.Add(new DecreaseHpBuffer());
            abstractExpression.Add(new DecreaseSpeedBuffer());
            abstractExpression.Add(new DecreaseHpBuffer());

            foreach (var item in abstractExpression)
                item.解释(context);
        }
    }

    abstract class AbstractExpression
    {
        public abstract void 解释(Context contex);
    }

    class DecreaseHpBuffer : AbstractExpression
    {
        public override void 解释(Context contex)
        {

        }
    }

    class DecreaseSpeedBuffer : AbstractExpression
    {
        public override void 解释(Context contex)
        {

        }
    }

    class Context
    {
        private int hp;
        public int Hp { get { return hp; } set { hp = value; } }
        private float moveSpeed;
        public float MoveSpeed { get { return moveSpeed; } set { moveSpeed = value; } }
    }
}
