using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class PauseScreen : MonoBehaviour
{
    public PauseScript ps;
    private GameObject chooseTimelineScreen;

    public void Start()
    {
        ps = GameObject.FindGameObjectWithTag("GameController").GetComponent<PauseScript>();
    }

    private void Update()
    {
        if (ps == null)
        {
            ps = GameObject.FindGameObjectWithTag("GameController").GetComponent<PauseScript>();
        }
    }

    public void ResumeGame()
    {
        // Unpause
        ps.UnpauseGame();

        // Disable Pause Panel
        ps.DisablePausePanel();
    }

    public void TryAgain()
    {
        // Unpause
        ps.UnpauseGame();

        // Disable Pause Panel
        ps.DisablePausePanel();

        // Reset level with ghosts
        GameManager.RestartLevelWithGhosts();
    }

    public void SelectTimeline()
    {
        // Save Current Timeline
        GhostManager.SetGhostData(PlayerController.RobotIndex, PlayerController.GetRecordedMovement());

        // Enable Timeline Panel
        chooseTimelineScreen = Resources.FindObjectsOfTypeAll<ChooseTimelineScreen>()[0].gameObject;
        chooseTimelineScreen.SetActive(true);

        // Disable Pause Panel
        ps.DisablePausePanel();
    }
    
    public void RestartLevel()
    {
        // Unpause
        ps.UnpauseGame();

        // Disable Pause Panel
        ps.DisablePausePanel();

        // Reload scene and clear ghost data
        GameManager.LoadLevel(GameManager.levelIndex);
    }

    public void Quit()
    {
        // Reset level data
        GhostManager.ClearGhostData();

        // Unpause
        ps.UnpauseGame();

        // Disable Pause Panel
        ps.DisablePausePanel();

        // TODO Load mainmenu scene
        print("Main Menu scene transition");
        SceneManager.LoadScene(0);
    }
}
