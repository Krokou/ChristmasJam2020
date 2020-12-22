using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class TimelineButtonHandler : MonoBehaviour
{
    public int buttonIndex = 0;

    //private List<Color> = ;

    private void OnEnable()
    {
        // Set correct text.
        // Set self to correct active state with right picture depending on ghost data.
        GetComponent<Button>().interactable = true;
        if (GhostManager.levelData[GameManager.levelIndex][buttonIndex].record.Count != 0)
        {
            GetComponent<Image>().color = GhostManager.timeLineButtonColors[buttonIndex];
            GetComponentInChildren<Text>().text = "Timeline " + (buttonIndex + 1).ToString();
        }
        else if (IsNextTimeLine())
        {
            GetComponent<Image>().color = GhostManager.timeLineButtonColors[4];
            GetComponentInChildren<Text>().text = "New Timeline";
        }
        else
        {
            GetComponent<Image>().color = GhostManager.timeLineButtonColors[5];
            GetComponent<Button>().interactable = false;
            GetComponentInChildren<Text>().text = "";
        }

        // Move self to right position depending on state and number of max ghosts for current level
        int tmp = (GhostManager.levelData[GameManager.levelIndex].Count - 1) * 40;
        GetComponent<RectTransform>().localPosition = new Vector3(-tmp + (buttonIndex * 80), 0, 0);
    }

    private bool IsNextTimeLine()
    {
        int tmp = 1000;
        for (int i = 0; i < GhostManager.levelData[GameManager.levelIndex].Count; i++)
        {
            if (GhostManager.levelData[GameManager.levelIndex][i].record.Count == 0)
            {
                tmp = i;
                break;
            }
        }
        if (tmp == buttonIndex)
        {
            return true;
        }
        else return false;
    }

    public void ChooseTimeline()
    {
        // Set current robot indexed ghost's data
        GhostManager.SetGhostData(PlayerController.RobotIndex, PlayerController.GetRecordedMovement());

        // Set robot index to our index.
        PlayerController.RobotIndex = buttonIndex;

        // Unpause and restart
        GameManager.RestartLevelWithGhosts();
    }


}
