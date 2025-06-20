//
//  FavoriteListViewModel.swift
//  EasyCocktails
//
//  Created by user272495 on 6/19/25.
//

import Foundation

class FavoriteListViewModel: ObservableObject {
    @Published var favorites = [Cocktail] ()
    
    func addFavorite(favorite: Cocktail) {
        favorites.append(favorite)
    }
    
    func removeFavorite(favorite: Cocktail) {
        favorites.removeAll { cocktail in
            favorite.id == cocktail.id
        }
    }
}

