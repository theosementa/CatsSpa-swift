//
//  File.swift
//  Stores
//
//  Created by Theo Sementa on 19/03/2026.
//

import Foundation
import Models
import Repositories

public protocol CatStore {
    var cats: [CatDomain] { get set }
    var repository: CatRepository { get }
}

public extension CatStore {
    
    mutating func fetchAll() {
        let cats = repository.fetchAll()
        self.cats = cats
    }
    
}
