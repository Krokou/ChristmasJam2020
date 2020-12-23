using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MenuScreenButton : MonoBehaviour
{
    // Start is called before the first frame update
    
    public void CreditsTransition()
    {
        SceneManager.LoadScene(SceneManager.sceneCountInBuildSettings - 1);
    }

    public void StartLevels()
    {
        GameManager.levelIndex = 0;
        GameManager.LoadLevel(GameManager.levelIndex);
    }

    public void ExitGame()
    {
        Application.Quit();
    }
}
