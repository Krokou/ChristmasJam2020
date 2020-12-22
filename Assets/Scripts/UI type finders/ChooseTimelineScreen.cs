using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ChooseTimelineScreen : MonoBehaviour
{
    public GameObject panel;
    public GameObject ghostButtonPrefab;

    void Start()
    {
        for (int i = 0; i < GhostManager.levelData[GameManager.levelIndex].Count; i++)
        {
            GameObject ghostButton = Instantiate(ghostButtonPrefab) as GameObject;
            ghostButton.transform.SetParent(panel.transform);
            ghostButton.transform.localScale = new Vector3(1, 1, 1);
            ghostButton.GetComponent<TimelineButtonHandler>().buttonIndex = i;
            ghostButton.SetActive(false);
            ghostButton.SetActive(true);
        }
    }
}
