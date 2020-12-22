using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    public static int levelIndex = 0;
    public static List<Vector3> levelSpawns = new List<Vector3>();

    private void Start()
    {
        // Prepare levels here in GhostManager
        // Level 0
        GhostManager.AddLevel(4);
        levelSpawns.Add(new Vector3(-4f, 0f, -4f));
        

        // Level 1
        
        
        // Level 2

    }

    // reset progress script
    public static void ResetProgress()
    {
        GhostManager.ClearGhostData();
    }

    public static void ResetProgress(int levelIndex)
    {
        GhostManager.ClearGhostData(levelIndex);
    }

    public static void LoadLevel(int level)
    {
        levelIndex = level;
        PlayerController.RobotIndex = 0;
        GhostManager.ClearGhostData(level);
        RestartLevelWithGhosts();
    }

    // TODO
    public static void RestartLevelWithGhosts()
    {
        // TODO: Reset level by loading scene again without resetting ghost progress

        // Remove player and ghosts
        foreach (var ghost in GameObject.FindGameObjectsWithTag("Ghost"))
        {
            Destroy(ghost);
        }
        Destroy(GameObject.FindGameObjectWithTag("Player"));

        // Spawn them in again
        // Load ghosts
        for (int i = 0; i < GhostManager.levelData[levelIndex].Count; i++)
        {
            GhostManager.GhostData ghost = GhostManager.levelData[levelIndex][i];

            if (i != PlayerController.RobotIndex && ghost.record.Count != 0)
            {
                GameObject newGhost = Instantiate(Resources.Load("Ghost")) as GameObject;
                newGhost.transform.position = levelSpawns[levelIndex]; 
                newGhost.GetComponent<GhostController>().ghostIndex = i;
            }
        }
        // Load the keys
        foreach (var ghost in GameObject.FindGameObjectsWithTag("Ghost"))
        {
            try
            {
                GhostController controller = ghost.GetComponent<GhostController>();
                controller.LoadKeys(GhostManager.GetGhostData(levelIndex, controller.ghostIndex));
                controller.Restart();
            }
            catch
            {
                print("Error in setting records for all ghosts.");
            }
        }
        // Load the player
        GameObject player = Instantiate(Resources.Load("Player")) as GameObject;
        player.transform.position = levelSpawns[levelIndex];
    }

    public static void SetPlayerIndex(int index)
    {
        PlayerController.RobotIndex = index;
    }



    // REMOVE LATER
    private void Update()
    {
        // Save ghost recording and start next ghost recording. Moved to GhostManager for actual game. This is just for testing.
        if (Input.GetKeyDown(KeyCode.R))
        {
            GhostManager.SetGhostData(PlayerController.RobotIndex, PlayerController.GetRecordedMovement());
            PlayerController.RobotIndex++;
            RestartLevelWithGhosts();
        }

        // Reload level like this
        if (Input.GetKeyDown(KeyCode.K))
        {
            RestartLevelWithGhosts();
        }
    }
}
