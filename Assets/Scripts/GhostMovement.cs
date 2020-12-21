using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GhostMovement : MonoBehaviour
{
    private int frame = 0;
    private List<List<KeyCode>> keys;
    private Rigidbody rb;
<<<<<<< HEAD:Assets/Scripts/GhostController.cs
    public int ghostIndex;
    public float speed = 3f;

    public Transform tranChar;
    public Animator anim;


=======
    public GameObject player;

    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody>();
    }
>>>>>>> parent of 53c8ce8... Merge branch 'main' into CellshadingRendering:Assets/Scripts/GhostMovement.cs

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnEnable()
    {
        frame = 0;
        keys = new List<List<KeyCode>>(player.GetComponent<PlayerController>().GetRecordedMovement());
    }



    void Start()
    {
        rb = GetComponent<Rigidbody>();

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
                        // Move
                        rb.velocity = new Vector3(rb.velocity.x, 0, speed);

                        // Animate
                        if (anim != null)
                        {
                            tranChar.transform.rotation = Quaternion.Euler(0, 0, 0);
                            if (keys[frame].Contains(KeyCode.A) && !keys[frame].Contains(KeyCode.D))
                            {
                                tranChar.transform.rotation = Quaternion.Euler(0, 315, 0);
                            }
                            else if (keys[frame].Contains(KeyCode.D))
                            {
                                tranChar.transform.rotation = Quaternion.Euler(0, 45, 0);
                            }
                        }

                        break;
                    case KeyCode.S:
                        // Move
                        rb.velocity = new Vector3(rb.velocity.x, 0, -speed);

                        // Animate
                        if (anim != null)
                        {
                            tranChar.transform.rotation = Quaternion.Euler(0, 180, 0);
                            if (keys[frame].Contains(KeyCode.A) && !keys[frame].Contains(KeyCode.D))
                            {
                                tranChar.transform.rotation = Quaternion.Euler(0, 225, 0);
                            }
                            else if (keys[frame].Contains(KeyCode.D))
                            {
                                tranChar.transform.rotation = Quaternion.Euler(0, 135, 0);
                            }
                        }

                        break;
                    case KeyCode.A:
                        // Move
                        rb.velocity = new Vector3(-speed, 0, rb.velocity.z);

                        // Animate
                        if (anim != null)
                        {
                            tranChar.transform.rotation = Quaternion.Euler(0, 270, 0);
                            if (keys[frame].Contains(KeyCode.W) && !keys[frame].Contains(KeyCode.S))
                            {
                                tranChar.transform.rotation = Quaternion.Euler(0, 315, 0);
                            }
                            else if (keys[frame].Contains(KeyCode.S))
                            {
                                tranChar.transform.rotation = Quaternion.Euler(0, 225, 0);
                            }
                        }

                        break;
                    case KeyCode.D:
                        // Move
                        rb.velocity = new Vector3(speed, 0, rb.velocity.z);

                        // Animate
                        if (anim != null)
                        {
                            tranChar.transform.rotation = Quaternion.Euler(0, 90, 0);
                            if (keys[frame].Contains(KeyCode.W) && !keys[frame].Contains(KeyCode.S))
                            {
                                tranChar.transform.rotation = Quaternion.Euler(0, 45, 0);
                            }
                            else if (keys[frame].Contains(KeyCode.S))
                            {
                                tranChar.transform.rotation = Quaternion.Euler(0, 135, 0);
                            }
                        }

                        break;
                    default:
                        print("Something not right");
                        break;
                }
            }
        }
<<<<<<< HEAD:Assets/Scripts/GhostController.cs
        
        // Animate
        if (anim != null)
        {
            if (rb.velocity != Vector3.zero)
            {
                anim.SetBool("Walking", true);
            }
            else
            {
                anim.SetBool("Walking", false);
            }
        }
=======
        frame++;
>>>>>>> parent of 53c8ce8... Merge branch 'main' into CellshadingRendering:Assets/Scripts/GhostMovement.cs
    }
}
