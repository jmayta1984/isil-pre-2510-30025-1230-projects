//
//  ContentView.swift
//  FoodLab
//
//  Created by user272495 on 7/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GoogleMapView(
                latitude: -12.1254808,
                longitude: -77.0248005,
                title: "ISIL",
                snippet: "Sede Miraflores")
        }
    }
}

#Preview {
    let _ = GoogleMapManager.shared
    ContentView()
}
