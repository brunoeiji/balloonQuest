//
//  GameScene.swift
//  balloonQuest
//
//  Created by vntlab on 7/12/16.
//  Copyright (c) 2016 vntlab. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        print(self.frame.origin)
        
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 45;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)
        
        let sprite = SKSpriteNode(imageNamed: "Spaceship")
        
        let xPosition = CGRectGetMinX(self.frame) + 35
        
        sprite.position = CGPoint(x: xPosition, y: CGRectGetMidY(self.frame))
        sprite.xScale = 0.2
        sprite.yScale = 0.2
        //sprite.zRotation = -1.55
        
        self.addChild(sprite)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
