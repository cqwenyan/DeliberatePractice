using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace State
{
    public class StateMain : MonoBehaviour
    {

        void Start()
        {
            Context context = new Context(new TurnOff());
            context.Request();
            context.Request();
            context.Request();

        }

    }

    abstract class State
    {
        public abstract void 执行操作(Context context);
    }

    class TurnOn : State
    {
        public override void 执行操作(Context context)
        {
            context.MState = new TurnOff();
        }
    }

    class TurnOff : State
    {
        public override void 执行操作(Context context)
        {
            context.MState = new TurnOn();
        }
    }

    class Context
    {
        State mState;
        public Context(State state)
        {
            this.mState = state;
        }

        public State MState
        {
            set
            {
                mState = value;
                Debug.Log(mState.GetType());
            }
            get { return mState; }
        }

        public void Request()
        {
            mState.执行操作(this);
        }
    }
}
