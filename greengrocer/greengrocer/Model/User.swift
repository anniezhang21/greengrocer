//
//  User.swift
//  greengrocer
//
//  Created by Annie Zhang on 11/28/18.
//  Copyright © 2018 Annie Zhang. All rights reserved.
//

import Foundation
class User {
    var name: String
    var passcode: Int
    
    init(name: String, passcode: Int) {
        self.name = name
        self.passcode = passcode
    }
}
