//
//  UserState.swift
//  JetRush
//
//  Created by Ramsey Shafi on 7/29/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class UserState: NSUserDefaults {
    
    var pauseState: Bool = NSUserDefaults.standardUserDefaults().boolForKey("paused") ?? false {
        didSet {
            NSUserDefaults.standardUserDefaults().setBool(pauseState, forKey: "pause")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
   
}
