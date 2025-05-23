//
//  ProductListView.swift
//  Inventory
//
//  Created by user272495 on 5/8/25.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject var viewModel = ProductListViewModel()
    @State var showDetail = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.products) { product in
                    Text(product.name)
                }
                .onDelete { indexSet in
                    viewModel.deleteProduct(indexSet: indexSet)
                }
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
                ProductDetailView { product in
                    viewModel.addProduct(product: product)
                }
            }
        }
    }
}

#Preview {
    ProductListView()
}
