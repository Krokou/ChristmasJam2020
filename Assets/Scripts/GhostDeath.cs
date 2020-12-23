using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GhostDeath : MonoBehaviour
{
    private Animator anim;

    void Start()
    {
        anim = gameObject.GetComponentInChildren<Animator>();
    }
    public void KillGhost()
    {
        if (anim != null)
        {
            anim.SetTrigger("Death");
            gameObject.GetComponent<GhostController>().dead = true;
        }
    }

    private void Update()
    {
        if (anim == null)
        {
            anim = gameObject.GetComponentInChildren<Animator>();
        }
    }

    private void OnCollisionEnter(Collision col)
    {
        
        if (col.collider.tag == "Player" || col.collider.tag == "Ghost")
        {
            KillGhost();
        }
        
    }

    private void FixedUpdate()
    {
        if (transform.position.y < -3)
        {
            KillGhost();
        }
    }
}
