//
//  PersistanceController.swift
//  Inventory
//
//  Created by user272495 on 5/22/25.
//

import CoreData

class PersistanceController {
    
    static let shared = PersistanceController()
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "InventoryModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
    }
    
}
