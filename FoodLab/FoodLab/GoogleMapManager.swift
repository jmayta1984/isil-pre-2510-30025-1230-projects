//
//  GoogleMapManager.swift
//  FoodLab
//
//  Created by user272495 on 7/3/25.
//

import GoogleMaps

class GoogleMapManager {
    static let shared = GoogleMapManager()
    
    // TODO: API KEY HERE
    private init () {
        GMSServices.provideAPIKey("YOUR API KEY HERE")
    }
    
}
