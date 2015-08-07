//
//  Character.swift
//  JetRush
//
//  Created by Ramsey Shafi on 7/14/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Character: CCSprite {
    
    func explode() {
        self.animationManager.runAnimationsForSequenceNamed("Explode")
    }
    
}
