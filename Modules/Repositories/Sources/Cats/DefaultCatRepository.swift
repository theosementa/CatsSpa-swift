//
//  File.swift
//  Repositories
//
//  Created by Theo Sementa on 19/03/2026.
//

import Foundation
import Models

public final class DefaultCatRepository: CatRepository {
    
    public init() { }
    
    public func fetchAll() -> [CatDomain] {
        return CatDomain.mocks
    }
    
}
