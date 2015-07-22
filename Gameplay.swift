//
//  Gameplay.swift
//  JetRush
//
//  Created by Ramsey Shafi on 7/14/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit


class Gameplay: CCNode, CCPhysicsCollisionDelegate {
    
    weak var character: CCSprite!
    weak var restartButton: CCButton!
    weak var gamePhysicsNode : CCPhysicsNode!
    weak var ground: CCSprite!
    weak var gameOver1: CCLabelTTF!
    weak var gameOver2: CCLabelTTF!
    weak var wallOne: CCSprite!
    weak var wallTwo: CCSprite!
    weak var obstacle1: CCSprite!
    weak var obstacle2: CCSprite!
    weak var bottom: CCSprite!
    var scrollSpeed : CGFloat = 60
    var sinceTouch: CCTime = 0
    var gameOver = false
    weak var obstaclesLayer : CCNode!
    let firstObstaclePosition : CGFloat = 280
    let distanceBetweenObstacles : CGFloat = 160
    var obstacles : [CCNode] = []
    var walls = [CCSprite]()
    weak var followNode: CCNode!

    
    func didLoadFromCCB() {
        gamePhysicsNode.collisionDelegate = self
        userInteractionEnabled = true
        character.physicsBody.collisionType = "character"
        obstacles.append(obstacle1)
        obstacles.append(obstacle2)
        walls.append(wallOne)
        walls.append(wallTwo)
     //   var rect = CGRectUnion(wallOne.boundingBox(), bottom.boundingBox())
      //  let follow = CCActionFollow(target: character, worldBoundary: rect)
     //   followNode.runAction(follow)
//        for i in 0...2 {
//            spawnNewObstacle()
//        }
    }
    
    func retry() {
        let gameplayScene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(gameplayScene)
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        var xTouch = touch.locationInWorld().x
        var screenHalf = CCDirector.sharedDirector().viewSize().width / 2
        if xTouch < screenHalf {
            left()
        }
        else {
            right()
        }
    }
    func tap() {
        self.animationManager.runAnimationsForSequenceNamed("Tap")
    }
    
    func right() {
        character.physicsBody.applyImpulse(ccp(100, 0))
        character.physicsBody.applyImpulse(ccp(-50,0))
    }

    func left() {
        character.physicsBody.applyImpulse(ccp(-100, 0))
    }
  
    override func update(delta: CCTime) {
        let velocityX = clampf(Float(character.physicsBody.velocity.x), -100, 100)
        character.physicsBody.velocity = ccp(CGFloat(velocityX), 0)
        sinceTouch += delta
      //  character.position = ccp(character.position.x , character.position.y + scrollSpeed * CGFloat(delta))
       // gamePhysicsNode.position = ccp(gamePhysicsNode.position.x , gamePhysicsNode.position.y - scrollSpeed * CGFloat(delta))
       obstaclesLayer.position = ccp(obstaclesLayer.position.x, obstaclesLayer.position.y - scrollSpeed * CGFloat(delta))
      //  var worldPosition = obstaclesLayer.convertToWorldSpace(obstacle1.position)
        
      //  if worldPosition.y < 0.0 {
          //  println("The position is negative")
         //    obstacle1.position = ccp(obstacle1.position.x, obstacle1.position.y + 700)
      //  }

//        var bg1Pos: CGPoint = wallOne.position
//        var bg2Pos: CGPoint = wallTwo.position
//        var diff = scrollSpeed * CGFloat(delta)
//        bg1Pos.x -= diff
//        bg2Pos.x -= diff
//        
//        // move scrolling background back by one screen width to achieve "endless" scrolling
//        if bg1Pos.x < -(wallOne.contentSize.width)
//        {
//            bg1Pos.x += wallOne.contentSize.width;
//            bg2Pos.x += wallTwo.contentSize.width;
//        }
//        
//        wallOne.position = bg1Pos
//        wallTwo.position = bg2Pos
        
//        
//        for wall in walls {
//            let wallWorldPosition = gamePhysicsNode.convertToWorldSpace(wall.position)
//            let wallScreenPosition = convertToNodeSpace(wallWorldPosition)
//            if wallScreenPosition.x <= (-wall.contentSize.width) {
//                wall.position = ccp(wall.position.x , wall.position.y + wall.contentSize.width * 2)
//            }
//        }
        
        for obstacle in obstacles.reverse() {
//            let obstacleWorldPosition = gamePhysicsNode.convertToWorldSpace(obstacle.position)
//            let obstacleScreenPosition = convertToNodeSpace(obstacleWorldPosition)
            
//            // obstacle moved past left side of screen?
//            if obstacleScreenPosition.x < (-obstacle.contentSize.width) {
//                obstacle.removeFromParent()
//                obstacles.removeAtIndex(find(obstacles, obstacle)!)
            
                // for each removed obstacle, add a new one
            obstacle.physicsBody.collisionType = "level"
        
            var worldPosition = obstaclesLayer.convertToWorldSpace(obstacle.position)
            
             if worldPosition.y < 0.0 {
                println("The position is negative")
                obstacle.position = ccp(obstacle.position.x, obstacle.position.y + 700)
                scrollSpeed+2
            }
        }
    
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, character: CCNode!, level: CCNode!) -> ObjCBool {
        triggerGameOver()
        return true
    }
    func triggerGameOver() {
        
        if gameOver == false {
            gameOver = true
            restartButton.visible = true
            gameOver1.visible = true
            gameOver2.visible = true
            scrollSpeed = 0
            let move = CCActionEaseBounceOut(action: CCActionMoveBy(duration: 0.2, position: ccp(0, 4)))
            let moveBack = CCActionEaseBounceOut(action: move.reverse())
            let shakeSequence = CCActionSequence(array: [move, moveBack])
            runAction(shakeSequence)
        }
    }
    
    func restart() {
        let scene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(scene)
    }

//    
//    func spawnNewObstacle() {
//        var prevObstaclePos = firstObstaclePosition
//        if obstacles.count > 0 {
//            prevObstaclePos = obstacles.last!.position.x
//        }
//        
//        // create and add a new obstacle
//        let obstacle = CCBReader.load("Obstacle") as! Obstacle
//        obstacle.position = ccp(prevObstaclePos + distanceBetweenObstacles, 100)
//        obstacle.setupRandomPosition()
//        obstaclesLayer.addChild(obstacle)
//        obstacles.append(obstacle)
//    }
    
}