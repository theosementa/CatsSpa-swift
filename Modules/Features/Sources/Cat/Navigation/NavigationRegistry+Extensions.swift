//
//  NavigationRegistry+Extensions.swift
//  Features
//
//  Created by Theo Sementa on 21/03/2026.
//

import SwiftUI
import Navigation

public extension NavigationRegistry {

    @MainActor
    func registerCatDestinations() {
        self.register(CatDestination.self) { destination in
            switch destination {
            case .home:
                AnyView(EmptyView())
            case .details(let id):
                AnyView(CatDetailsScreen(catId: id))
            }
        }
    }

}
