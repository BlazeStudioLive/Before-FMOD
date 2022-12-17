using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class KnowledgeUp : MonoBehaviour
{
    public int startKnowledge = 0;
    public int currentKnowledge;
    public KnowledgeBar knowledgeBar;
    public int HeroKnowledge;

    // Start is called before the first frame update
    void Start()
    {
        currentKnowledge = startKnowledge;
        knowledgeBar.SetStartKnowledge(startKnowledge);
    }

    void Update()
    {
        int HeroKnowledge = ((Ink.Runtime.IntValue)DialogManager.GetInstance().GetVariableState("HeroKnowledge")).value;

        switch (HeroKnowledge)
        {
            case 0:
                HeroKnowledge = 0;
                AddKnowledge(0);
                break;
            case 1:
                HeroKnowledge = 1;
                AddKnowledge(1);
                break;
            case 2:
                HeroKnowledge = 2;
                AddKnowledge(2);
                break;
            case 3:
                HeroKnowledge = 3;
                AddKnowledge(3);
                break;
            case 4:
                HeroKnowledge = 4;
                AddKnowledge(4);
                break;
            case 5:
                HeroKnowledge = 5;
                AddKnowledge(5);
                break;
            case 6:
                HeroKnowledge = 6;
                AddKnowledge(6);
                break;
            case 7:
                HeroKnowledge = 7;
                AddKnowledge(7);
                break;
            case 8:
                HeroKnowledge = 8;
                AddKnowledge(8);
                break;
            case 9:
                HeroKnowledge = 9;
                AddKnowledge(9);
                break;
            case 10:
                HeroKnowledge = 10;
                AddKnowledge(10);
                break;
        }
    }


    void AddKnowledge(int knowledge)
        {
            currentKnowledge = knowledge;
        

            knowledgeBar.SetKnowledge(currentKnowledge);
        }

    }
