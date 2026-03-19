//
//  File.swift
//  Providers
//
//  Created by Theo Sementa on 19/03/2026.
//

import Foundation
import Models
import Stores

public enum CatScope {
    case enrollmentDate
}

public protocol CatProvider {
    var store: CatStore { get }
}

public extension CatProvider {
    
    func cats(by scope: CatScope) -> [CatDomain] {
        switch scope {
        case .enrollmentDate:
            return store.cats
                .sorted { $0.enrollmentDate > $1.enrollmentDate }
        }
    }
    
}
