using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

namespace Observer
{
    public class ObserverMain : MonoBehaviour
    {

        void Start()
        {
            MiniMap miniMap = new MiniMap();
            DirectionGuide directionGuide = new DirectionGuide();
            Player player = new Player();
            player.PosUpdate += miniMap.UpdatePos;
            player.PosUpdate += directionGuide.UpdatePos;

            player.Notify(Vector3.up);
        }

    }

    class MiniMap
    {

        public void UpdatePos(Vector3 worldPos)
        {
            Debug.Log("MiniMap" + worldPos);
        }
    }

    class DirectionGuide
    {

        public void UpdatePos(Vector3 worldPos)
        {
            Debug.Log("Direction" + worldPos);
        }
    }

    interface Subject
    {
        void Notify(Vector3 worldPos);
    }

    class Player : Subject
    {
        public Action<Vector3> PosUpdate;

        public void Notify(Vector3 worldPos)
        {
            PosUpdate?.Invoke(worldPos);
        }
    }
}
