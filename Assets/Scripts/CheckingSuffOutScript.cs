using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckingSuffOutScript : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        //enabled = false;
    }

    // Update is called once per frame
    void Update()
    {
        Vector3 forward = transform.position + transform.forward;
        Vector3 newForward = transform.eulerAngles;
        transform.RotateAround(forward, Vector3.right, 10);

        // transform.position += new Vector3(0.01f, 0f, 0f);
    }

    private void OnTriggerEnter(Collider other)
    {

    }
}
