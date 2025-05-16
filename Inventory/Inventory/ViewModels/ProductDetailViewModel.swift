//
//  Untitled.swift
//  Inventory
//
//  Created by user272495 on 5/8/25.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var quantity = ""
    @Published var errorMessage: String?
    
    func validate() -> Product? {
        guard !name.isEmpty else {
            errorMessage = "Name is empty"
            return nil
        }
        
        guard !quantity.isEmpty else {
            errorMessage = "Quantity is empty"
            return nil
        }
        
        guard let quantity = Int(quantity) else {
            errorMessage = "Invalid quantity"
            return nil
        }
        errorMessage = nil
        return Product(id: UUID(), name: name, quantity: quantity)
        
        
    
    }
}
