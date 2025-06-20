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
                
                HStack {
                    TextField("Search", text: $query)
                        .autocorrectionDisabled()
                    Button {
                        viewModel.searchCocktails(query: query)
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                    }
                }
                .padding()
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 16))

                
                
                if !viewModel.cocktails.isEmpty {
                    List {
                        ForEach(viewModel.cocktails) { cocktail in
                            CocktailListItemView(cocktail: cocktail)
                                .onTapGesture {
                                    selectedCocktail = cocktail
                                }
                        }
                    }
                    .listStyle(.plain)
                } else {
                    Spacer()
                    Text("No cocktails")
                    Spacer()
                }
                
                
            }
            .sheet(item: $selectedCocktail) { cocktail in
                CocktailDetailView(cocktail: cocktail)
            }
            
        }
    }
}
