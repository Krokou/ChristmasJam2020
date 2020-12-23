using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameManager : MonoBehaviour
{
    //public static bool startFinished = false;
    //public static bool startFinished2 = true;

    public static int levelIndex = 0;
    public static List<Vector3> levelSpawns = new List<Vector3>();

    private void Awake()
    {
        // Prepare levels here in GhostManager
        // Level 0
        GhostManager.AddLevel(4);
        levelSpawns.Add(new Vector3(0f, 0f, 0f));

        // Level 1
        GhostManager.AddLevel(2);
        levelSpawns.Add(new Vector3(0f, 0f, 0f));

        // Level 2
        GhostManager.AddLevel(3);
        levelSpawns.Add(new Vector3(0f, 0f, 0f));

        // Level 3
        GhostManager.AddLevel(2);
        levelSpawns.Add(new Vector3(0f, 0f, 0f));

        // Level 4
        GhostManager.AddLevel(2);
        levelSpawns.Add(new Vector3(0f, 0f, 0f));

        // Level 5
        GhostManager.AddLevel(4);
        levelSpawns.Add(new Vector3(0f, 0f, 0f));
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

    public static void RestartLevelWithGhosts()
    {
        // Reset level by loading scene again without resetting ghost progress
        

        // Remove player and ghosts
        

        // Spawn them in again
        // Load ghosts
        SceneManager.LoadScene(levelIndex + 1);
    }

    private void OnLevelWasLoaded(int level)
    {
        if (level == levelIndex + 1)
        {
            foreach (var ghost in GameObject.FindGameObjectsWithTag("Ghost"))
            {
                Destroy(ghost);
            }
            Destroy(GameObject.FindGameObjectWithTag("Player"));

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

            // Check if there are multiple players and delete all others
            GameObject[] tmpPlayers = GameObject.FindGameObjectsWithTag("Player");
            if(tmpPlayers.Length > 1)
            {
                foreach (var p in tmpPlayers)
                {
                    if (p != player)
                    {
                        Destroy(p);
                    }
                }
            }
        }
    }

    public static void SetPlayerIndex(int index)
    {
        PlayerController.RobotIndex = index;
    }



    // TODO REMOVE LATER
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

        if (Input.GetKeyDown(KeyCode.J))
        {
            if (levelIndex != 5)
            {
                levelIndex += 1;
                LoadLevel(levelIndex);
            }
            else
            {
                SceneManager.LoadScene(7);
            }
        }
    }
}
