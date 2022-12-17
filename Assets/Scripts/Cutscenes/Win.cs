using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Win : MonoBehaviour
{
    [SerializeField] public GameObject transitionToWin;

    public bool win;


    void Update()
    {
        bool win = ((Ink.Runtime.BoolValue)DialogManager.GetInstance().GetVariableState("win")).value;

        switch (win)
        {
            case false:
                win = false;
                transitionToWin.SetActive(false);
                break;
            case true:
                win = true;
                transitionToWin.SetActive(true);
                break;
        }

    }
}
