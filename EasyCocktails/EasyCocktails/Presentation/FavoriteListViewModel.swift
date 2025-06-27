//
//  FavoriteListViewModel.swift
//  EasyCocktails
//
//  Created by user272495 on 6/19/25.
//

import Foundation

class FavoriteListViewModel: ObservableObject {
    
    @Published var favorites = [Cocktail] ()
    let cocktailDAO = CocktailDAO()
    
    func addFavorite(favorite: Cocktail) {
        cocktailDAO.insertCocktail(cocktail: favorite)
        getAllFavorites()
    }
    
    func removeFavorite(favorite: Cocktail) {
        cocktailDAO.deleteCocktail(id: favorite.id)
        getAllFavorites()
    }
    
    func getAllFavorites() {
        favorites = cocktailDAO.fetchAll()
    }
    
    func checkFavorite(favorite: Cocktail) -> Bool {
        return favorites.contains(favorite)
    }
    
    init() {
        getAllFavorites()
    }
}

