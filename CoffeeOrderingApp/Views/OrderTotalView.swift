//
//  OrderTotalView.swift
//  CoffeeOrderingApp
//
//  Created by Yani Buchkov on 27.10.21.
//

import SwiftUI

struct OrderTotalView: View {
    
    let total: Double
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(String(format: "Total: $%.2f", self.total))
                .font(.title2)
                .foregroundColor(Color.green)
            Spacer()
        }
        .padding(10)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 45.64)
    }
}
