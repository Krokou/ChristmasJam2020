using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CircleShader : MonoBehaviour
{
    public static int PosID = Shader.PropertyToID("_PositionP");
    public static int SizeID = Shader.PropertyToID("_SizeS");

    private GameObject[] tempObjs;
    public List<Material> wallMaterials;
    public Camera tcamera;
    public LayerMask mask;

    public float speed = 0.05f;

    private void Start()
    {
        tcamera = Camera.main;
        tempObjs = GameObject.FindGameObjectsWithTag("Mask");
        foreach (var go in tempObjs)
        {
            if (go.GetComponent<MeshRenderer>() != null)
            {
                wallMaterials.Add(go.GetComponent<MeshRenderer>().material);
            }
        }
    }

    private void Update()
    {
        if (tcamera == null) tcamera = Camera.main;
        else
        {
            var dir = tcamera.transform.position - transform.position;
            var ray = new Ray(transform.position, dir.normalized);

            if (Physics.Raycast(ray, 3000, mask))
            {
                foreach (var mat in wallMaterials)
                {
                    mat.SetFloat(SizeID, Mathf.Lerp(mat.GetFloat(SizeID), 0.65f, speed));
                }
            }
            else
            {
                foreach (var mat in wallMaterials)
                {
                    mat.SetFloat(SizeID, Mathf.Lerp(mat.GetFloat(SizeID), 0f, speed));
                }
            }

            var view = tcamera.WorldToViewportPoint(transform.position);
            foreach (var mat in wallMaterials)
            {
                mat.SetVector(PosID, view);
            }
        }
    }
}
