//
//  File.swift
//  Providers
//
//  Created by Theo Sementa on 19/03/2026.
//

import Foundation
import Models
import Stores

public final class DefaultCatProvider: CatProvider {
    public var store: CatStore = DefaultCatStore.shared
    
    public init() { }
}
