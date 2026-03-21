//
//  CatWashScreen+ViewModel.swift
//  Features
//
//  Created by Theo Sementa on 21/03/2026.
//

import Foundation
import Models
import Providers
import SwiftUI

extension CatWashScreen {

    @Observable @MainActor
    final class ViewModel {

        private let catId: UUID
        private let provider: CatProvider

        private(set) var cat: CatDomain?
        private(set) var secondsLeft: Int = 10
        private(set) var progress: Double = 0
        private(set) var isFinished: Bool = false

        init(catId: UUID, provider: CatProvider = DefaultCatProvider()) {
            self.catId = catId
            self.provider = provider
        }

    }

}

extension CatWashScreen.ViewModel {

    func start() {
        cat = provider.cats(by: .enrollmentDate).first { $0.id == catId }
        Task { @MainActor in
            for tick in 1...10 {
                try? await Task.sleep(for: .seconds(1))
                withAnimation(.easeInOut(duration: 0.6)) {
                    secondsLeft = 10 - tick
                    progress = Double(tick) / 10.0
                }
                if tick == 10 {
                    withAnimation(.spring(duration: 0.5, bounce: 0.4)) {
                        isFinished = true
                    }
                }
            }
        }
    }

}
