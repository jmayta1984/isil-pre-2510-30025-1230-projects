//
//  HomeView.swift
//  EasyShoes
//
//  Created by user272495 on 5/29/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var search = ""
    var body: some View {
        NavigationStack {
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
                    }
                }
                .padding()
                .background(Color(red: 249 / 255, green: 204 / 255, blue: 33 / 255))

                Spacer()
            }
            .navigationTitle("Easy Shoes")
            .padding()

            
            
        }
    }
}

#Preview {
    HomeView()
}
