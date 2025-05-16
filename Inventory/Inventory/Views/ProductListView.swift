//
//  ProductListView.swift
//  Inventory
//
//  Created by user272495 on 5/8/25.
//

import SwiftUI

struct ProductListView: View {
    
    @State var showDetail = false
    
    var body: some View {
        NavigationStack {
            List {
                
            }
            .navigationTitle("Inventory")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showDetail = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
            }
            .sheet(isPresented: $showDetail) {
                ProductDetailView()
            }
        }
    }
}

#Preview {
    ProductListView()
}
