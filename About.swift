//
//  About.swift
//  JetRush
//
//  Created by Ramsey Shafi on 7/30/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class About: CCNode {
   
    weak var backButton: CCButton!
    
    func back() {
        let home = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(home)
    }
}
