//
//  WebService.swift
//  CoffeeOrderingApp
//
//  Created by Yani Buchkov on 26.10.21.
//

import Foundation
import SwiftUI

typealias OrderCompletion = (([Order]?) -> ())
class WebService {
    
    func getAllOrders(completion: @escaping OrderCompletion) {
        guard let urlString = URL(string: "https://brash-spiffy-carp.glitch.me/orders") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: urlString) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    print("No Data Found!")
                    completion(nil)
                }
                return
            }
            
            let order = try? JSONDecoder().decode([Order].self, from: data)
            DispatchQueue.main.async {
                completion(order)
            }
        }.resume()
    }
    
    func createCoffeeOrder(order: Order, completion: @escaping(CreateOrderResponse?) -> ()) {
        guard let url = URL(string: "https://brash-spiffy-carp.glitch.me/orders") else {
            fatalError("Invalid URL!")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(order)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    print("!NO DATA ON POST REQUEST!")
                    completion(nil)
                }
                return
            }
            
            let response = try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
            DispatchQueue.main.async {
                completion(response)
            }
        }.resume()
    }
}
