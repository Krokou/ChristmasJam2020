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
        anim.SetTrigger("Death_Electro");
        electro.Play();
    }

    void Alive()
    {
        anim.SetTrigger("Alive");
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

        anim.ResetTrigger("Death_Electro");
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
            OpenDoor();
        }
        if (Input.GetKeyDown(KeyCode.S))
        {
            CloseDoor();
        }
        if (Input.GetKeyDown(KeyCode.D))
        {
            Spring();
        }
        //doorAnim.ResetTrigger("Open");
        //doorAnim.ResetTrigger("Close");
    }
}
