using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DialogTrigger : MonoBehaviour
{
    [Header("Visual Cue")]
    [SerializeField] private GameObject visualCue;

    [Header("Character Animation")]
  //  [SerializeField] private Animator characterAnimator;

    [Header("Ink JSON")]
    [SerializeField] private TextAsset inkJSON;

    private bool playerInRange;

    private void Awake()
    {
        playerInRange= false;
        visualCue.SetActive(false);
    }

    private void Update()
    {
        if (playerInRange && !DialogManager.GetInstance().dialogIsPlaying)
        {
            visualCue.SetActive(true);

            if (Input.GetButtonDown("attack"))
            {
                Debug.Log(inkJSON.text);
                DialogManager.GetInstance().EnterDialogMode(inkJSON);
            //    characterAnimator.gameObject.SetActive(false);
            }
        }
        else
        {
            visualCue.SetActive(false);
        }
    }

    private void OnTriggerEnter2D(Collider2D collider)
    {
        if (collider.gameObject.tag == "Player")
        {
            playerInRange= true;
        }
    }

    private void OnTriggerExit2D(Collider2D collider)
    {
        if (collider.gameObject.tag == "Player")
        {
            playerInRange= false;
         //   characterAnimator.gameObject.SetActive(true);
        }
    }
}
