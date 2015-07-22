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
    weak var gamePhysicsNode : CCPhysicsNode!
    weak var ground: CCSprite!
    weak var wallOne: CCSprite!
    weak var wallTwo: CCSprite!
    weak var bottom: CCSprite!
    var scrollSpeed : CGFloat = 80
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
        walls.append(wallOne)
        walls.append(wallTwo)
        var rect = CGRectUnion(wallOne.boundingBox(), bottom.boundingBox())
        let follow = CCActionFollow(target: character, worldBoundary: rect)
        followNode.runAction(follow)
        for i in 0...2 {
            spawnNewObstacle()
        }
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
        for wall in walls {
            let wallWorldPosition = gamePhysicsNode.convertToWorldSpace(wall.position)
            let wallScreenPosition = convertToNodeSpace(wallWorldPosition)
            if wallScreenPosition.x <= (-wall.contentSize.width) {
                wall.position = ccp(wall.position.x , wall.position.y + wall.contentSize.width * 2)
            }
        }
    
    }
    
        func spawnNewObstacle() {
            var prevObstaclePos = firstObstaclePosition
            if obstacles.count > 0 {
                prevObstaclePos = obstacles.last!.position.x
            }
            
            // create and add a new obstacle
            let obstacle = CCBReader.load("Obstacle") as! Obstacle
            obstacle.position = ccp(prevObstaclePos + distanceBetweenObstacles, 100)
            obstacle.setupRandomPosition()
            obstaclesLayer.addChild(obstacle)
            obstacles.append(obstacle)
      }
    
}