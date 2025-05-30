//
//  ProductEntity+Extensions.swift
//  Inventory
//
//  Created by user272495 on 5/29/25.
//

import Foundation

extension ProductEntity {
    
    func fromDomain(product: Product) {
        self.id = product.id
        self.name = product.name
        self.quantitty = Int16(product.quantity)
    }
    
    func toDomain() -> Product {
        Product(id: self.id ?? UUID(), name: self.name ?? "", quantity: Int(self.quantitty))
    }
}
