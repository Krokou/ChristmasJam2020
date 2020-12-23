using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SizeScript : MonoBehaviour
{
    public float speed = 1.005f;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (transform.localScale.x > 1.05f) speed = 2 - speed;
        if (transform.localScale.x < 1f) speed = 2 - speed;

        transform.localScale = transform.localScale * speed;
    }
}
