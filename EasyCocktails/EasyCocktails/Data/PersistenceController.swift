//
//  PersistenceController.swift
//  EasyCocktails
//
//  Created by user272495 on 6/26/25.
//

import CoreData

class PersistenceController {
    
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "EasyCocktailsModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
    }
}
