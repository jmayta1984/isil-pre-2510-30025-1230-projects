//
//  ContentView.swift
//  EasyCocktails
//
//  Created by user272495 on 6/12/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = FavoriteListViewModel()
    
    var body: some View {
        TabView {
            Tab("Search", systemImage: "magnifyingglass") {
                SearchCocktailView()
            }
            Tab("Favorites", systemImage: "heart") {
                FavoriteListView()
            }
        }
        .tint(.black)
        .environmentObject(viewModel)
    }
}

#Preview {
    ContentView()
}
