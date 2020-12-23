using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GhostDeath : MonoBehaviour
{
    public Animator anim;
    
    public IEnumerator KillGhost()
    {
        print("Bang! Ghost dead!");

        // TODO: play death animation
        anim.SetBool("Death", true);
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
