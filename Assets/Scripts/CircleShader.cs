using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CircleShader : MonoBehaviour
{
    public static int PosID = Shader.PropertyToID("_Position");
    public static int SizeID = Shader.PropertyToID("_Size");

    public Material WallMaterial;
    public Camera Camera;
    public LayerMask Mask;

    public float speed = 0.05f;

    private void Update()
    {
        var dir = Camera.transform.position - transform.position;
        var ray = new Ray(transform.position, dir.normalized);

        if (Physics.Raycast(ray, 3000, Mask))
        {
            WallMaterial.SetFloat(SizeID, Mathf.Lerp(WallMaterial.GetFloat(SizeID), 0.65f, speed));
        }
        else
        {
            WallMaterial.SetFloat(SizeID, Mathf.Lerp(WallMaterial.GetFloat(SizeID), 0f, speed));
        }

        var view = Camera.WorldToViewportPoint(transform.position);
        WallMaterial.SetVector(PosID, view);
        
    }
}
