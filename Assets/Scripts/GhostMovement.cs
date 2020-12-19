using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GhostMovement : MonoBehaviour
{
    private int frame = 0;
    private List<List<KeyCode>> keys;
    private Rigidbody rb;
    public GameObject player;

    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody>();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnEnable()
    {
        frame = 0;
        keys = player.GetComponent<PlayerController>().GetRecordedMovement();
    }

    private void FixedUpdate()
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
}
