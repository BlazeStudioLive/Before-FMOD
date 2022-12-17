using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class VillainBattleTransition : MonoBehaviour
{
    [SerializeField] public GameObject battleTransition;
    public bool BossBattle;

    // Start is called before the first frame update
    void Start()
    {

    }

    void Update()
    {
        bool BossBattle = ((Ink.Runtime.BoolValue)DialogManager.GetInstance().GetVariableState("BossBattle")).value;

        switch (BossBattle)
        {
            case false:
                BossBattle = false;
                battleTransition.SetActive(false);
                break;
            case true:
                BossBattle = true;
                battleTransition.SetActive(true);
                break;
        }
      
    }
}
