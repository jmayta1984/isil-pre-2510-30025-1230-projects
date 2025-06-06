//
//  ContentView.swift
//  EasyShoes
//
//  Created by user272495 on 5/29/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "shoe") {
                HomeView()
            }
            Tab("Favorites", systemImage: "heart") {
                Text("Favorites")
            }
            Tab("Cart", systemImage: "cart") {
                Text("Cart")
            }
            Tab("Profile", systemImage: "person") {
                Text("Profile")
            }
        }
        .tint(.black)
        
    }
}

#Preview {
    ContentView()
}
