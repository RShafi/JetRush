//
//  Gameplay.swift
//  JetRush
//
//  Created by Ramsey Shafi on 7/14/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit
import CoreMotion


class Gameplay: CCNode, CCPhysicsCollisionDelegate {
    
    weak var character: CCSprite!
    weak var restartButton: CCButton!
    weak var pauseButton: CCButton!
    weak var gamePhysicsNode : CCPhysicsNode!
    weak var ground: CCSprite!
    weak var gameOver1: CCLabelTTF!
    weak var gameOver2: CCLabelTTF!
    weak var wallOne: CCSprite!
    weak var wallTwo: CCSprite!
    weak var obstacle1: CCSprite!
    weak var obstacle2: CCSprite!
    weak var obstacle3: CCSprite!
    weak var obstacle4: CCSprite!
    weak var obstacle5: CCSprite!
    weak var obstacle6: CCSprite!
    weak var obstacle7: CCSprite!
    weak var obstacle8: CCSprite!
    weak var bottom: CCSprite!
    weak var scoreLabel: CCLabelTTF!
    weak var obstaclesLayer : CCNode!
    weak var followNode: CCNode!
    var scrollSpeed : CGFloat = 60
    var sinceTouch: CCTime = 0
    var gameOver = false
    var motion: CMMotionManager! = CMMotionManager()
    var obstacles : [CCNode] = []
    var walls = [CCSprite]()
    let firstObstaclePosition : CGFloat = 280
    let distanceBetweenObstacles : CGFloat = 160
    let randomNumber = arc4random_uniform(350)
    var score : Int = 0 {
        didSet {
            scoreLabel.string = "\(score)"
            gameOver2.string = "\(score)"
        }
    }
//    var gameOverScore : Int = 0 {
//        didSet {
//            gameOver2.string = "\(gameOverScore)"
//        }
//    }
    

    
    func didLoadFromCCB() {
        gamePhysicsNode.collisionDelegate = self
        userInteractionEnabled = true
        character.physicsBody.collisionType = "character"
        obstacles.append(obstacle1)
        obstacles.append(obstacle2)
        obstacles.append(obstacle3)
        obstacles.append(obstacle4)
        obstacles.append(obstacle5)
        obstacles.append(obstacle6)
        obstacles.append(obstacle7)
        obstacles.append(obstacle8)
        walls.append(wallOne)
        walls.append(wallTwo)
     //   var rect = CGRectUnion(wallOne.boundingBox(), bottom.boundingBox())
      //  let follow = CCActionFollow(target: character, worldBoundary: rect)
     //   followNode.runAction(follow)
//        for i in 0...2 {
//            spawnNewObstacle()
//        }
  
//        motion.accelerometerUpdateInterval = 0.2
//        motion.gyroUpdateInterval = 0.2
//        motion.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler: { (accelerometerData: CMAccelerometerData!, error: NSError!) -> Void in
//            self.outputAccelerationData(accelerometerData.acceleration)
//            if error != nil {
//                println("\(error)")
//            }
//        })
//        
//        
//        motion.startGyroUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler: { (gyroData: CMGyroData!, error: NSError!) -> Void in
//            self.outputRotationData(gyroData.rotationRate)
//            if error != nil {
//                println("\(error)")
//            }
//        })
    }
    
    func retry() {
        let gameplayScene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(gameplayScene)
    }
    func pauseGame() {
        let pauseScene = CCBReader.loadAsScene("Pause")
        CCDirector.sharedDirector().pause()
        CCDirector.sharedDirector().presentScene(pauseScene)
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        var xTouch = touch.locationInWorld().x
        var screenHalf = CCDirector.sharedDirector().viewSize().width / 2
        if gameOver == false {
            if xTouch < screenHalf {
                left()
            }
            else {
                right()
            }
        }
    }
//    func tap() {
//        self.animationManager.runAnimationsForSequenceNamed("Tap")
//    }
    
    
    
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

        if gameOver == false {
            if let accelerometerData: CMAccelerometerData = motion.accelerometerData {
                let acceleration: CMAcceleration = accelerometerData.acceleration
                let accelFloat: CGFloat = CGFloat(acceleration.y)
                var newXPos: CGFloat = character.physicsBody.velocity.x + accelFloat * 400.0 * CGFloat(delta)
                character.physicsBody.velocity.x = newXPos
                
            }
        }
         obstaclesLayer.position = ccp(obstaclesLayer.position.x, obstaclesLayer.position.y - scrollSpeed * CGFloat(delta))
        
      //  character.position = ccp(character.position.x , character.position.y + scrollSpeed * CGFloat(delta))
       // gamePhysicsNode.position = ccp(gamePhysicsNode.position.x , gamePhysicsNode.position.y - scrollSpeed * CGFloat(delta))
      
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
        
            var worldPosition = obstaclesLayer.convertToWorldSpace(obstacle.position)
            
             if worldPosition.y < 0.0 {
                println("The position is negative")
                obstacle.position = ccp(obstacle.position.x, obstacle.position.y + 700)
                scrollSpeed = scrollSpeed + 2
                score++
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
            scoreLabel.visible = false
            pauseButton.visible = false
            character.physicsBody.velocity.x = 0
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
//      // create and add a new obstacle
//        let blockage = CCBReader.load("Obstacle") as! Obstacle
//       blockage.position = ccp(prevObstaclePos + distanceBetweenObstacles, 100)
//        blockage.setupRandomPosition()
//       obstaclesLayer.addChild(blockage)
//       obstacles.append(blockage)
//   }
    
}