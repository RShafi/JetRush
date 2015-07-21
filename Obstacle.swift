//
//  Obstacle.swift
//  JetRush
//
//  Created by Ramsey Shafi on 7/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Obstacle: CCNode {
    let obstacleMinimumPositionX : CGFloat = 128
    let obstacleMaximumPositionx: CGFloat = 440
    let obstacleDistance: CGFloat = 142
    weak var obstacle: CCSprite!
   
    
    func setupRandomPosition() {
        let randomPrecision : UInt32 = 100
        let random = CGFloat(arc4random_uniform(randomPrecision)) / CGFloat(randomPrecision)
        let range = obstacleMaximumPositionx - obstacleDistance - obstacleMinimumPositionX
        obstacle.position = ccp(obstacle.position.x, obstacleMinimumPositionX + (random * range))
    }
    
    func didLoadFromCCB() {
        obstacle.physicsBody.sensor = true
    }
}



