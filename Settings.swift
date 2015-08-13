//
//  Settings.swift
//  JetFall
//
//  Created by Ramsey Shafi on 8/11/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Settings: CCNode {
    
    func soundOn() {
        Gameplay().music = true
        MainScene().music = true
    }
   
    func soundOff() {
        Gameplay().music = false
        MainScene().music = false
        OALSimpleAudio.sharedInstance().stopBg()
    }
    
    func back() {
        let quitScene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(quitScene, withTransition: CCTransition(fadeWithDuration: 0.3))
    }
   
    func tutOn() {
    }
    func tutOff() {
    }
}
