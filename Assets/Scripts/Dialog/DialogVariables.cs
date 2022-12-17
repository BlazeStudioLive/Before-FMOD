using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;


public class DialogVariables 
{

    public Dictionary<string, Ink.Runtime.Object> variables { get; private set; }

    private Story globalVariablesStory;

    private const string saveVariablesKey = "INK_VARIABLES";

    public DialogVariables(TextAsset loadGlobalsJSON, string globalStateJson)
    {
        globalVariablesStory = new Story(loadGlobalsJSON.text);

        if(!globalStateJson.Equals(""))
        {

            globalVariablesStory.state.LoadJson(globalStateJson);
        }

        variables = new Dictionary<string, Ink.Runtime.Object>();
        foreach (string name in globalVariablesStory.variablesState)
        {
            Ink.Runtime.Object value = globalVariablesStory.variablesState.GetVariableWithName(name);
            variables.Add(name, value);
            Debug.Log("Initialized global dialog variable: " + name + " = " + value);
        }
    }

public string GetGlobalVariablesStateJson()
    {
        VariablesToStory(globalVariablesStory);
        return globalVariablesStory.state.ToJson();
    }

    public void StartListening(Story story)
    {
        VariablesToStory(story);
        story.variablesState.variableChangedEvent += VariableChanged;
    }

    public void StopListening(Story story)
    {
        story.variablesState.variableChangedEvent -= VariableChanged;
    }

    private void VariableChanged(string name, Ink.Runtime.Object value)
    {
        if(variables.ContainsKey(name))
        {
            variables.Remove(name);
            variables.Add(name, value);
        }
    }

    private void VariablesToStory(Story story)
    {
        foreach(KeyValuePair<string, Ink.Runtime.Object> variable in variables)
        {
            story.variablesState.SetGlobal(variable.Key, variable.Value);
        }
    }
}
