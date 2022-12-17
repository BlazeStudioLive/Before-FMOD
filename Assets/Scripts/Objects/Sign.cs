using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class Sign : Interactable
{
    [SerializeField] private Notifications signNotification;
    [SerializeField] private StringValue signText;
    [SerializeField] private string newSignText;
    [SerializeField] private bool dialogActive = false;
    public GameObject dialogBox;
    public Text dialogText;
    public string dialog;


    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        if (playerInRange)
        {
            if (Input.GetButtonDown("attack"))
            {
                dialogActive = !dialogActive;
                signText.value = newSignText;
                signNotification.Raise();
                if (dialogBox.activeInHierarchy)
                {
                    dialogBox.SetActive(false);
                }
                else
                {
                    dialogBox.SetActive(true);
                    dialogText.text = dialog;
                }
            }
        }
    }

    public override void OnTriggerExit2D(Collider2D other)
    {
        base.OnTriggerExit2D(other);
        if (other.gameObject.CompareTag("Player") && !other.isTrigger)
        {
            if (other.CompareTag("Player") && !other.isTrigger)//
            {//
                dialogBox.SetActive(false);//
                                           // context.Raise();//
                playerInRange = false;//
            }//

            if (dialogActive)
            {
                dialogActive = !dialogActive;
                signNotification.Raise();
            }
        }
    }
}


