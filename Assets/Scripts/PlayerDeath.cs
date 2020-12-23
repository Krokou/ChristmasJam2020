using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerDeath : MonoBehaviour
{
    private Animator anim;
    private GameObject robot;
    void Start()
    {
        robot = GameObject.FindWithTag("AnimatedCharacter");
        anim = robot.GetComponent<Animator>();
    }
    public IEnumerator KillPlayer()
    {
        print("Bang! Player dead!");

        // TODO: play death animation
        anim.SetTrigger("Death");


        yield return new WaitForSeconds(1);

        Destroy(gameObject);
        //jump to game over screen / restart
        yield return null;
    }

    private void OnCollisionEnter(Collision col)
    {
        
        if (col.collider.tag == "Ghost")
        {
            StartCoroutine("KillPlayer");

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
