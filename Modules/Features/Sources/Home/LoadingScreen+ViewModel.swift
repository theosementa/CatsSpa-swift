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
            for step in 1...4 {
                try? await Task.sleep(for: .seconds(1))
                progress = Double(step) / 4.0
            }
        }

    }

}
