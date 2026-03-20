//
//  File.swift
//  Features
//
//  Created by Theo Sementa on 19/03/2026.
//

import Foundation
import Providers
import Models

extension HomeScreen {
    
    @Observable
    final class ViewModel {
        
        let provider: CatProvider
        
        init(provider: CatProvider = DefaultCatProvider()) {
            self.provider = provider
        }
        
    }
    
}

extension HomeScreen.ViewModel {

    var cats: [CatDomain] {
        return provider.cats(by: .enrollmentDate)
    }

    func load() {
        provider.fetchCats()
    }

}
