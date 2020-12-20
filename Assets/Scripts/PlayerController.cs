using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    private GameObject animChar;
    private Transform tranChar;
    private Animator anim;

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

        animChar = GameObject.FindWithTag("AnimatedCharacter");
        anim = animChar.GetComponent<Animator>();
        tranChar = animChar.GetComponent<Transform>();
    }

    private void FixedUpdate()
    {
        recordedMovement.Add(new List<KeyCode>());

        if (Input.GetKey(KeyCode.W))
        {
            // Movement
            rb.velocity = new Vector3(rb.velocity.x, 0, 10);
            RecordMovement(KeyCode.W);

            // Animation
            tranChar.transform.rotation = Quaternion.Euler(0, 0, 0);
            if (Input.GetKey(KeyCode.A))
            {
                tranChar.transform.rotation = Quaternion.Euler(0, 315, 0);
            }
            else if (Input.GetKey(KeyCode.D))
            {
                tranChar.transform.rotation = Quaternion.Euler(0, 45, 0);
            }
        }
        else if (Input.GetKey(KeyCode.S))
        {
            // Movement
            rb.velocity = new Vector3(rb.velocity.x, 0, -10);
            RecordMovement(KeyCode.S);

            // Animation
            tranChar.transform.rotation = Quaternion.Euler(0, 180, 0);
            if (Input.GetKey(KeyCode.A))
            {
                tranChar.transform.rotation = Quaternion.Euler(0, 225, 0);
            }
            else if (Input.GetKey(KeyCode.D))
            {
                tranChar.transform.rotation = Quaternion.Euler(0, 135, 0);
            }
        }
        else rb.velocity = new Vector3(rb.velocity.x, 0, 0);
        if (Input.GetKey(KeyCode.A))
        {
            // Movement
            rb.velocity = new Vector3(-10, 0, rb.velocity.z);
            RecordMovement(KeyCode.A);
             
            // Animation
            tranChar.transform.rotation = Quaternion.Euler(0, 270, 0);
            if (Input.GetKey(KeyCode.W))
            {
                tranChar.transform.rotation = Quaternion.Euler(0, 315, 0);
            }
            else if (Input.GetKey(KeyCode.S))
            {
                tranChar.transform.rotation = Quaternion.Euler(0, 225, 0);
            }
        }
        else if (Input.GetKey(KeyCode.D))
        {
            // Movement
            rb.velocity = new Vector3(10, 0, rb.velocity.z);
            RecordMovement(KeyCode.D);

            // Animation
            tranChar.transform.rotation = Quaternion.Euler(0, 90, 0);
            if (Input.GetKey(KeyCode.W))
            {
                tranChar.transform.rotation = Quaternion.Euler(0, 45, 0);
            }
            else if (Input.GetKey(KeyCode.S))
            {
                tranChar.transform.rotation = Quaternion.Euler(0, 135, 0);
            }
        }
        else rb.velocity = new Vector3(0, 0, rb.velocity.z);
        
        // Animation
        if (rb.velocity != Vector3.zero)
        {
            anim.SetBool("Walking", true);
        }
        else
        {
            anim.SetBool("Walking", false);
        }

        frame++;
    }
}
