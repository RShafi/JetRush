//
//  Level1.swift
//  JetRush
//
//  Created by Ramsey Shafi on 7/14/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit


class Level1: CCNode, CCPhysicsCollisionDelegate {
    
    weak var winTile: CCSprite!
    weak var character: CCSprite!
    weak var gamePhysicsNode : CCPhysicsNode!
    weak var ground: CCSprite!
    var scrollSpeed : CGFloat = 80
    var sinceTouch: CCTime = 0
    var gameOver = false
    
    func didLoadFromCCB() {
        gamePhysicsNode.collisionDelegate = self
        userInteractionEnabled = true
    }
    
    func retry() {
        let gameplayScene = CCBReader.loadAsScene("Level1")
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
        let velocityX = clampf(Float(character.physicsBody.velocity.x), -Float(CGFloat.max), 100)
        character.physicsBody.velocity = ccp(CGFloat(velocityX), 0)
    }
}
