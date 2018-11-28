//
//  Food.swift
//  greengrocer
//
//  Created by Annie Zhang on 11/3/18.
//  Copyright © 2018 Annie Zhang. All rights reserved.
//

import Foundation
class Food {
    
    var category: String
    var name: String
    
    var quantity: Double
    var price: Double
    
    var dateAdded: Date = Date.init() // Default value, should be overwritten at time of addition.
    
    var shared: Bool = false
    var marked: Bool = false
    
    init(category:String, name: String, quantity: Double, price: Double) {
        self.category = category
        self.name = name
        self.quantity = quantity
        self.price = price
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
    
    // For firebase storage (data persistence)
    func dictRepr() {
        
    }
}
