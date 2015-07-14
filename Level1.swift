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
        if (gameOver == false) {
            character.physicsBody.applyImpulse(ccp(50, 0))
            sinceTouch = 0
        }
    }
    

   
}
