using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Lever : MonoBehaviour
{
    public Animator anim;
    public Animator door;

    private int counter = 0;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void FixedUpdate()
    {
        
    }

    void OnTriggerEnter(Collider other)
    {
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
