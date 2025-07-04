//
//  MapView.swift
//  FoodLab
//
//  Created by user272495 on 7/3/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    let latitude = -12.1254808
    let longitude = -77.0248005


    var body: some View {
        VStack {
            Map {
                Marker("ISIL", coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                
                Marker("ISIL", coordinate: CLLocationCoordinate2D(latitude: latitude + 10, longitude: longitude + 10))
            }
        }
    }
}

#Preview {
    MapView()
}
