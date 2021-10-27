//
//  OrderListView.swift
//  CoffeeOrderingApp
//
//  Created by Yani Buchkov on 26.10.21.
//

import SwiftUI

struct OrderListView: View {
    
    var orders: [OrderViewModel] // only for displaying the orders
    
    init(orders: [OrderViewModel]) {
        self.orders = orders
    }
    
    var body: some View {
        List {
            ForEach(self.orders, id: \.id) { order in
                HStack {
                    Image(order.coffeeName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(16)
                    VStack {
                        Text(order.name)
                            .font(.title)
                            .padding([.leading, .bottom], 10)
                        HStack {
                            Text(order.coffeeName)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                .background(Color.gray)
                                .foregroundColor(Color.white)
                                .cornerRadius(10.0)
                            Text(order.size)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(10.0)

                        }
                    }
                }
                
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orders: [OrderViewModel(order: Order(name: "Mary", coffeeName: "Regular", size: "Medium", total: 3.0))])
    }
}
