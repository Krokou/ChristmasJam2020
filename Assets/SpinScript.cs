using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpinScript : MonoBehaviour
{
    RectTransform rect;

    private void Start()
    {
        rect = GetComponent<RectTransform>();
    }

    private void FixedUpdate()
    {
        rect.RotateAround(gameObject.transform.position, Vector3.back, 0.5f);
    }
}
