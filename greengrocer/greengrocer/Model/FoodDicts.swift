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
