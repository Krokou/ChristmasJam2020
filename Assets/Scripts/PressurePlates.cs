using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PressurePlates : MonoBehaviour
{
    public Animator door;
    public Animator door2;
    private Animator plate;

    // Start is called before the first frame update
    void Start()
    {
        plate = gameObject.GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    //void OnCollisionEnter(Collision collider)
    //{
    //    if(collider.gameObject.name == "Player")
    //    {
    //        door.SetBool("Open", true);
    //    }
    //}

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.name == "Player")
        {
            door.SetBool("Open", true);
            plate.SetBool("Active", true);
            door2.SetBool("Open", true);
        }
    }
    void OnTriggerExit(Collider other)
    {
        if (other.gameObject.name == "Player")
        {
            door.SetBool("Open", false);
            plate.SetBool("Active", false);
            door2.SetBool("Open", false);

        }
    }
}
