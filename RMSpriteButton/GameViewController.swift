//
//  GameViewController.swift
//  RMSpriteButton
//
//  Created by Roger Molas on 6/4/17.
//  Copyright © 2017 Roger Molas. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        let scene = GameScene();
        scene.size = skView.bounds.size
        scene.scaleMode = .aspectFill
        
        skView.presentScene(scene)
    }
}
