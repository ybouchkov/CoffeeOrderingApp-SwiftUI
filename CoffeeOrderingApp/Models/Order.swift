//
//  Order.swift
//  CoffeeOrderingApp
//
//  Created by Yani Buchkov on 26.10.21.
//

import Foundation

struct Order: Codable {
    
    let name: String
    let coffeeName: String
    let size: String
    let total: Double
}


