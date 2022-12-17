using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using Ink.Runtime;
using UnityEngine.EventSystems;

public class DialogManager : MonoBehaviour, IDataPersistence
{
    [Header("Params")]
    [SerializeField] private float typingSpeed = 0.01f;

    [Header("Load Globals JSON")]
    [SerializeField] private TextAsset loadGlobalsJSON;

    [Header("Dialogue UI")]

    [SerializeField] private GameObject dialogPanel;
    [SerializeField] private GameObject choicePanel;

    [SerializeField] private GameObject continueIcon;

    [SerializeField] private TextMeshProUGUI dialogText;

    [SerializeField] private TextMeshProUGUI displayNameText;

    [SerializeField] private Animator portraitAnimator;
    private Animator layoutAnimator;


    [Header("Choices UI")]

    [SerializeField] private GameObject[] choices;
    private TextMeshProUGUI[] choicesText;

    private Story currentStory;

    public bool dialogIsPlaying { get; private set; }

    public bool canContinueToNextLine = false;

    private Coroutine displayLineCoroutine;

    private static DialogManager instance;

    private const string SPEAKER_TAG = "speaker";

    private const string PORTRAIT_TAG = "portrait";

    private const string LAYOUT_TAG = "layout";


    private DialogVariables dialogVariables;


    private void Awake()

    {
        if (instance != null)
        {
            Debug.LogWarning("Found more than one Dialog Manager in scene");
        }
        instance = this;


    }

    public static DialogManager GetInstance()
    {
        return instance;
    }

    private void Start()
    {
        dialogIsPlaying= false;
        dialogPanel.SetActive(false);
        choicePanel.SetActive(false);

        layoutAnimator = dialogPanel.GetComponent<Animator>();

        choicesText = new TextMeshProUGUI[choices.Length];
        int index = 0;
        foreach(GameObject choice in choices)
        {
            choicesText[index] = choice.GetComponentInChildren<TextMeshProUGUI>();
            index++;
        }
    }

    private void Update()
    {
        if (!dialogIsPlaying)
        {
            return;
        }

        if (currentStory.currentChoices.Count == 0
            && canContinueToNextLine
            && Input.GetButtonDown("attack"))
        {
            ContinueStory();
        }
    }

    public void EnterDialogMode(TextAsset inkJSON)
    {
        currentStory = new Story(inkJSON.text);
        dialogIsPlaying = true;
        dialogPanel.SetActive(true);
        choicePanel.SetActive(true);


        dialogVariables.StartListening(currentStory);

        ContinueStory();
    }

    private IEnumerator ExitDialogMode()
    {
        yield return new WaitForSeconds(0.2f);

        dialogVariables.StopListening(currentStory);

        dialogIsPlaying = false;
        dialogPanel.SetActive(false);

        dialogText.text = "";
    }

    private void ContinueStory()
    {
        if (currentStory.canContinue)
        {
            if(displayLineCoroutine != null)
            {
                StopCoroutine(displayLineCoroutine);
            }
            displayLineCoroutine = StartCoroutine(DisplayLine(currentStory.Continue()));

            HandleTags(currentStory.currentTags);
        }
        else
        {
            StartCoroutine(ExitDialogMode());
        }
    }

    private IEnumerator DisplayLine(string line)
    {
        dialogText.maxVisibleCharacters = 0;
        dialogText.text = "";



        continueIcon.SetActive(false);
        choicePanel.SetActive(false);
        HideChoices();

        canContinueToNextLine = false;

        foreach (char letter in line.ToCharArray())
        {

             if (Input.GetButtonDown("Submit"));
              {
                       dialogText.maxVisibleCharacters = line.Length;
               // break;
             }
            yield return new WaitForSeconds(0.02f);

            dialogText.text += letter;
            dialogText.maxVisibleCharacters++;
            yield return new WaitForSeconds(typingSpeed);
        }
        continueIcon.SetActive(true);
        choicePanel.SetActive(true);
        DisplayChoices();

        canContinueToNextLine = true;
    }

    private void HideChoices()
    {
        foreach (GameObject choiceButton in choices)
        {
            choiceButton.SetActive(false);
            choicePanel.SetActive(false);
        }
    }

    private void HandleTags(List<string> currentTags)
    {
        foreach (string tag in currentTags)
        {
            string[] splitTag = tag.Split(":");
            if (splitTag.Length !=2)
            {
                Debug.LogError("Tag could not be appropriately parsed: " + tag);
            }
            string tagKey = splitTag[0].Trim();
            string tagValue = splitTag[1].Trim();

            switch (tagKey)
            {
                case SPEAKER_TAG:
                    displayNameText.text = tagValue;
                    break;
                case PORTRAIT_TAG:
                    portraitAnimator.Play(tagValue);
                    break;
                case LAYOUT_TAG:
                    layoutAnimator.Play(tagValue);
                    break;
                default:
                    Debug.LogWarning("Tag came in but is not currently being handled: " + tag);
                    break;
            }
        }
    }

    private void DisplayChoices()
    {
        List<Choice> currentChoices = currentStory.currentChoices;

        //defensive check to make sure UI can support number of choices coming in
        if (currentChoices.Count > choices.Length)
        {
            Debug.LogError("More choices were given than the UI can support. Number of choices given: " + currentChoices.Count);
        }

        int index = 0;
        foreach(Choice choice in currentChoices)
        {
            choices[index].gameObject.SetActive(true);
            choicesText[index].text = choice.text;
            index++;
        }

        for (int i = index; i < choices.Length; i++)
        {
            choices[i].gameObject.SetActive(false);
        }

        StartCoroutine(SelectFirstChoice());
    }

    private IEnumerator SelectFirstChoice()
    {
        EventSystem.current.SetSelectedGameObject(null);
        yield return new WaitForEndOfFrame();
        EventSystem.current.SetSelectedGameObject(choices[0].gameObject);
    }

    public void MakeChoice(int choiceIndex)
    {
        if (canContinueToNextLine)
        {
            currentStory.ChooseChoiceIndex(choiceIndex);
            Input.GetButtonDown("Submit");
            ContinueStory();
        }  
    }

    public Ink.Runtime.Object GetVariableState(string variableName)
    {
        Ink.Runtime.Object variableValue = null;
        dialogVariables.variables.TryGetValue(variableName, out variableValue);
        if (variableValue == null)
        {
            Debug.LogWarning("Ink Variable was found to be null: " + variableName);
        }
        return variableValue;
    }

    public void LoadData(GameData data)
    {
        dialogVariables = new DialogVariables(loadGlobalsJSON,
            data.globalVariablesStateJson);
    }

    public void SaveData(GameData data)
    {
        string globalStateJson = dialogVariables.GetGlobalVariablesStateJson();
        data.globalVariablesStateJson = globalStateJson;
    }
}
