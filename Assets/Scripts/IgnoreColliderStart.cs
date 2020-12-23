using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IgnoreColliderStart : MonoBehaviour
{
    IEnumerator Wait()
    {
        yield return new WaitForSeconds(0.5f);
        yield return new WaitForSeconds(0.5f);
        //GameManager.startFinished = true;
        yield return null;
    }


    private void Start()
    {
        foreach (var collider in GameObject.FindGameObjectsWithTag("Ghost"))
        {
            print(gameObject);
            print("Can not crash with:");
            print(collider);
            Physics.IgnoreCollision(GetComponent<BoxCollider>(), collider.GetComponent<BoxCollider>(), true);
        }
        if (tag != "Player")
        {
            print(gameObject);
            print("in");
            Physics.IgnoreCollision(GetComponent<BoxCollider>(), GameObject.FindGameObjectWithTag("Player").GetComponent<BoxCollider>(), true);
        }
        //StartCoroutine("Wait");
    }

    private void Awake()
    {
        //GameManager.startFinished = false;
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnTriggerExit(Collider other)
    {
        print("Out");
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
