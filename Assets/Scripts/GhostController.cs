using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GhostController : MonoBehaviour
{
    private int frame = 0;
    private List<List<KeyCode>> keys = new List<List<KeyCode>>();
    private Rigidbody rb;
    public int ghostIndex;
    public float speed = 3f;

    public Transform tranChar;
    public Animator anim;



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
            frame++;
        }
        else
        {
            rb.velocity = Vector3.zero;
        }
        
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
    }
}
