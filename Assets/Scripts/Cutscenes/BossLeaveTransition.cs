using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossLeaveTransition : MonoBehaviour
{
    [SerializeField] public GameObject TimelineToEnd;
    [SerializeField] public GameObject TimelineToStart;
    public bool bossLeave;


    void Update()
    {
        bool bossLeave = ((Ink.Runtime.BoolValue)DialogManager.GetInstance().GetVariableState("bossLeave")).value;

        switch (bossLeave)
        {
            case false:
                bossLeave = false;
                TimelineToEnd.SetActive(true);
                TimelineToStart.SetActive(false);
                break;
            case true:
                bossLeave = true;
                TimelineToEnd.SetActive(false);
                TimelineToStart.SetActive(true);
                break;
        }

    }
}
