//
//  AddCoffeeOrderView.swift
//  CoffeeOrderingApp
//
//  Created by Yani Buchkov on 26.10.21.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @ObservedObject
    private var addCoffeeOrderViewModel = AddCoffeeOrderViewModel()
    
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            
            VStack {
                Form {
                    Section {
                        TextField("Enter name", text: $addCoffeeOrderViewModel.name)
                    } header: {
                        Text("Information").font(.body)
                    }
                    
                    Section {
                        ForEach(addCoffeeOrderViewModel.coffeeList, id: \.name) { coffee in
                            CoffeeCellView(coffee: coffee, selection: self.$addCoffeeOrderViewModel.coffeeName)
                        }
                    } header: {
                        Text("Select coffee").font(.body)
                    }
                    
                    Section {
                        Picker("", selection: $addCoffeeOrderViewModel.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        Text("Select size").font(.body)
                    } footer: {
                        HStack {
                            OrderTotalView(total: self.addCoffeeOrderViewModel.total)
                        }
                    }
                }
                HStack {
                    Button("Place order") {
                        self.addCoffeeOrderViewModel.placeOrder()
                        self.isPresented = false
                    }
                    .padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                    .foregroundColor(Color.white)
                    .background(Color.init(red: 46/255, green: 204/255, blue: 113/255))
                    .cornerRadius(16)
                }
            }
            .navigationTitle("Add Order")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
    }
}

struct CoffeeCellView: View {
    
    let coffee: CoffeeViewModel
    @Binding var selection: String
    
    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            Text(coffee.name)
                .font(.title2)
                .padding([.leading], 20)
            Spacer()
            Image(systemName: self.selection == coffee.name ? "checkmark" : "")
                .padding()
        }.onTapGesture {
            self.selection = self.coffee.name
        }
    }
}
