//
//  SearchHeroesView.swift
//  SuperHero
//
//  Created by Jorge Mayta on 17/07/25.
//

import SwiftUI

struct SearchHeroesView: View {
    
    @StateObject var viewModel = SearchHeroesViewModel()
    @State private var selectedHero: Hero?
    
    var body: some View {
        VStack {
            TextField("Search", text: $viewModel.query)
                .onSubmit {
                    viewModel.searchHeroes()
                }
            switch viewModel.uiState {
            case .initialState:
                Spacer()
            case .loadingState:
                VStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            case .successState(let heroes):
                List {
                    ForEach(heroes) { hero in
                        Text(hero.name)
                            .onTapGesture {
                                selectedHero = hero
                            }
                    }
                }
                
            case .failureState(let message):
                VStack {
                    Spacer()
                    Text(message)
                    
                    Spacer()
                }
            }
        }
        .sheet(item: $selectedHero) { hero in
            Text(hero.fullName)
        }
    }
}

#Preview {
    SearchHeroesView()
}
