//
//  ContactListView.swift
//  Agenda
//
//  Created by user272495 on 4/24/25.
//

import SwiftUI

struct ContactListView: View {
    
    @State var contacts = [String]()
    @State var showDetail = false
    
    @State var selectedContact: String? = nil
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(contacts, id: \.self) { contact in
                    Text(contact)
                        .onTapGesture {
                            selectedContact = contact
                            showDetail = true
                        }
                }
                .onDelete { indexSet in
                    contacts.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Agenda")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        selectedContact = nil
                        showDetail = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showDetail) {
                ContactDetailView (contact: selectedContact){ contact in
                    if let selectedContact = selectedContact {
                        contacts = contacts.map { it in
                            it == selectedContact ? contact : it
                        }
                    } else {
                        contacts.append(contact)
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ContactListView()
}
