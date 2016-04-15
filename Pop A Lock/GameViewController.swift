//
//  GameViewController.swift
//  Pop A Lock
//
//  Created by Alex Retter on 3/17/16
//  Copyright © 2016 Re.Group Apps. All rights reserved.
//


import UIKit
import SpriteKit

class GameViewController: UIViewController,GameDelegate {
    
    var continueMode: Bool?
    
    var newImage: UIImage?
    
    @IBOutlet var shareButton: UIButton!
    
    @IBAction func shareButtonHandler(sender: AnyObject) {
        if let image = newImage {
            share(image)
        }
    }
    
    @IBAction func menuButtonHandler(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        shareButton.hidden = true

        let scene = GameScene(size: view.bounds.size)
        // Configure the view.
        let skView = self.view as! SKView
        //skView.showsFPS = true
        //skView.showsNodeCount = true
            
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
            
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        
        if let continueIsTrue = continueMode {
            scene.continueMode = continueIsTrue
        }
        
        scene.gameDelegate = self
            
        skView.presentScene(scene)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    func gameStarted() {
        shareButton.hidden = true
    }
    
    func gameFinished() {
        snapPic()
        shareButton.hidden = false
    }
    
    func share(image: UIImage) {
        let avc = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        presentViewController(avc, animated: true, completion: nil)
    }
    
    func snapPic() {
        UIGraphicsBeginImageContextWithOptions(self.view.frame.size, false, 1.0)
        self.view.drawViewHierarchyInRect(CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height), afterScreenUpdates: false)
        newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        
        
        
        
    }

}
