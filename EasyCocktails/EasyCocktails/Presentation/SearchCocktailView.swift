//
//  SearchCocktailView.swift
//  EasyCocktails
//
//  Created by user272495 on 6/12/25.
//

import SwiftUI

struct SearchCocktailView: View {
    
    @State var query: String = ""
    @StateObject var viewModel = CocktailListViewModel()
    @State var selectedCocktail: Cocktail? = nil
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search", text: $query)
                Button {
                    viewModel.searchCocktails(query: query)
                } label: {
                    Text("Search")
                }
                if !viewModel.cocktails.isEmpty {
                    List {
                        ForEach(viewModel.cocktails) { cocktail in
                            Text(cocktail.name)
                                .onTapGesture {
                                    selectedCocktail = cocktail
                                }
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                Spacer()
                
            }
            .navigationDestination(item: $selectedCocktail) { cocktail in
                Text(cocktail.name)
            }
            
        }
    }
}
