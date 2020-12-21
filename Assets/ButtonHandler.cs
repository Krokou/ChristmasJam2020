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
        if (GhostManager.levelData[GameManager.levelIndex][buttonIndex].record.Count != 0)
        {

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
