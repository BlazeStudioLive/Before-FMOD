using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class CoinManager : MonoBehaviour, IDataPersistence
{

    public static CoinManager instance;

    [SerializeField] private int totalCoins = 0;

    private int coinsCollected = 0;
    public TextMeshProUGUI coinDisplayText;
   

    void Start()
    {
        if(instance == null)
        {
            instance = this;
        }
    }

    public void LoadData(GameData data)
    {
        foreach(KeyValuePair<string, bool> pair in data.coinsCollected)
        {
            if(pair.Value)
            {
               totalCoins++;
            }
        }
    }

    public void SaveData (GameData data)
    {

    }

    public void ChangeCoins(int coinValue)
    {
        totalCoins += coinValue;

        coinDisplayText.text = totalCoins.ToString();
    }

    private void Update()
    {
        coinDisplayText.text = "" + totalCoins;
    }
}
