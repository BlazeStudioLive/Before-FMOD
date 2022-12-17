using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Coin1 : MonoBehaviour, IDataPersistence
{
    [SerializeField] private string id;


    [ContextMenu("Generate guid for id")]

    private void GenerateGuid()
    {
        id = System.Guid.NewGuid().ToString();
    }

    private SpriteRenderer visual;
    private bool collected = false;

    private void Awake()
    {
        visual = this.GetComponentInChildren<SpriteRenderer>();
    }
    public void LoadData(GameData data)
    {
        data.coinsCollected.TryGetValue(id, out collected);
        if(collected)
        {
            visual.gameObject.SetActive(false);
        }
    }

    public void SaveData(GameData data)
    {
        if(data.coinsCollected.ContainsKey(id)) 
        { 
            data.coinsCollected.Remove(id);
        }
        data.coinsCollected.Add(id, collected);
    }

    private void OnTriggerEnter2D(Collider2D other)
    {
        if (!collected && other.gameObject.CompareTag("Player"))
        {
            CoinManager.instance.ChangeCoins(1);
            collected = true;
            visual.gameObject.SetActive(false);
        }
    }
}
