using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerControllerMain : MonoBehaviour
{
    private Rigidbody rb;
    private GameObject animChar;
    private Transform tranChar;
    private Animator anim;


    private int frame = 0;
    private List<List<KeyCode>> recordedMovement = new List<List<KeyCode>>();

    public List<List<KeyCode>> GetRecordedMovement()
    {
        return recordedMovement;
    }


    void Start()
    {
        animChar = GameObject.FindWithTag("AnimatedCharacter");
        anim = animChar.GetComponent<Animator>();

        tranChar = animChar.GetComponent<Transform>();

        rb = GetComponent<Rigidbody>();
    }

    private void RecordMovement(KeyCode key)
    {
        recordedMovement[frame].Add(key);
    }

    private void FixedUpdate()
    {
        recordedMovement.Add(new List<KeyCode>());
        if (Input.GetKey(KeyCode.W))
        {
            rb.velocity = new Vector3(rb.velocity.x, 0, 10);
            RecordMovement(KeyCode.W);
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
            rb.velocity = new Vector3(rb.velocity.x, 0, -10);
            RecordMovement(KeyCode.S);
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
            rb.velocity = new Vector3(-10, 0, rb.velocity.z);
            RecordMovement(KeyCode.A);
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
            rb.velocity = new Vector3(10, 0, rb.velocity.z);
            RecordMovement(KeyCode.D);
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
