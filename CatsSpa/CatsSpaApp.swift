//
//  CatsSpaApp.swift
//  CatsSpa
//
//  Created by Theo Sementa on 19/03/2026.
//

import SwiftUI
import Navigation
import Analytics

@main
struct CatsSpaApp: App {
    
    init() {
        NavigationRegistry.shared.registerAnalyticsDestinations()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
