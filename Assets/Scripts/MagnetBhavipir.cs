using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MagnetBhavipir : MonoBehaviour
{
    public List<GameObject> targets;
    public float range = 2f;
    public GameObject target;
    public float targetDistance;

    public float pullForce = 10;

    public void FindTargets()
    {
        foreach (var obj in GameObject.FindGameObjectsWithTag("Ghost"))
        {
            targets.Add(obj);
        }
        targets.Add(GameObject.FindGameObjectWithTag("Player"));
    }

    private GameObject FindClosestTarget(float range)
    {
        GameObject tmp = null;
        float shortestLength = range;
        foreach (var obj in targets)
        {
            float length = Mathf.Sqrt(
                Mathf.Pow(obj.transform.position.x - transform.position.x, 2) +
                Mathf.Pow(obj.transform.position.z - transform.position.z, 2));
            if (length < shortestLength)
            {
                shortestLength = length;
                tmp = obj;
            }
        }
        return tmp;
    }

    void Start()
    {
        FindTargets();
    }

    private void FixedUpdate()
    {
        target = FindClosestTarget(range);

        //Move towards target
        if (target != null)
        {
            gameObject.GetComponent<Rigidbody>().AddForce(
                new Vector3(
                    target.transform.position.x - transform.position.x,
                    0,
                    target.transform.position.z - transform.position.z)
                .normalized * pullForce);
        }
    }

    //Kill player / ghosts
    private void OnCollisionEnter(Collision collision)
    {
        print("Collision");
        if (collision.transform.tag == "Player")
        {
            collision.gameObject.GetComponent<PlayerDeath>().StartCoroutine("KillPlayer");
            targets.Remove(collision.gameObject);
        }
        else if (collision.transform.tag == "Ghost")
        {
            collision.gameObject.GetComponent<GhostDeath>().StartCoroutine("KillGhost");
            targets.Remove(collision.gameObject);
        }
    }
}
