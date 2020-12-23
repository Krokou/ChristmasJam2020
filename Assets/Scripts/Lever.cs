using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Lever : MonoBehaviour
{
    public Animator anim;
    public Animator door;
    private int counter = 0;

    private bool inTrigger = false;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void FixedUpdate()
    {
        
        if (Input.GetKeyDown(KeyCode.E) && inTrigger == true)
        {
            print("E");
            counter++;
            anim.SetTrigger("Turn");
            if (counter % 2 == 0)
            {
                door.SetBool("Open", false);
            }
            else if (counter % 2 != 0)
            {
                door.SetBool("Open", true);
            }
        }
        
    }

    void OnTriggerEnter(Collider other)
    {
        print("TriggerENTER");
        inTrigger = true;
        
    }
    void OnTriggerExit(Collider other)
    {
        inTrigger = false;
    }
}
