using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HeartManager : MonoBehaviour
{

    public Image[] hearts;
    public Sprite fullHeart;
    public Sprite halfFullHeart;
    public Sprite emptyHeart;
    public FloatValue heartContainers;
    public FloatValue playerCurrentHealth;

    // Start is called before the first frame update
    void Start()
    {
        InitHearts();
    }

    public void InitHearts()
    {
        for (int i = 0; i < heartContainers.initialValue; i++) 
        {
            hearts[i].gameObject.SetActive(true);
            hearts[i].sprite = emptyHeart;

        }        
    }

    public void UpdateHearts()
    {
        //this needs to talk to Inky so it knows to add to the knowledge meter
        float tempHealth = playerCurrentHealth.RuntimeValue;
        for (int i = 0; i < heartContainers.initialValue; i ++)
        {
            if (i <= tempHealth-1)
            {
                //Full Heart
                hearts[i].sprite = emptyHeart;
            }
            else if (i >= tempHealth)
            {
                //Empty Heart
                hearts[i].sprite = fullHeart;
            }
            else
            {
                hearts[i].sprite = halfFullHeart;
            }
        }
    }
}
