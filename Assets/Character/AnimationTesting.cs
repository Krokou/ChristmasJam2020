using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimationTesting : MonoBehaviour
{
    public ParticleSystem electro;
    public Animator anim;
    public Animator doorAnim;
    public Animator springA;

    void Death()
    {
        anim.SetBool("Death", true);
        electro.Play();
    }

    void Alive()
    {
        anim.SetTrigger("Alive");
    }
    void Walking()
    {
        anim.SetBool("Walking", true);
    }
    void Stop()
    {
        anim.SetBool("Walking", false);
    }
    void Interact()
    {
        anim.SetTrigger("Interact");
    }


    void CloseDoor()
    {
        doorAnim.SetTrigger("Close");
    }
    void OpenDoor()
    {
        doorAnim.SetTrigger("Open");
    }

    void Spring()
    {
        springA.SetTrigger("Spring");
    }
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {

        anim.ResetTrigger("Death");
        anim.ResetTrigger("Alive");
        if (Input.GetKeyDown(KeyCode.E))
        {
            Death();
        }
        if (Input.GetKeyDown(KeyCode.Q))
        {
            Alive();
        }
        if (Input.GetKeyDown(KeyCode.A))
        {
            Walking();
        }
        if (Input.GetKeyDown(KeyCode.S))
        {
            Stop();
        }
        if (Input.GetKeyDown(KeyCode.D))
        {
            Interact();
        }
    }
}
