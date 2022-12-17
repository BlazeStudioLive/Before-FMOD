using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PanicTransition : MonoBehaviour
{
    [SerializeField] public GameObject SceneTransition;
    public bool scene5;

    void Update()
    {
        bool scene5 = ((Ink.Runtime.BoolValue)DialogManager.GetInstance().GetVariableState("scene5")).value;

        switch (scene5)
        {
            case false:
                scene5 = false;
                SceneTransition.SetActive(false);
                break;
            case true:
                scene5 = true;
                SceneTransition.SetActive(true);
                break;
        }
    }

}
