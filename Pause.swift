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
    var transition = CCTransition(fadeWithDuration: 0.3)
   
    func quit() {
        let quitScene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(quitScene, withTransition: transition)
        CCDirector.sharedDirector().resume()
    }
    
    func resumeGame() {
        let gameplayScene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().resume()
    }
}
