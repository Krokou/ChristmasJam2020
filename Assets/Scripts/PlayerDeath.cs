using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerDeath : MonoBehaviour
{
    public IEnumerator KillPlayer()
    {
        print("Bang! Player dead!");

        //play death animation

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
}
