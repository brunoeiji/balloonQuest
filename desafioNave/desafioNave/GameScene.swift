//
//  GameScene.swift
//  desafioNave
//
//  Created by vntlab on 7/12/16.
//  Copyright (c) 2016 vntlab. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let backgroundNode = SKSpriteNode(imageNamed: "background")
    
    let playerNode = SKSpriteNode(imageNamed: "player")
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        self.setupBackground()
        
        self.setupInitialPlayerPosition()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */

        for touch in touches {
            
            print("shoot")
            
            let location = touch.locationInView(self.view)
            
            let projectile = SKSpriteNode(imageNamed: "projectile")
            
            projectile.position = self.playerNode.position
            self.addChild(projectile)
            projectile.runAction(goToPosition(location, duration: 0.6), completion: { () -> Void in
                
                print("remove")
                projectile.removeFromParent()
                
                
            })
            
            
            
        }
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        addMonster()
    }

    
    func addMonster(){
        
        
        let monster = SKSpriteNode(imageNamed: "monster")
        monster.size = CGSizeMake(playerNode.size.width/2, playerNode.size.height/2)
        
        let minY = monster.size.height/2
        let maxY = 730 - monster.size.height/2
        let rangeY = maxY - minY
        let actualY = (arc4random_uniform(UInt32(rangeY))) + UInt32(minY)
        
        
        monster.position = CGPointMake(self.frame.size.width + monster.size.width/2, CGFloat(actualY))
        monster.physicsBody?.dynamic = true
        monster.physicsBody?.allowsRotation = false
        monster.physicsBody?.affectedByGravity = false
        self.addChild(monster)
        
        let minDuration = 4.0
        let maxDuration = 7.0
        let rangeDuration = maxDuration - minDuration
        let actualDuration = (arc4random_uniform(UInt32(rangeDuration))) + UInt32(minDuration)
        
        let locationToMove = CGPointMake(-monster.size.width/2, CGFloat(actualY))
        let move = SKAction.moveTo(locationToMove, duration: Double(actualDuration))
        let moveDone = SKAction.removeFromParent()
        monster.runAction(SKAction.sequence([move, moveDone]))
        
        
//        let minX = self.frame.minX
//        
//        let minY = self.frame.minY + monster.size.height/2
//        
//        let maxX = self.frame.maxX
//        
//        let maxY = self.frame.maxY - monster.size.height/2
//        
//        monster.position = CGPointMake(rand(minX, max: maxX), rand(minY,max: maxY))
//        
//        let finalPosition = CGPointMake(monster.position.x, 0)
//        
//        let action = SKAction.moveTo(finalPosition, duration: 0.7)
        
    }
    
    
    func rand(min:CGFloat, max: CGFloat) -> CGFloat{
        
        let rand = CGFloat(arc4random())
        
        let pos = CGFloat(arc4random_uniform(UInt32(max)))
        
        return CGFloat(rand*pos)
        
    }
    
    func setupBackground (){
    
        
        self.backgroundNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        
        self.backgroundNode.size = self.frame.size
        
        self.addChild(backgroundNode)
        //self.backgroundColor = UIColor.clearColor()
        
    }
    
    func setupInitialPlayerPosition(){
        
        self.playerNode.position = CGPointMake(CGRectGetMinX(self.frame) + 100, CGRectGetMidY(self.frame))
        
        self.addChild(playerNode)
        
    }
    
    func goToPosition(position:CGPoint ,duration: NSTimeInterval) -> SKAction {
        
        let action = SKAction.moveTo(position, duration: duration)
        
        let changeColor = SKAction.colorizeWithColor(UIColor.yellowColor(), colorBlendFactor: 0.7, duration: duration)
        
        let group = [action,changeColor]
        
        return SKAction.group(group)
        
    }
    
    func getTimeDuration(x: CGFloat, y: CGFloat){
        
        let finalPosition = CGPointMake(x, y)
        
        
    }
    

}
