using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour
{
    public Vector3 target;
    public Vector3 cameraOffset = new Vector3(0f, 5.5f, -3f);
    public float speed = 10f;
    private Vector3 cameraPosTarget;
    // Start is called before the first frame update
    void Start()
    {
        target = GameObject.FindGameObjectWithTag("Player").transform.position;
    }

    private void FollowPlayer()
    {
        transform.position = Vector3.Slerp(transform.position, cameraPosTarget, speed * Time.deltaTime);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void FixedUpdate()
    {
        if (GameObject.FindGameObjectWithTag("Player") != null)
        {
            target = GameObject.FindGameObjectWithTag("Player").transform.position;
        }

        if (target != null)
        {
            cameraPosTarget = target + cameraOffset;
        }
        FollowPlayer();
    }
}
