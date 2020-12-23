using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerDeath : MonoBehaviour
{
    private Animator anim;
    void Start()
    {
        anim = gameObject.GetComponentInChildren<Animator>();
    }
    public void KillPlayer()
    {
        if (anim != null)
        {
            anim.SetTrigger("Death");
            gameObject.GetComponent<PlayerController>().dead = true;
        }
    
    }

    private void OnCollisionEnter(Collision col)
    {
        
        if (col.collider.tag == "Ghost")
        {
            KillPlayer();

        }

    }

    private void Update()
    {
        if (anim == null)
        {
            anim = gameObject.GetComponentInChildren<Animator>();
        }
    }

    private void FixedUpdate()
    {
        
        if (transform.position.y < -3)
        {
            KillPlayer();
        }
    }
}
