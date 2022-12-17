using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Room : MonoBehaviour
{
    public Enemy[] enemies;
    public pot[] pots;

    public GameObject virtualCamera;
    public bool needText;
    public string placeName;
    public GameObject text;
    public GameObject textPanel;
    public Text placeText; 


    public virtual void OnTriggerEnter2D(Collider2D other)
    {
        if(other.CompareTag("Player") && !other.isTrigger)
        {
            //activate all enemies and pots
            for(int i = 0; i < enemies.Length; i++)
            {
                ChangeActivation(enemies[i], true);
            }
            for(int i = 0; i < pots.Length; i ++)
            {
                ChangeActivation(pots[i], true);
            }
            virtualCamera.SetActive(true);
            if(needText)
            {
                StartCoroutine(placeNameCo());
            }
        }
    }

    private IEnumerator placeNameCo()
    {
        text.SetActive(true);
        textPanel.SetActive(true);
        placeText.text = placeName;
        yield return new WaitForSeconds(3f);
        text.SetActive(false);
        textPanel.SetActive(false);
    }

    public virtual void OnTriggerExit2D(Collider2D other)
    {
        if(other.CompareTag("Player") && !other.isTrigger)
        {
            //deactivate all enemies and pots
            for (int i = 0; i < enemies.Length; i++)
            {
                ChangeActivation(enemies[i], false);
            }
            for (int i = 0; i < pots.Length; i++)
            {
                ChangeActivation(pots[i], false);
            }
            virtualCamera.SetActive(false);
        }
    }

    public void ChangeActivation(Component component, bool activation)
    {
        component.gameObject.SetActive(activation);
    }
}
