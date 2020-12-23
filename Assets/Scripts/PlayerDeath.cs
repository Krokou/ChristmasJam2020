using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerDeath : MonoBehaviour
{
    private GameObject chooseTimelineScreen;

    private Animator anim;
    void Start()
    {
        anim = gameObject.GetComponentInChildren<Animator>();
    }
    public IEnumerator KillPlayer()
    {
        if (anim != null)
        {
            anim.SetTrigger("Death");
            
            yield return new WaitForSeconds(2);

            gameObject.GetComponent<PlayerController>().dead = true;
        }
        yield return null;
    }

    private void OnCollisionEnter(Collision col)
    {
        
        if (col.collider.tag == "Ghost")
        {

            StartCoroutine("KillPlayer");

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
            StartCoroutine("KillPlayer");
        }
    }
}
