using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GhostDeath : MonoBehaviour
{
    private Animator anim;
    private GameObject robotG;
    void Start()
    {
        robotG = GameObject.FindWithTag("Ghost");
        anim = robotG.GetComponent<Animator>();
    }
    public IEnumerator KillGhost()
    {
        print("Bang! Ghost dead!");

        // TODO: play death animation
        anim.SetTrigger("Death");


        yield return new WaitForSeconds(1);

        Destroy(gameObject);
        //jump to game over screen / restart
        yield return null;
    }

    private void OnCollisionEnter(Collision col)
    {
        
        if (col.collider.tag == "Player" || col.collider.tag == "Ghost")
        {
            StartCoroutine("KillGhost");
        }
        
    }

    private void FixedUpdate()
    {
        if (transform.position.y < -3)
        {
            StartCoroutine("KillGhost");
        }
    }
}
