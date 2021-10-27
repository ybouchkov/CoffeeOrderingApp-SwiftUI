//
//  CoffeeViewModel.swift
//  CoffeeOrderingApp
//
//  Created by Yani Buchkov on 26.10.21.
//

import Foundation

class CoffeeListViewModel {
    
    var coffeeList: [CoffeeViewModel] = []
}

struct CoffeeViewModel {
    var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var name: String {
        return coffee.name
    }
    
    var imageURL: String {
        return coffee.imageUrl
    }
    
    var price: Double {
        return coffee.price
    }
}
