using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotationExa : MonoBehaviour
{
    Quaternion deltaRotation;

    

    public Transform target;
    public Rigidbody rb;
    public float speed = 10;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void FixedUpdate()
    {
        /*deltaRotation = Quaternion.identity * Quaternion.Inverse(rb.rotation);

        float angle = 0.0f;
        Vector3 axis = Vector3.zero;
        deltaRotation.ToAngleAxis(out angle, out axis);
        angle *= Mathf.Deg2Rad;

        Vector3 angularVelocity = axis * angle;

        rb.angularVelocity = angularVelocity;*/


        GameObject dummy = new GameObject();
        Transform targetRotation = dummy.transform;

        targetRotation.rotation = Quaternion.LookRotation(target.transform.position - transform.position);

        float angle = targetRotation.rotation.eulerAngles.y - transform.rotation.eulerAngles.y;
        angle = angle * Mathf.Deg2Rad;

        rb.angularVelocity = new Vector3(0, angle*10, 0);

        //Vector3 rotationDifference = target.transform.eulerAngles - transform.eulerAngles;
        //rb.angularVelocity = rotationDifference * speed;
    }
}
