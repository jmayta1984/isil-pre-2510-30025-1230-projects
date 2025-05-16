//
//  ContactDetailView.swift
//  Agenda
//
//  Created by user272495 on 4/24/25.
//

import SwiftUI

struct ContactDetailView: View {
    
    var contact: String?
    @State var name = ""
    var title: String {
        contact == nil ? "New contact" : "Update contact"
    }
    @Environment(\.dismiss) var dismiss
    
    var onSave: (String) -> Void = {_ in}
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Name", text: $name)
                }
            }
            .navigationTitle(title)
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        onSave(name)
                        dismiss()
                    }) {
                        Text("Save")
                    }
                }
            }
            .onAppear {
                if let contact = contact {
                    name = contact
                }
            }
            
        }
    }
}

#Preview {
    ContactDetailView()
}
