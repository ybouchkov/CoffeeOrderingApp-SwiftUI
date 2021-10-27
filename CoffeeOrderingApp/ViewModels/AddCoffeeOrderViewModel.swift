//
//  AddCoffeeOrderViewModel.swift
//  CoffeeOrderingApp
//
//  Created by Yani Buchkov on 26.10.21.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
    
    private let webService: WebService
    var name: String = ""
    
    @Published
    var coffeeName: String = ""
    @Published
    var size: String = ""
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    init() {
        self.webService = WebService()
    }
    
    func placeOrder() {
        let order = Order(name: name, coffeeName: coffeeName, size: size, total: total)
        webService.createCoffeeOrder(order: order) { _ in }
    }
    
    private func calculateTotalPrice() -> Double {
        let coffeeViewModel = coffeeList.first { $0.name == coffeeName }
        if let coffeeViewModel = coffeeViewModel {
            return coffeeViewModel.price * priceForSize()
        } else {
            return 0.0
        }
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small": 2.0, "Medium": 3.0, "Large": 4.0]
        return prices[self.size] ?? 2.0
    }
}
