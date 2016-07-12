//
//  GameScene.swift
//  balloonQuest
//
//  Created by vntlab on 7/12/16.
//  Copyright (c) 2016 vntlab. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView){
        setPhysics()
        /* Setup your scene here */
        print(self.frame.origin)
        
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 45;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)
        
        let sprite = SKSpriteNode(imageNamed: "Spaceship")
        sprite.position = CGPoint(x: 332, y: CGRectGetMidY(self.frame))
        sprite.xScale = 0.2
        sprite.yScale = 0.2
        
        self.addChild(sprite)
    }

    func setPhysics(){
        self.physicsWorld.gravity = CGVectorMake(0, 2.5)
    }
        

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */

    
        
//        for touch in touches {
//            let location = touch.locationInNode(self)
//            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//            
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
//        }

    
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
