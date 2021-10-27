//
//  ContentView.swift
//  CoffeeOrderingApp
//
//  Created by Yani Buchkov on 26.10.21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject
    private var orderListViewModel = OrderListViewModel()
    
    @State
    private var showModel: Bool = false
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(displayP3Red: 165.0/255.0, green: 94.0/255.0, blue:  234.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
        OrderListView(orders:
                        orderListViewModel.orders)
                .navigationTitle("Coffee Orders")
                .sheet(isPresented: $showModel, content: {
                    AddCoffeeOrderView(isPresented: self.$showModel)
                })
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button(action: reloadOrders) {
                            Image(systemName: "arrow.clockwise")
                                .foregroundColor(.white)
                        }
                    }
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: addOrder) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                        }
                    }
                }
        }
     }
    
    private func reloadOrders() {
        self.orderListViewModel.fetch()
    }
    
    private func addOrder() {
        self.showModel = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
