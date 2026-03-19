//
//  File.swift
//  Repositories
//
//  Created by Theo Sementa on 19/03/2026.
//

import Foundation
import Models

public protocol CatRepository {
    func fetchAll() -> [CatDomain] // In real context, CatEntity instead of CatDomain
}
