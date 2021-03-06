using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class PlayerController : MonoBehaviour
{
    public Transform tranChar;
    public Animator anim;

    public static int RobotIndex = 0;
    private static int frame = 0;
    private Rigidbody rb;
    public static List<List<KeyCode>> recordedMovement = new List<List<KeyCode>>();

    public float speed = 3f;
    public float rotationSpeed = 0.01f;

    private Quaternion targetRotation = Quaternion.identity;

    public bool dead = false;

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

    private void OnTriggerEnter(Collider other)
    {
        if (other.tag == "Finish")
        {
            if (GameManager.levelIndex != 5)
            {


                GameManager.levelIndex += 1;
                GameManager.LoadLevel(GameManager.levelIndex);
            }

            else
            {
                SceneManager.LoadScene(7);
            }
        }
    }

    void Start()
    {
        rb = GetComponent<Rigidbody>();
        RestartGhostRecord();

        anim = GetComponentInChildren<Animator>();
        tranChar = anim.transform;

        transform.position = GameManager.levelSpawns[GameManager.levelIndex];
    }

    private void Update()
    {
        if (anim == null)
        {
            anim = GetComponentInChildren<Animator>();
            tranChar = anim.transform;
        }

        if (dead)
        {

        }
    }

    private void FixedUpdate()
    {
        if (!dead)
        {
            recordedMovement.Add(new List<KeyCode>());

            if (Input.GetKey(KeyCode.W))
            {
                // Movement
                rb.velocity = new Vector3(rb.velocity.x, rb.velocity.y, speed);
                RecordMovement(KeyCode.W);

                // Animation
                if (anim != null)
                {
                    targetRotation = Quaternion.Euler(0, 0, 0);
                    if (Input.GetKey(KeyCode.A))
                    {
                        targetRotation = Quaternion.Euler(0, 315, 0);
                    }
                    else if (Input.GetKey(KeyCode.D))
                    {
                        targetRotation = Quaternion.Euler(0, 45, 0);
                    }
                    tranChar.transform.rotation = Quaternion.Slerp(tranChar.transform.rotation, targetRotation, rotationSpeed);
                }
            }
            else if (Input.GetKey(KeyCode.S))
            {
                // Movement
                rb.velocity = new Vector3(rb.velocity.x, rb.velocity.y, -speed);
                RecordMovement(KeyCode.S);

                // Animation
                if (anim != null)
                {
                    targetRotation = Quaternion.Euler(0, 180, 0);
                    if (Input.GetKey(KeyCode.A))
                    {
                        targetRotation = Quaternion.Euler(0, 225, 0);
                    }
                    else if (Input.GetKey(KeyCode.D))
                    {
                        targetRotation = Quaternion.Euler(0, 135, 0);
                    }
                    tranChar.transform.rotation = Quaternion.Slerp(tranChar.transform.rotation, targetRotation, rotationSpeed);
                }
            }
            else rb.velocity = new Vector3(rb.velocity.x, rb.velocity.y, 0);
            if (Input.GetKey(KeyCode.A))
            {
                // Movement
                rb.velocity = new Vector3(-speed, rb.velocity.y, rb.velocity.z);
                RecordMovement(KeyCode.A);

                // Animation
                if (anim != null)
                {
                    targetRotation = Quaternion.Euler(0, 270, 0);
                    if (Input.GetKey(KeyCode.W))
                    {
                        targetRotation = Quaternion.Euler(0, 315, 0);
                    }
                    else if (Input.GetKey(KeyCode.S))
                    {
                        targetRotation = Quaternion.Euler(0, 225, 0);
                    }
                    tranChar.transform.rotation = Quaternion.Slerp(tranChar.transform.rotation, targetRotation, rotationSpeed);
                }
            }
            else if (Input.GetKey(KeyCode.D))
            {
                // Movement
                rb.velocity = new Vector3(speed, rb.velocity.y, rb.velocity.z);
                RecordMovement(KeyCode.D);

                // Animation
                if (anim != null)
                {
                    targetRotation = Quaternion.Euler(0, 90, 0);
                    if (Input.GetKey(KeyCode.W))
                    {
                        targetRotation = Quaternion.Euler(0, 45, 0);
                    }
                    else if (Input.GetKey(KeyCode.S))
                    {
                        targetRotation = Quaternion.Euler(0, 135, 0);
                    }
                    tranChar.transform.rotation = Quaternion.Slerp(tranChar.transform.rotation, targetRotation, rotationSpeed);
                }
            }
            else rb.velocity = new Vector3(0, rb.velocity.y, rb.velocity.z);

            // Animation
            if (anim != null)
            {
                if (rb.velocity != new Vector3(0, rb.velocity.y, 0))
                {
                    anim.SetBool("Walking", true);
                }
                else
                {
                    anim.SetBool("Walking", false);
                }
            }

            frame++;
        }
    }
    
}
