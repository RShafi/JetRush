//
//  Pause.swift
//  JetRush
//
//  Created by Ramsey Shafi on 7/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit
import Mixpanel

class Pause: CCNode {
   
    weak var resumeButton: CCButton!
    weak var quitButton: CCButton!
    var transition = CCTransition(fadeWithDuration: 0.3)
    var mixpanel = Mixpanel.sharedInstance()
   
    func quit() {
        let quitScene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(quitScene, withTransition: transition)
        CCDirector.sharedDirector().resume()
        mixpanel.track("Game Exited", properties: ["Button": "Pause Exit"])
    }
    
    func resumeGame() {
        CCDirector.sharedDirector().resume()
        let audio = OALSimpleAudio.sharedInstance().preloadBg("Battle - Armies Advance.mp3")
        OALSimpleAudio.sharedInstance().playBgWithLoop(audio)
        self.visible = false
    }
}
