//
//  CocktailListItemView.swift
//  EasyCocktails
//
//  Created by user272495 on 6/19/25.
//

import SwiftUI

struct CocktailListItemView: View {
    let cocktail: Cocktail
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: cocktail.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 90, height: 90)
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 90, height: 90)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                case .failure(let error):
                    Text(error.localizedDescription)
                        .frame(width: 90, height: 90)
                @unknown default:
                    ProgressView()
                        .frame(width: 90, height: 90)
                }
            }
            VStack(alignment: .leading) {
                Text(cocktail.category)
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                    .background(.black)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Text(cocktail.name).bold()
            }
            
        }
    }
}
