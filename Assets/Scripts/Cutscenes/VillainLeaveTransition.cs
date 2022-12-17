using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class VillainLeaveTransition : MonoBehaviour
{
    [SerializeField] public GameObject TimelineToEnd;
    [SerializeField] public GameObject TimelineToStart;
    public bool villainLeave;

    void Update()
    {
        bool villainLeave = ((Ink.Runtime.BoolValue)DialogManager.GetInstance().GetVariableState("villainLeave")).value;

        switch (villainLeave)
        {
            case false:
                villainLeave = false;
                TimelineToEnd.SetActive(true);
                TimelineToStart.SetActive(false);
                break;
            case true:
                villainLeave = true;
                TimelineToEnd.SetActive(false);
                TimelineToStart.SetActive(true);
                break;
        }

    }
}
