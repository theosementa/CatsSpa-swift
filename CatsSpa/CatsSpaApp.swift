//
//  CatsSpaApp.swift
//  CatsSpa
//
//  Created by Theo Sementa on 19/03/2026.
//

import SwiftUI
import Navigation
import Analytics
import Cat

@main
struct CatsSpaApp: App {
    
    init() {
        NavigationRegistry.shared.registerAnalyticsDestinations()
        NavigationRegistry.shared.registerCatDestinations()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
