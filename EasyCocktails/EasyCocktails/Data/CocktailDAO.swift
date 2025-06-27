//
//  CocktailDAO.swift
//  EasyCocktails
//
//  Created by user272495 on 6/26/25.
//

import CoreData

class CocktailDAO {
    let context = PersistenceController.shared.container.viewContext
    
    func insertCocktail(cocktail: Cocktail) {
        let entity = CocktailEntity(context: context)
        entity.id = cocktail.id
        entity.name = cocktail.name
        entity.category = cocktail.category
        entity.instructions = cocktail.instructions
        entity.image = cocktail.image
        saveContext()
    }
    
    func deleteCocktail(id: String) {
        let request: NSFetchRequest<CocktailEntity>
        request = CocktailEntity.fetchRequest()
        
        request.predicate = NSPredicate(format: "id = %@", argumentArray: [id])
        
        do {
            let entities = try context.fetch(request)
            if let entity = entities.first {
                context.delete(entity)
                saveContext()
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchAll() -> [Cocktail]{
        let request: NSFetchRequest<CocktailEntity>
        request = CocktailEntity.fetchRequest()
                
        do {
            let entities = try context.fetch(request)
            return entities.map { entity in
                Cocktail(id: entity.id ?? "",
                         name: entity.name ?? "",
                         image: entity.image ?? "",
                         category: entity.category ?? "",
                         instructions: entity.instructions ?? "")
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    private func saveContext() {
        if context.hasChanges {
            
            do{
                try context.save()
            } catch let error {
                fatalError(error.localizedDescription)
            }
        }
    }
}
