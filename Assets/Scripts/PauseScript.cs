using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PauseScript : MonoBehaviour

{
    public static bool gameIsPaused;
    public GameObject pausePanel;

    // Start is called before the first frame update
    void Start()
    {
        try
        {
            pausePanel = Resources.FindObjectsOfTypeAll<PauseScreen>()[0].gameObject;
        }
        catch
        {

        }
    }

    // Update is called once per frame
    void Update()
    {
        // TODO Set key to ESC before build
        if (pausePanel != null)
        {
            if (Input.GetKeyDown(KeyCode.P))
            {
                gameIsPaused = !gameIsPaused;
                PauseGame();
            }
        }
        else
        {
            try
            {
                pausePanel = Resources.FindObjectsOfTypeAll<PauseScreen>()[0].gameObject;
            }
            catch
            {

            }
        }
    }

    public void PauseGame()
    {
        if (gameIsPaused)
        {
            Time.timeScale = 0f;
            AudioListener.pause = true;
            pausePanel.SetActive(true);
        }
        else
        {
            print("Kewl");
            Time.timeScale = 1;
            AudioListener.pause = false;
            pausePanel.SetActive(false);
        }
    }
}
