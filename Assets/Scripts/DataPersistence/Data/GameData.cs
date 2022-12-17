using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]

public class GameData 
{
    public Vector3 playerPosition;
    public SerializableDictionary<string, bool> coinsCollected;
    public string globalVariablesStateJson;


    public GameData()
    {
        playerPosition = Vector3.zero;
        coinsCollected = new SerializableDictionary<string, bool>();
        this.globalVariablesStateJson = "";
    }
}
