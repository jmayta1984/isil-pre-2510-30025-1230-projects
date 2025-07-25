//
//  FavoriteListView.swift
//  EasyCocktails
//
//  Created by user272495 on 6/19/25.
//

import SwiftUI

struct FavoriteListView: View {
    @EnvironmentObject var viewModel: FavoriteListViewModel
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.favorites) { favorite in
                    CocktailListItemView(cocktail: favorite)
                }.onDelete { indexSet in
                    if let index = indexSet.first {
                        viewModel.removeFavorite(favorite: viewModel.favorites[index])
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}
