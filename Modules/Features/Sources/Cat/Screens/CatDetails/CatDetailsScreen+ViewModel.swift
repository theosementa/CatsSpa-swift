//
//  CatDetailsScreen+ViewModel.swift
//  Features
//
//  Created by Theo Sementa on 21/03/2026.
//

import Foundation
import Models
import Providers

extension CatDetailsScreen {

    @Observable
    final class ViewModel {

        private let catId: UUID
        private let provider: CatProvider

        var cat: CatDomain?

        init(catId: UUID, provider: CatProvider = DefaultCatProvider()) {
            self.catId = catId
            self.provider = provider
        }

    }

}

extension CatDetailsScreen.ViewModel {

    func load() {
        cat = provider.cats(by: .enrollmentDate).first { $0.id == catId }
    }

}
