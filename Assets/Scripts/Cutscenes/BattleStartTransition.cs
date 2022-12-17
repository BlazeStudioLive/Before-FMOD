using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BattleStartTransition : MonoBehaviour
{
    [SerializeField] public GameObject TimelineToEnd;
    [SerializeField] public GameObject TimelineToStart;
    public bool fightStart;


    void Update()
    {
        bool fightStart = ((Ink.Runtime.BoolValue)DialogManager.GetInstance().GetVariableState("fightStart")).value;

        switch (fightStart)
        {
            case false:
                fightStart = false;
              //  TimelineToEnd.SetActive(true);
                TimelineToStart.SetActive(false);
                break;
            case true:
                fightStart = true;
                TimelineToEnd.SetActive(false);
                TimelineToStart.SetActive(true);
                break;
        }

    }
}
