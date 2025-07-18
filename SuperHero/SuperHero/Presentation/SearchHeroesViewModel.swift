//
//  SearchHeroesViewModel.swift
//  SuperHero
//
//  Created by Jorge Mayta on 17/07/25.
//

import Foundation

class SearchHeroesViewModel: ObservableObject {
    @Published var uiState: UIState<[Hero]> = .initialState
    @Published var query: String = ""
    
    private let service = HeroService.shared
    
    func searchHeroes() {
        uiState = .loadingState
        service.searchHeroes(name: query) { heroes, message in
            DispatchQueue.main.async {
                if let heroes = heroes {
                    self.uiState = .successState(heroes)
                } else {
                    self.uiState = .failureState(message ?? "Error: Unkwnon error")
                }
            }
        }
    }
}
