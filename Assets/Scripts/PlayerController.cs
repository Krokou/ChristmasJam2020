using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public static int RobotIndex = 0;
    private static int frame = 0;
    private Rigidbody rb;
    public static List<List<KeyCode>> recordedMovement = new List<List<KeyCode>>();

    public static List<List<KeyCode>> GetRecordedMovement()
    {
        return recordedMovement;
    }

    public static void RestartGhostRecord()
    {
        recordedMovement = new List<List<KeyCode>>();
        frame = 0;
    }

    private void RecordMovement(KeyCode key)
    {
        recordedMovement[frame].Add(key);
    }



    void Start()
    {
        rb = GetComponent<Rigidbody>();
        RestartGhostRecord();
    }

    private void FixedUpdate()
    {
        recordedMovement.Add(new List<KeyCode>());

        if (Input.GetKey(KeyCode.W))
        {
            rb.velocity = new Vector3(rb.velocity.x, 0, 10);
            RecordMovement(KeyCode.W);
        }
        else if (Input.GetKey(KeyCode.S))
        {
            rb.velocity = new Vector3(rb.velocity.x, 0, -10);
            RecordMovement(KeyCode.S);
        }
        else rb.velocity = new Vector3(rb.velocity.x, 0, 0);
        if (Input.GetKey(KeyCode.A))
        {
            rb.velocity = new Vector3(-10, 0, rb.velocity.z);
            RecordMovement(KeyCode.A);
        }
        else if (Input.GetKey(KeyCode.D))
        {
            rb.velocity = new Vector3(10, 0, rb.velocity.z);
            RecordMovement(KeyCode.D);
        }
        else rb.velocity = new Vector3(0, 0, rb.velocity.z);

        frame++;
    }

    private void Update()
    {
        
    }
}
