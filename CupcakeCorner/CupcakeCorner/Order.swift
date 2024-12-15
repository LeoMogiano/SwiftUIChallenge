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
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zipCode = ""
    
    var hasValidAddress: Bool {
       return !streetAddress.isEmpty && !city.isEmpty && !zipCode.isEmpty
    }
    
    var cost: Decimal {
        
        // 2$ for cake
        var cost = Decimal(quantity)  * 2
        
        // complicated cake cost more
        cost += Decimal(type)  / 2
        
        // 1$/cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        // 0.50$ for extra sprinkles
        if addSprinkles {
            cost += Decimal(quantity) * 0.5
        }
        
        return cost
        
    }
    
}
