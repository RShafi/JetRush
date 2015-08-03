//
//  Monster.swift
//  JetRush
//
//  Created by Ramsey Shafi on 8/3/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Monster: CCSprite {
   
    weak var monster: CCSprite!
    
    func didLoadFromCCB() {
        monster.physicsBody.sensor = true
    }
}
