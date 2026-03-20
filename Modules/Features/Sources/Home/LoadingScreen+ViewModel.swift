//
//  LoadingScreen+ViewModel.swift
//  Features
//
//  Created by Theo Sementa on 20/03/2026.
//

import Foundation

extension LoadingScreen {

    @Observable
    final class ViewModel {

        private(set) var progress: Double = 0.0

        var progressPercent: Int {
            Int(progress * 100)
        }

        @MainActor
        func startLoading() async {
            let totalSteps = 60
            let stepDuration: Double = 3.0 / Double(totalSteps)

            for step in 1...totalSteps {
                try? await Task.sleep(for: .seconds(stepDuration))
                progress = Double(step) / Double(totalSteps)
            }
        }

    }

}
