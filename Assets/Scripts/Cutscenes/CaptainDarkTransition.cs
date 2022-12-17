using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CaptainDarkTransition : MonoBehaviour
{
    [SerializeField] public GameObject TimelineToEnd;
    [SerializeField] public GameObject TimelineToStart;
    [SerializeField] public GameObject SceneTransition;
    [SerializeField] public GameObject MusicToEnd;
    public bool flashes;
    public bool scene3;

    // Start is called before the first frame update
    void Start()
    {

    }

    void Update()
    {
        bool flashes = ((Ink.Runtime.BoolValue)DialogManager.GetInstance().GetVariableState("flashes")).value;
        bool scene3 = ((Ink.Runtime.BoolValue)DialogManager.GetInstance().GetVariableState("scene3")).value;

        switch (flashes)
        {
            case false:
                flashes = false;
                TimelineToEnd.SetActive(true);
                TimelineToStart.SetActive(false);
                break;
            case true:
                flashes = true;
                TimelineToEnd.SetActive(false);
                TimelineToStart.SetActive(true);
                MusicToEnd.SetActive(false);
                break;
        }

        switch(scene3)
        {
            case false:
                scene3 = false;
                SceneTransition.SetActive(false);
                break;
            case true:
                scene3 = true;
                SceneTransition.SetActive(true);
                break;
        }

    }
}
