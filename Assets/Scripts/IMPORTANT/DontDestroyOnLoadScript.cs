using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DontDestroyOnLoadScript : MonoBehaviour
{
    private static GameObject instanceThis;

    void Awake()
    {
        DontDestroyOnLoad(this);

        if (instanceThis == null)
        {
            instanceThis = gameObject;
        }
        else
        {
            Destroy(gameObject);
        }
    }
}
