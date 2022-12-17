using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FriendLeaveTransition : MonoBehaviour
{
    [SerializeField] public GameObject TimelineToEnd;
    [SerializeField] public GameObject TimelineToStart;
    public bool friendLeave;

    void Update()
    {
        bool friendLeave = ((Ink.Runtime.BoolValue)DialogManager.GetInstance().GetVariableState("friendLeave")).value;

        switch (friendLeave)
        {
            case false:
                friendLeave = false;
                TimelineToEnd.SetActive(true);
                TimelineToStart.SetActive(false);
                break;
            case true:
                friendLeave = true;
                TimelineToEnd.SetActive(false);
                TimelineToStart.SetActive(true);
                break;
        }

    }
}
