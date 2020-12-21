using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IgnoreColliderStart : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        foreach (var collider in GameObject.FindGameObjectsWithTag("Ghost"))
        {
            Physics.IgnoreCollision(GetComponent<BoxCollider>(), collider.GetComponent<BoxCollider>(), true);
        }
        if (tag != "Player")
        {
            Physics.IgnoreCollision(GetComponent<BoxCollider>(), GameObject.FindGameObjectWithTag("Player").GetComponent<BoxCollider>(), true);
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnTriggerExit(Collider other)
    {
        if(other.tag == "Respawn")
        {
            foreach (var collider in GameObject.FindGameObjectsWithTag("Ghost"))
            {
                Physics.IgnoreCollision(GetComponent<BoxCollider>(), collider.GetComponent<BoxCollider>(), false);
            }
            if (tag != "Player")
            {
                Physics.IgnoreCollision(GetComponent<BoxCollider>(), GameObject.FindGameObjectWithTag("Player").GetComponent<BoxCollider>(), false);
            }
        }
    }
}
