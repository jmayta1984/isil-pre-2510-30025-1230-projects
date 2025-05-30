//
//  ProductDao.swift
//  Inventory
//
//  Created by user272495 on 5/29/25.
//

import CoreData

class ProductDao {
    private let context = PersistanceController.shared.container.viewContext
    
    func insertProduct(product: Product) {
        let productEntity = ProductEntity(context: context)
        productEntity.fromDomain(product: product)
        saveContext()
    }
    
    func deleteProduct(product: Product) {
        let request: NSFetchRequest<ProductEntity>
        request = ProductEntity.fetchRequest()
        request.predicate = NSPredicate(format: " id = %@", product.id as CVarArg)
        
        do {
            if let entity = try context.fetch(request).first  {
                context.delete(entity)
                saveContext()
            }
            
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func updateProduct(product: Product){
        let request: NSFetchRequest<ProductEntity>
        request = ProductEntity.fetchRequest()
        request.predicate = NSPredicate(format: " id = %@", product.id as CVarArg)
        
        do {
            if let entity = try context.fetch(request).first  {
                entity.fromDomain(product: product)
                saveContext()
            }
            
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchProducts() -> [Product] {
        let request: NSFetchRequest<ProductEntity>
        request = ProductEntity.fetchRequest()
        
        do {
           return try context.fetch(request).map { $0.toDomain() }
            
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    
    private func saveContext(){
        if context.hasChanges {
            do {
               try context.save()
            } catch let error {
                fatalError(error.localizedDescription)
            }
        }
    }
}
