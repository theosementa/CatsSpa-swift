//
//  DefaultCatStore.swift
//  Stores
//
//  Created by Theo Sementa on 19/03/2026.
//

import Foundation
import Models
import Repositories

@Observable
public final class DefaultCatStore: CatStore, @unchecked Sendable {
    public static let shared = DefaultCatStore()
    
    public var cats: [CatDomain] = []
    public var repository: CatRepository
    
    private init(repository: CatRepository = DefaultCatRepository()) {
        self.repository = repository
    }
    
}
