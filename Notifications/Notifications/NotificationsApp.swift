//
//  NotificationsApp.swift
//  Notifications
//
//  Created by user272495 on 7/10/25.
//

import SwiftUI

@main
struct NotificationsApp: App {
    private let notificationManager = NotificationManager()
    
    init() {
        notificationManager.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(notificationManager)
        }
    }
}
