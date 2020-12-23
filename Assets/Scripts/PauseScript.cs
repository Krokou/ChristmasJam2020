using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

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
        try
        {
            pausePanel = Resources.FindObjectsOfTypeAll<PauseScreen>()[0].gameObject;
        }
        catch
        {

        }
        if (pausePanel != null)
        {
            // TODO Set key to ESC before build
            // Pause game when inside of game, and unpause if on pause screen.
            if (SceneManager.GetActiveScene().buildIndex == GameManager.levelIndex + 1) {
                if (Input.GetKeyDown(KeyCode.P) || Input.GetKeyDown(KeyCode.Escape) || GameObject.FindGameObjectWithTag("Player").GetComponent<PlayerController>().dead)
                {
                    GameObject.FindGameObjectWithTag("Player").GetComponent<PlayerController>().dead = false;
                    // Logic for when to pause and unpause game with pause panel
                    if (!gameIsPaused)
                    {
                        PauseGame();
                        EnablePausePanel();
                    }
                    else if (pausePanel.activeSelf)
                    {
                        UnpauseGame();
                        DisablePausePanel();
                    }
                }
            }
        }
        
        
    }

    public void PauseGame()
    {
        gameIsPaused = true;
        Time.timeScale = 0f;
        AudioListener.pause = true;
    }

    public void UnpauseGame()
    {
        gameIsPaused = false;
        Time.timeScale = 1f;
        AudioListener.pause = false;
    }

    public void EnablePausePanel()
    {
        pausePanel.SetActive(true);
    }

    public void DisablePausePanel()
    {
        pausePanel.SetActive(false);
    }
}
