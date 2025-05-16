//
//  ProductDetailView.swift
//  Inventory
//
//  Created by user272495 on 5/8/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    @StateObject var viewModel = ProductDetailViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $viewModel.name)
                    TextField("Quantity", text: $viewModel.quantity)
                }
                
                Section {
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Save")
                    }
                }
            }
            .navigationTitle("New product")
        }
    }
}

#Preview {
    ProductDetailView()
}
