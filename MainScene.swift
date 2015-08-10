//
//  MainScene.swift
//  JetRush
//
//  Created by Ramsey Shafi on 7/14/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
import Mixpanel

class MainScene: CCNode {
    
    weak var aboutButton: CCButton!
    weak var settingsButton: CCButton!
    weak var playButton: CCButton!
    var mixpanel = Mixpanel.sharedInstance()
    
    func play() {
        playButton.visible = false
        let gameplayScene = CCBReader.loadAsScene("Gameplay")
      //  CCDirector.sharedDirector().presentScene(gameplayScene)
        var transition = CCTransition(fadeWithDuration: 0.3)
        CCDirector.sharedDirector().presentScene(gameplayScene, withTransition: transition)
        mixpanel.track("Game Started", properties: ["Button": "Play Button"])
    }
   
    func about() {
        let scene = CCBReader.loadAsScene("About")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    func settings() {
        let scene = CCBReader.loadAsScene("Settings")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    // Preload...
//    [[OALSimpleAudio sharedInstance] preloadBg:@"Battle_-_War_and_Conquest.m4a"];
    func playMusic() {
        let audio = OALSimpleAudio.sharedInstance().preloadBg("Battle_-_War_and_Conquest.m4a")
    // Play (and loop the music)...
  //  [[OALSimpleAudio sharedInstance] playBgWithLoop:YES];
        OALSimpleAudio.sharedInstance().playBgWithLoop(audio)
    }
    func stopMusic() {
        OALSimpleAudio.sharedInstance().stopBg()
    }
    
}
