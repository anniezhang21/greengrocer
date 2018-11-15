//
//  Food.swift
//  greengrocer
//
//  Created by Annie Zhang on 11/3/18.
//  Copyright © 2018 Annie Zhang. All rights reserved.
//

import Foundation
@objc class Food: NSObject {
    
    var category: String
    var name: String
    var quantity: Double
    var dateAdded: NSDate = NSDate.init() // Default value, should be overwritten at time of addition.
    var owner: String = ""
    var shared: Bool = false
    
    var marked: Bool = false
    
    init(category:String, name: String, quantity: Double) {
        self.category = category
        self.name = name
        self.quantity = quantity
    }
    
    func increment() {
        self.quantity += 1
    }
    
    func decrement() {
        self.quantity -= 1
    }
    
    func delete() {
        self.quantity = 0
    }
    
    func dictRepr() {
        return 
    }
}
