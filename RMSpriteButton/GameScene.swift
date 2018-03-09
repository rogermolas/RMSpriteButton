//
//  GameScene.swift
//  RMSpriteButton
//
//  Created by Roger Molas on 6/4/17.
//  Copyright © 2017 Roger Molas. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    override func didMove(to view: SKView) {
        let button = RMSpriteButton(image: "button")
        button.size = CGSize(width: 200, height: 100)
        button.addTarget(self, selector:#selector(GameScene.call(_:)), object:self)
        button.position = CGPoint(x:self.frame.width / 2, y:self.frame.height / 2);
        self.addChild(button)
        
        let button2 = RMSpriteButton(title: "Demo", backgroundColor: UIColor.blue)
        button2.size = CGSize(width: 200, height: 100)
        button2.addTarget(self, selector:#selector(GameScene.call(_:)), object:self)
        button2.position = CGPoint(x:self.frame.width / 2, y:button.frame.origin.y + 200);
        self.addChild(button2)
    }
    
    func call(_ sender:AnyObject?) {
        print("Calling function \(sender!)")
    }
    
}
