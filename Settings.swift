//
//  Settings.swift
//  JetRush
//
//  Created by Ramsey Shafi on 8/4/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Settings: CCNode {
   
    func tutOn() {}
    
    func tutOff() {}
    
    func soundOn() {}
    
    func soundOff() {}
    
    func back() {
        var scene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(scene)
    }
}
 