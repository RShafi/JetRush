//
//  MainScene.swift
//  JetRush
//
//  Created by Ramsey Shafi on 7/14/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class MainScene: CCNode {
    
    weak var aboutButton: CCButton!
    weak var settingsButton: CCButton!
    
    func play() {
        let gameplayScene = CCBReader.loadAsScene("Gameplay")
      //  CCDirector.sharedDirector().presentScene(gameplayScene)
        var transition = CCTransition(fadeWithDuration: 0.3)
        CCDirector.sharedDirector().presentScene(gameplayScene, withTransition: transition)
    }
   
    func about() {
        let scene = CCBReader.loadAsScene("About")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    func settings() {
        let scene = CCBReader.loadAsScene("Settings")
        CCDirector.sharedDirector().presentScene(scene)
    }

}
