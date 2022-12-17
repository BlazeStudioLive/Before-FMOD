using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class PauseManager : MonoBehaviour
{

    private bool isPaused;
    public GameObject pausePanel;
    public string StartMenu;

   // [SerializeField] private GameObject dialogPanel;
   // [SerializeField] private GameObject choicePanel;

    // Start is called before the first frame update
    void Start()
    {
        isPaused = false;
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetButtonDown("pause"))
        {
            ChangePause();
        }      
    }

    public void ChangePause()
    {
        isPaused = !isPaused;
        if (isPaused)
        {
            pausePanel.SetActive(true);
           // dialogPanel.SetActive(false);
           // choicePanel.SetActive(false);
            Time.timeScale = 0f;
        }
        else
        {
            pausePanel.SetActive(false);
            Time.timeScale = 1f;
        }
    }

   public  void QuitToMain()
    {
        SceneManager.LoadScene("StartMenu");
        Time.timeScale = 1f;
    }
}
