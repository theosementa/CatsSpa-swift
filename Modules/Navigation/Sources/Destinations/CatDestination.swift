//
//  File.swift
//  Navigation
//
//  Created by Theo Sementa on 21/03/2026.
//

import Foundation
import NavigationKit

public enum CatDestination: DestinationItem {
    case home
    case details(id: UUID)
    case wash(id: UUID)
}
