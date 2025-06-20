//
//  HomeView.swift
//  EasyShoes
//
//  Created by user272495 on 5/29/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var search = ""
    
    let shoes =  [
        Shoe(id: 1, name: "Adidas Samba", price: 200, brand: "Adidas", image: "https://soccerpost.com/cdn/shop/files/IH6001_b2b012_plp.png_clipped_rev_1.png"),
        Shoe(id: 2, name: "Adidas Samba", price: 200, brand: "Adidas", image: "https://soccerpost.com/cdn/shop/files/IH6001_b2b012_plp.png_clipped_rev_1.png"),
        Shoe(id: 3, name: "Adidas Samba", price: 200, brand: "Adidas", image: "https://soccerpost.com/cdn/shop/files/IH6001_b2b012_plp.png_clipped_rev_1.png"),
        Shoe(id: 4, name: "Adidas Samba", price: 200, brand: "Adidas", image: "https://soccerpost.com/cdn/shop/files/IH6001_b2b012_plp.png_clipped_rev_1.png")
    ]
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                        TextField("Search", text: $search)
                        
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                    
                    HStack {
                        VStack (alignment: .leading){
                            Text("Up to 25% OFF")
                                .font(.title)
                                .bold()
                            Text("ENDS SOON")
                                .font(.subheadline)
                            Button(action: {}) {
                                Text("Shop now")
                            }
                            .padding()
                            .background(.black)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        Image("adidas")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 120)
                    }
                    .padding()
                    .background(Color(red: 249 / 255, green: 204 / 255, blue: 33 / 255))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(shoes) { shoe in
                            ShoeCardView(shoe: shoe)
                        }
                    }
                }
            }
            .navigationTitle("Easy Shoes")
            //.scrollIndicators(.hidden)
        }
    }
}

#Preview {
    HomeView()
}
