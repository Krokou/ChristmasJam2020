using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GhostController : MonoBehaviour
{
    private int frame = 0;
    private List<List<KeyCode>> keys = new List<List<KeyCode>>();
    private Rigidbody rb;
    //public GameObject player;
    public int ghostIndex;
    //public int levelIndex;

    void Start()
    {
        rb = GetComponent<Rigidbody>();
    }

    public void LoadKeys(List<List<KeyCode>> data)
    {
        keys = data;
    }

    private void OnEnable()
    {
        Restart();
    }

    public void Restart()
    {
        frame = 0;
    }

    private void FixedUpdate()
    {
        if (frame < keys.Count)
        {
            rb.velocity = Vector3.zero;
            foreach (var key in keys[frame])
            {
                switch (key)
                {
                    case KeyCode.W:
                        rb.velocity = new Vector3(rb.velocity.x, 0, 10);
                        break;
                    case KeyCode.S:
                        rb.velocity = new Vector3(rb.velocity.x, 0, -10);
                        break;
                    case KeyCode.A:
                        rb.velocity = new Vector3(-10, 0, rb.velocity.z);
                        break;
                    case KeyCode.D:
                        rb.velocity = new Vector3(10, 0, rb.velocity.z);
                        break;
                    default:
                        print("Something not right");
                        break;
                }
            }
            frame++;
        }
        else
        {
            rb.velocity = Vector3.zero;
        }
    }
}
