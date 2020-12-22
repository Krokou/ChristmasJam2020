using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GhostManager : MonoBehaviour
{
    // levelData[Level][Ghost] contains the record for the specific ghost.
    public static List<List<GhostData>> levelData = new List<List<GhostData>>();

    public static List<Color> timeLineButtonColors = new List<Color>();

    // TODO: Setting the color variations for buttons. Could be used for player shaders as well, ask Vegard.
    private void Start()
    {
        timeLineButtonColors.Add(Color.red);
        timeLineButtonColors.Add(Color.green);
        timeLineButtonColors.Add(Color.blue);
        timeLineButtonColors.Add(Color.white);
        timeLineButtonColors.Add(Color.gray);
        timeLineButtonColors.Add(Color.black);
    }

    public class GhostData
    {
        public List<List<KeyCode>> record = new List<List<KeyCode>>();

        // Sets the record to a new one. newRecord[Frame] contains all movement inputs.
        public void SetRecord(List<List<KeyCode>> newRecord)
        {
            record = newRecord;
        }

        // Edits a record from starting frame, keeping the previous part.
        public void EditRecord(int startingFrame, List<List<KeyCode>> newRecord)
        {
            record.RemoveRange(startingFrame, record.Count - startingFrame);
            record.AddRange(newRecord);
        }

        // Clears record

        public void ClearRecord()
        {
            record = new List<List<KeyCode>>();
        }
    }

    // Adds a level index to levelData, and puts X many ghosts in it.
    public static void AddLevel(int ghostCount)
    {
        levelData.Add(new List<GhostData>());

        for (int i = 0; i < ghostCount; i++)
		{
            levelData[levelData.Count - 1].Add(new GhostData());
        }
    }

    // Sets the recorded data on the right ghost. levelData[level][ghost] -> data
    public static void SetGhostData(int ghostIndex, List<List<KeyCode>> data)
    {
        levelData[GameManager.levelIndex][PlayerController.RobotIndex].SetRecord(data);
        PlayerController.RestartGhostRecord();
    }

    // Edits the recorded data on the right ghost. levelData[level][ghost] -> data[frame].
    public static void EditGhostData(int levelIndex, int ghostIndex, int startingFrame, List<List<KeyCode>> data)
    {
        levelData[levelIndex][ghostIndex].EditRecord(startingFrame, data);
    }

    // Returns the specified ghost movement record.
    public static List<List<KeyCode>> GetGhostData(int levelIndex, int ghostIndex)
    {
        return levelData[levelIndex][ghostIndex].record;
    }

    // Wipes all ghost records for a level
    public static void ClearGhostData(int levelIndex)
    {
        foreach (var ghost in levelData[levelIndex])
        {
            ghost.ClearRecord();
        }
    }

    // Wipes all ghost records for all levels
    public static void ClearGhostData()
    {
        foreach (var level in levelData)
        {
            foreach (var ghost in level)
            {
                ghost.ClearRecord();
            }
        }
    }

}
