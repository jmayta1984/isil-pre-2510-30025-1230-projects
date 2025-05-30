//
//  ProductListViewModel.swift
//  Inventory
//
//  Created by user272495 on 5/15/25.
//

import Foundation

class ProductListViewModel: ObservableObject {
    @Published private(set) var products = [Product]()
    private let productDao = ProductDao()
    
    init() {
        fetchProducts()
    }
    
    func addProduct(product: Product) {
        productDao.insertProduct(product: product)
        fetchProducts()
    }
    
    func deleteProduct(indexSet: IndexSet) {
        if let index = indexSet.first {
            productDao.deleteProduct(product: products[index])
            fetchProducts()
        }

    }
    
    func updateProduct(product: Product) {
        productDao.updateProduct(product: product)
        fetchProducts()
    }
    
    func fetchProducts (){
        products = productDao.fetchProducts()
    }
}
