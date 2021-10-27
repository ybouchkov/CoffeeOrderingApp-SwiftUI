//
//  OrderListViewModel.swift
//  CoffeeOrderingApp
//
//  Created by Yani Buchkov on 26.10.21.
//

import Foundation

class OrderListViewModel: ObservableObject {
    
    @Published
    var orders: [OrderViewModel] = []
    
    init() {
        fetch()
    }
    
    func fetch() {
        WebService().getAllOrders { orders in
            if let orders = orders {
                self.orders = orders.map { OrderViewModel(order: $0) }
            }
        }
    }
}

class OrderViewModel {
    
    let id = UUID()
    
    private var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    var name: String {
        return self.order.name
    }
    
    var coffeeName: String {
        return self.order.coffeeName
    }
    
    var size: String {
        return self.order.size
    }
    
    var total: Double {
        return self.order.total
    }
}
