using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Interactable : MonoBehaviour
{
    [SerializeField] public bool playerInRange;
    [SerializeField] public string otherTag;
    [SerializeField] public Notifications myNotification;
    public Signal context;


    public virtual void OnTriggerEnter2D(Collider2D other)
    {
        if (other.CompareTag("Player") && !other.isTrigger)
        {
            context.Raise();
            playerInRange = true;
            myNotification.Raise();
        }
    }

    public virtual void OnTriggerExit2D(Collider2D other)
    {
        if (other.CompareTag("Player") && !other.isTrigger)
        {
            context.Raise();
            playerInRange = false;
            myNotification.Raise();
        }
    }
}


