using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class KnowledgeBar : MonoBehaviour
{
    public Slider slider;
    public Gradient gradient;
    public Image fill;
    
    public void SetStartKnowledge(int knowledge)
    {
        slider.minValue = knowledge;
        slider.value = knowledge;

        fill.color = gradient.Evaluate(1f);
    }

    public void SetKnowledge(int knowledge)
    {
        slider.value = knowledge;

        fill.color = gradient.Evaluate(slider.normalizedValue);
    }
}
