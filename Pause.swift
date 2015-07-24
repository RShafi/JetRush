//
//  Pause.swift
//  JetRush
//
//  Created by Ramsey Shafi on 7/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Pause: CCNode {
   
    weak var resumeButton: CCButton!
    weak var quitButton: CCButton!
    
    func quit() {
        let quitScene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(quitScene)
    }
    
    func resumeGame() {
        let gameplayScene = CCBReader.loadAsScene("GamePlay")
        CCDirector.sharedDirector().presentScene(gameplayScene)
    }
}
