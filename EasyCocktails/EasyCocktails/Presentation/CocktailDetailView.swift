//
//  CocktailDetailView.swift
//  EasyCocktails
//
//  Created by user272495 on 6/19/25.
//

import SwiftUI

struct CocktailDetailView: View {
    let cocktail: Cocktail
    @State var isFavorite = false
    
    @EnvironmentObject var viewModel: FavoriteListViewModel
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            ZStack (alignment: .bottomTrailing){
                AsyncImage(url: URL(string: cocktail.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .scaledToFill()
                            .frame( height: 400)
                            .frame(maxWidth: .infinity)
                        
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame( height: 400)
                            .frame(maxWidth: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    case .failure(let error):
                        Text(error.localizedDescription)
                            .scaledToFill()
                            .frame( height: 400)
                            .frame(maxWidth: .infinity)
                        
                    @unknown default:
                        ProgressView()
                            .scaledToFill()
                            .frame( height: 400)
                            .frame(maxWidth: .infinity)
                        
                    }
                }
                
                Button {
                    isFavorite.toggle()
                    if (isFavorite) {
                        viewModel.addFavorite(favorite: cocktail)
                    } else {
                        viewModel.removeFavorite(favorite: cocktail)
                    }
                } label: {
                    Image(systemName:
                            isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding()
                        .background(.black)
                        .foregroundStyle(.white)
                        .clipShape(Circle())
                        .padding()
                }

            }
            
            VStack (alignment: .leading, spacing: 10){
                Text(cocktail.category)
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                    .background(.black)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Text(cocktail.name).bold().font(.title)
                Text(cocktail.instructions).font(.subheadline)
            }
            .padding()
            
            Spacer()
        }
        
    }
}
