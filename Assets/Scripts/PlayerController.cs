using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
<<<<<<< HEAD
    public Transform tranChar;
    public Animator anim;
=======
    private Rigidbody rb;
    private GameObject animChar;
    private Transform tranChar;
    private Animator anim;
>>>>>>> parent of 53c8ce8... Merge branch 'main' into CellshadingRendering


<<<<<<< HEAD
    public float speed = 3f;



    public static List<List<KeyCode>> GetRecordedMovement()
    {
        return recordedMovement;
    }
=======
    private int frame = 0;
    private List<List<KeyCode>> recordedMovement = new List<List<KeyCode>>();
>>>>>>> parent of 53c8ce8... Merge branch 'main' into CellshadingRendering

    public List<List<KeyCode>> GetRecordedMovement()
    {
        return recordedMovement;
    }


    void Start()
    {
<<<<<<< HEAD
        rb = GetComponent<Rigidbody>();
        RestartGhostRecord();

        anim = GetComponentInChildren<Animator>();
        tranChar = anim.transform;
    }

    private void Update()
    {
        if (anim == null)
        {
            anim = GetComponentInChildren<Animator>();
            tranChar = anim.transform;
        }
=======
        animChar = GameObject.FindWithTag("AnimatedCharacter");
        anim = animChar.GetComponent<Animator>();

        tranChar = animChar.GetComponent<Transform>();

        rb = GetComponent<Rigidbody>();
    }

    private void RecordMovement(KeyCode key)
    {
        recordedMovement[frame].Add(key);
>>>>>>> parent of 53c8ce8... Merge branch 'main' into CellshadingRendering
    }

    private void FixedUpdate()
    {
        recordedMovement.Add(new List<KeyCode>());
        if (Input.GetKey(KeyCode.W))
        {
<<<<<<< HEAD
            // Movement
            rb.velocity = new Vector3(rb.velocity.x, 0, speed);
=======
            rb.velocity = new Vector3(rb.velocity.x, 0, 10);
>>>>>>> parent of 53c8ce8... Merge branch 'main' into CellshadingRendering
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
<<<<<<< HEAD
            // Movement
            rb.velocity = new Vector3(rb.velocity.x, 0, -speed);
=======
            rb.velocity = new Vector3(rb.velocity.x, 0, -10);
>>>>>>> parent of 53c8ce8... Merge branch 'main' into CellshadingRendering
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
<<<<<<< HEAD
            // Movement
            rb.velocity = new Vector3(-speed, 0, rb.velocity.z);
=======
            rb.velocity = new Vector3(-10, 0, rb.velocity.z);
>>>>>>> parent of 53c8ce8... Merge branch 'main' into CellshadingRendering
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
<<<<<<< HEAD
            // Movement
            rb.velocity = new Vector3(speed, 0, rb.velocity.z);
=======
            rb.velocity = new Vector3(10, 0, rb.velocity.z);
>>>>>>> parent of 53c8ce8... Merge branch 'main' into CellshadingRendering
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
