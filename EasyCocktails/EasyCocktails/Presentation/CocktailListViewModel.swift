//
//  CocktailListViewModel.swift
//  EasyCocktails
//
//  Created by user272495 on 6/12/25.
//

import Foundation

class CocktailListViewModel: ObservableObject {
    @Published var cocktails = [Cocktail]()
    @Published var errorMessage: String? = nil
    
    let cocktailService = CocktailService()
    
    func searchCocktails(query: String) {
        cocktailService.searchCocktails(query: query) { cocktails, messaage in
            DispatchQueue.main.async {
                if let cocktails = cocktails {
                    self.cocktails = cocktails
                } else {
                    self.errorMessage = messaage
                    self.cocktails = []
                }
            }
        }
    }
}
