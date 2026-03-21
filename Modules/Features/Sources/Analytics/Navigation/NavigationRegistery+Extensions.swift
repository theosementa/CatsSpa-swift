//
//  File.swift
//  Features
//
//  Created by Theo Sementa on 21/03/2026.
//

import Foundation
import Navigation
import SwiftUI

public extension NavigationRegistry {
    
    @MainActor
    func registerAnalyticsDestinations() {
        self.register(AnalyticsDestination.self) { destination in
            switch destination {
            case .home:
                AnyView(AnalyticsScreen())
            }
        }
    }
    
}
