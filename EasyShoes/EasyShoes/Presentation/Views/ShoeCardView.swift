//
//  ShoeCardView.swift
//  EasyShoes
//
//  Created by user272495 on 6/5/25.
//

import SwiftUI

struct ShoeCardView: View {
    let shoe: Shoe
    var body: some View {
        VStack(alignment: .leading) {
            ZStack (alignment: .topTrailing) {
                AsyncImage(url: URL(string: shoe.image)) { phase in
                    switch phase {
                    case .empty:
                        EmptyView()
                            .frame(width: 120, height: 120)
                            .frame(maxWidth: .infinity)
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .frame(maxWidth: .infinity)
                    case .failure:
                        Image(systemName: "shoe")
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .frame(maxWidth: .infinity)
                    @unknown default:
                        Image(systemName: "shoe")
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .frame(maxWidth: .infinity)
                    }
                }
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.black)
                }

            }
            
            Text(shoe.name).bold().font(.headline)
            Text(shoe.brand)
            Text(String(format: "$ %i", shoe.price)).bold()
        }
        .padding()
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    ShoeCardView(shoe: Shoe(id: 1, name: "Adidas Samba", price: 200, brand: "Adidas", image: "https://soccerpost.com/cdn/shop/files/IH6001_b2b012_plp.png_clipped_rev_1.png"))
}
