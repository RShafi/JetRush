//
//  Goal.swift
//  JetRush
//
//  Created by Ramsey Shafi on 7/30/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Goal: CCNode {
    
    func didLoadFromCCB() {
        physicsBody.sensor = true
    }
   
}
