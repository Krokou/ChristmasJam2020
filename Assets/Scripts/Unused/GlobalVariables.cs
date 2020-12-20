using UnityEngine;

[CreateAssetMenu(fileName = "Data", menuName = "ScriptableObjects/GlobalVariables", order = 1)]
public class GlobalVariables : ScriptableObject
{
    public static bool paused = false;
}
