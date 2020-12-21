using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnableScript : MonoBehaviour
{
    public GameObject obj;
    public GhostController gm;
    public BoxCollider bc;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKey(KeyCode.G))
        {
            try
            {
                //obj.SetActive(true);
                gm.enabled = true;
                //bc.enabled = true;
            }
            catch
            {

            }
        }
    }
}
