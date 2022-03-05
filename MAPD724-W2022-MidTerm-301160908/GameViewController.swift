//
//  ViewController.swift
//  MAPD724-W2022-MidTerm-301160908

/*
 *Program Name: MailPilot
 *Date Last Modified: 04/03/2022
 *Description: A simple ios game using the Swift Programming Language, SpriteKit and Xcode.
 *Revision History: Changed orientation of Game scene.
 *Author: Justice Ekeke
 *Student ID: 301160908
 *Date: 05/03/2022.
*/

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController, GameManager
{
    
    // Button Outlets
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var EndButton: UIButton!
    
    // Label Outlets
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var LivesLabel: UILabel!
    @IBOutlet weak var StartLabel: UILabel!
    @IBOutlet weak var EndLabel: UILabel!
    
    var currentScene: SKScene?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
               
        // Initialize the Lives and Score
        LivesLabel.isHidden = true
        ScoreLabel.isHidden = true
        EndLabel.isHidden = true
        EndButton.isHidden = true
        
        CollisionManager.gameViewController = self
        
        SetScene(sceneName: "StartScene")
        
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateScoreLabel() -> Void
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func updateLivesLabel() -> Void
    {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    func SetScene(sceneName: String) -> Void
    {
        if let view = self.view as! SKView?
        {
            
            // Load the SKScene - store a reference in currentScene
            currentScene = SKScene(fileNamed: sceneName)
            
            if let gameScene = currentScene as? GameScene
            {
                gameScene.gameManager = self
            }
            
            // Set the scale mode to scale to fit the window
            currentScene?.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(currentScene)
            
            view.ignoresSiblingOrder = true
        }
    }
    
    func PresentStartScene()
    {
        StartButton.isHidden = false
        StartLabel.isHidden = false
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
    }
    
    func PresentEndScene()
    {
        EndButton.isHidden = false
        EndLabel.isHidden = false
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        SetScene(sceneName: "EndScene")
    }
    
    
    @IBAction func StartButton_Pressed(_ sender: UIButton)
    {
        StartButton.isHidden = true
        StartLabel.isHidden = true
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        SetScene(sceneName: "GameScene")
    }
    
    @IBAction func EndButton_Pressed(_ sender: UIButton)
    {
        EndButton.isHidden = true
        EndLabel.isHidden = true
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        SetScene(sceneName: "GameScene")
        
    }
}
