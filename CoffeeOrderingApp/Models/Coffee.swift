//
//  Coffee.swift
//  CoffeeOrderingApp
//
//  Created by Yani Buchkov on 26.10.21.
//

import Foundation

struct Coffee {
    let name: String
    let imageUrl: String
    let price: Double
}

extension Coffee {
    static func all() -> [Coffee] {
        return [
            Coffee(name: "Cappuccino", imageUrl: "Cappuccino", price: 2.5),
            Coffee(name: "Espresso", imageUrl: "Espresso", price: 2.1),
            Coffee(name: "Regular", imageUrl: "Regular", price: 1.0)
        ]
    }
}
