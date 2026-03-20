//
//  LoadingScreen.swift
//  Features
//
//  Created by Theo Sementa on 20/03/2026.
//

import SwiftUI
import DesignSystem

public struct LoadingScreen: View {

    @State private var viewModel = ViewModel()
    let onFinished: () -> Void

    public init(onFinished: @escaping () -> Void) {
        self.onFinished = onFinished
    }

    public var body: some View {
        ZStack {
            Color.Background.bg50
                .ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer()

                logoSection

                Spacer()

                progressSection
                    .padding(.horizontal, 32)
                    .padding(.bottom, 56)
            }
        }
        .task {
            await viewModel.startLoading()
            onFinished()
        }
    }

}

// MARK: - Subviews
private extension LoadingScreen {

    var logoSection: some View {
        VStack(spacing: 20) {
            ZStack {
                Circle()
                    .fill(Color.Primary.p500)
                    .frame(width: 100, height: 100)

                Image(systemName: "pawprint.fill")
                    .font(.system(size: 44))
                    .foregroundStyle(.white)
            }

            VStack(spacing: 8) {
                Text("PURR-FECT SPA")
                    .font(AppFont.Display.largeBold, color: .Base.white)

                Text("Luxury care for your feline friends")
                    .font(AppFont.Body.smallRegular, color: .Base.white.opacity(0.5))
            }
        }
    }

    var progressSection: some View {
        VStack(spacing: 10) {
            Text("\(viewModel.progressPercent)%")
                .contentTransition(.numericText())
                .font(AppFont.Label.largeMedium, color: .Base.white.opacity(0.6))
                .monospacedDigit()

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(.white.opacity(0.15))
                        .frame(height: 5)

                    Capsule()
                        .fill(
                            LinearGradient(
                                colors: [Color(red: 0.6, green: 0.3, blue: 0.9), Color(red: 0.8, green: 0.4, blue: 0.7)],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geo.size.width * viewModel.progress, height: 5)
                }
            }
            .frame(height: 5)
        }
        .animation(.linear, value: viewModel.progress)
    }

}

#Preview {
    LoadingScreen(onFinished: {})
}
