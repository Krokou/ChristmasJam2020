using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ButtonHandler : MonoBehaviour
{
    public int buttonIndex;

    //private List<Color> = ;

    private void OnEnable()
    {
        // Set text to right text for this robot
        GetComponentInChildren<Text>().text = "Timeline " + (buttonIndex + 1).ToString();

        // Set self to right active state with right picture depending on ghost data.
        GetComponent<Button>().interactable = true;
        if (GhostManager.levelData[GameManager.levelIndex][buttonIndex].record.Count != 0)
        {
            GetComponent<Image>().color = GhostManager.timeLineButtonColors[buttonIndex];
        }
        else if (buttonIndex == GhostManager.levelData[GameManager.levelIndex].Count - 1)
        {
            GetComponent<Image>().color = GhostManager.timeLineButtonColors[4];
        }
        else
        {
            GetComponent<Image>().color = GhostManager.timeLineButtonColors[5];
            GetComponent<Button>().interactable = false;
        }

        // Move self to right position depending on state and ammount of max ghosts for current level
    }

    public void ChooseTimeline(int index)
    {
        PlayerController.RobotIndex = index;
        // Set current robot indexed ghost's data

        // Set robot index to our index.

        // Unpause restart and unpause
    }


}
