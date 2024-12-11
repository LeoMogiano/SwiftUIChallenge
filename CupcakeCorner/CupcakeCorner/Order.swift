//
//  Order.swift
//  CupcakeCorner
//
//  Created by Leo Mogiano on 11/12/24.
//

import Foundation


@Observable
class Order {
    static let types = ["Vanilla", "Chocolate", "Strawberry", "Blueberry"]
    
    var type = 0
    var quantity = 3
    
    var speciaRequest = false {
        didSet {
            extraFrosting = false
            addSprinkles = false
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    
}

