//
//  ProductListViewModel.swift
//  Inventory
//
//  Created by user272495 on 5/15/25.
//

import Foundation

class ProductListViewModel: ObservableObject {
    @Published private(set) var products = [Product]()
    
    func addProduct(product: Product) {
        products.append(product)
    }
    
    func deleteProduct(indexSet: IndexSet) {
        products.remove(atOffsets: indexSet)
    }
    
    func updateProduct(product: Product) {
       products = products.map { $0.id == product.id ? product : $0 }
    }
}
