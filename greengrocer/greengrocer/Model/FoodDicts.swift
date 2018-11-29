//
//  foodDicts.swift
//  greengrocer
//
//  Created by Annie Zhang on 11/3/18.
//  Copyright © 2018 Annie Zhang. All rights reserved.
//

import Foundation
import UIKit

class FoodDicts {
    
    // Temporary, delete default users when adding new users is implemented
    static let testUser1 = User(name:"Annie", passcode: 1234)
    static let testUser2 = User(name:"Jessica", passcode: 2345)
    static let testUser3 = User(name:"Edward", passcode: 3456)
    static let testUser4 = User(name:"Michelle", passcode: 4567)
    
    static let housemates: [User] = [testUser1, testUser2, testUser3, testUser4]
    
    static var currentUser: User = testUser1
    
    static let categoryDict: [Int:String] =
        [
            0: "Grains",
            1: "Vegetables",
            2: "Fruit",
            3: "Dairy",
            4: "Protein",
            5: "Condiments",
            6: "Snacks",
            7: "Other",
        ]
    
    static let categoryImageDict: [String:UIImage] =
        [
            "Grains": #imageLiteral(resourceName: "grains"),
            "Vegetables": #imageLiteral(resourceName: "vegetables"),
            "Fruit": #imageLiteral(resourceName: "fruit"),
            "Dairy": #imageLiteral(resourceName: "dairy"),
            "Protein": #imageLiteral(resourceName: "protein"),
            "Condiments": #imageLiteral(resourceName: "condiments"),
            "Snacks": #imageLiteral(resourceName: "junk"),
            "Other": UIImage(named: "fridge")!,
            ]
    
    static let imageDict: [Int:UIImage?] =
        [
            0: #imageLiteral(resourceName: "grains"),
            1: #imageLiteral(resourceName: "vegetables"),
            2: #imageLiteral(resourceName: "fruit"),
            3: #imageLiteral(resourceName: "dairy"),
            4: #imageLiteral(resourceName: "protein"),
            5: #imageLiteral(resourceName: "condiments"),
            6: #imageLiteral(resourceName: "junk"),
            7: nil,
            ]
    
    static var myFood: [Food] = []    
}
