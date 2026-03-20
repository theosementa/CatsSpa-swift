//
//  File.swift
//  Features
//
//  Created by Theo Sementa on 19/03/2026.
//

import Foundation
import Providers
import Models
import SwiftUI

extension HomeScreen {

    @Observable
    final class ViewModel {

        let provider: CatProvider
        var isSkeletonLoading: Bool = true

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

    @MainActor
    func startSkeletonLoading() async {
        try? await Task.sleep(for: .seconds(2))
        withAnimation(.easeInOut(duration: 0.4)) {
            isSkeletonLoading = false
        }
    }

}
