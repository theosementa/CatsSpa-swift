//
//  AnalyticsScreen+ViewModel.swift
//  Features
//
//  Created by Theo Sementa on 20/03/2026.
//

import Foundation
import Providers
import Models

extension AnalyticsScreen {

    @Observable
    final class ViewModel {

        let provider: CatProvider

        init(provider: CatProvider = DefaultCatProvider()) {
            self.provider = provider
        }

    }

}

extension AnalyticsScreen.ViewModel {

    var cats: [CatDomain] {
        return provider.cats(by: .enrollmentDate)
    }

    func load() {
        provider.fetchCats()
    }

}
