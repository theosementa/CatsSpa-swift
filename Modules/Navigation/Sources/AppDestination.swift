//
//  File.swift
//  Navigation
//
//  Created by Theo Sementa on 22/02/2026.
//

import Foundation
import NavigationKit

public enum AppDestination: AppDestinationProtocol {
    case cat(CatDestination)
    case analytics(AnalyticsDestination)
}

extension AppDestination: RecursiveDestination {
    
    public var unwrapped: AnyHashable {
        switch self {
        case .cat(let catDestination):
            return catDestination
        case .analytics(let analyticsDestination):
            return analyticsDestination
        }
    }
    
}
