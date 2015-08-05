//
//  UserState.swift
//  JetRush
//
//  Created by Ramsey Shafi on 8/4/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class UserState: NSUserDefaults {
   
    var highScore: Int = NSUserDefaults.standardUserDefaults().integerForKey("highscore") ?? 0 {
        didSet {
            NSUserDefaults.standardUserDefaults().setInteger(highScore, forKey:"highscore")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
}
