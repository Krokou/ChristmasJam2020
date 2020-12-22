using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimationTesting : MonoBehaviour
{
    public ParticleSystem electro;
    public Animator anim;

    void lightning()
    {
        anim.SetTrigger("Death_Electro");
        electro.Play();
    }

    void Alive()
    {
        anim.SetTrigger("Alive");
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
            lightning();
        }
        if (Input.GetKeyDown(KeyCode.Q))
        {
            Alive();
        }

        
    }
}
