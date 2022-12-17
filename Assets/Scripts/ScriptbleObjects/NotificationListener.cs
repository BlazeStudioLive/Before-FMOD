using UnityEngine;
using UnityEngine.Events;

public class NotificationListener : MonoBehaviour
{
    public UnityEvent myEvent;
    [SerializeField] public Notifications myNotification;

    public void OnEnable()
    {
        myNotification.RegisterListener(this);
    }

    public void OnDisable()
    {
        myNotification.DeregisterListener(this);
    }

    public void Raise()
    {
        myEvent.Invoke();
    }
}


