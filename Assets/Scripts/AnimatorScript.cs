using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimatorScript : MonoBehaviour
{
    private Rigidbody rb;

    private GameObject animChar;
    private Animator anim;

    void Start()
    {
        animChar = GameObject.FindWithTag("AnimatedCharacter");
        anim = animChar.GetComponent<Animator>();

        rb = GetComponent<Rigidbody>();
    }

    private void FixedUpdate()
    {
        
        if (rb.velocity != Vector3.zero)
        {
            anim.SetBool("Walking", true);
        }
        else
        {
            anim.SetBool("Walking", false);
        }
    }
}
