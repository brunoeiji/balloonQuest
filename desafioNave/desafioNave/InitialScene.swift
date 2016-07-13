//
//  InitialScene.swift
//  desafioNave
//
//  Created by vntlab on 7/12/16.
//  Copyright © 2016 vntlab. All rights reserved.
//

import SpriteKit

class InitialScene: SKScene {
    
    let startButton = SKLabelNode()
    
    override func didMoveToView(view: SKView) {
        
        startButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        
        self.startButton.fontName = "Verdana"
        self.startButton.fontSize = 2000
        self.startButton.text = "Embarque nessa grande jornada!"
        self.startButton.fontColor = UIColor.orangeColor()
        
        self.addChild(self.startButton)
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches{
            
            let location = touch.locationInNode(self)
            
            if self.startButton.containsPoint(location){
                
                let transition = SKTransition.fadeWithColor(UIColor.blackColor(), duration: 0.7)
                let nextScene = GameScene(fileNamed: "GameScene")
                
                self.view?.presentScene(nextScene!, transition: transition)
                
            }
            
        }
        
    }

    
    
    
}





