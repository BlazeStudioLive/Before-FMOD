using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class MainMenu : MonoBehaviour
{
    [Header("Menu Buttons")]
    [SerializeField] private Button firstTimeButton;
    [SerializeField] private Button playedBeforeButton;
    [SerializeField] private Button quitButton;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void FirstTime()
    {
        DisableMenuButtons();
        DataPersistenceManager.instance.NewGame();
        SceneManager.LoadSceneAsync("Opening 1");
    }

    public void PlayedBefore()
    {
        DisableMenuButtons();
        SceneManager.LoadSceneAsync("Corinth");
    }

    public void QuitToDesktop()
    {
        Application.Quit();
    }

    private void DisableMenuButtons()
    {
        firstTimeButton.interactable = false;
        playedBeforeButton.interactable = false;
        quitButton.interactable = false;
    }
}
