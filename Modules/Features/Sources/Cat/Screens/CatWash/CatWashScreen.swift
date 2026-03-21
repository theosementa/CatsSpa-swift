//
//  CatWashScreen.swift
//  Features
//
//  Created by Theo Sementa on 21/03/2026.
//

import SwiftUI
import Models
import DesignSystem

public struct CatWashScreen: View {

    @State private var viewModel: ViewModel

    // Particles generated once at init — purely visual, no ViewModel concern
    @State private var particles: [BubbleParticle] = {
        (0..<28).map { i in
            BubbleParticle(
                emoji: i % 4 == 0 ? "🧼" : "🫧",
                size: CGFloat.random(in: 18...52),
                xRatio: CGFloat.random(in: 0.04...0.96),
                duration: Double.random(in: 3.5...7.5),
                delay: Double.random(in: 0...6.5),
                swayAmount: CGFloat.random(in: 12...44)
            )
        }
    }()

    public init(catId: UUID) {
        self._viewModel = State(initialValue: ViewModel(catId: catId))
    }
    
    public var body: some View {
        washBackground
            .padding()
            .overlay {
                particlesLayer
            }
            .fullSize()
            .overlay(alignment: .bottom) {
                timerCard
                    .padding(.bottom, 24)
            }
            .onAppear {
                viewModel.start()
            }
    }

}

// MARK: - Subviews
private extension CatWashScreen {

    @ViewBuilder
    var washBackground: some View {
        Group {
            if let cat = viewModel.cat, let uiImage = UIImage(asset: cat.images.wash) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 200)
            } else {
                LinearGradient(
                    colors: [Color.Primary.p500.opacity(0.5), Color(hex: 0x00C2FF)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            }
        }
    }

    var particlesLayer: some View {
        GeometryReader { geo in
            ForEach(particles) { particle in
                BubbleParticleView(
                    emoji: particle.emoji,
                    size: particle.size,
                    startX: particle.xRatio * geo.size.width,
                    containerHeight: geo.size.height,
                    duration: particle.duration,
                    delay: particle.delay,
                    swayAmount: particle.swayAmount
                )
            }
        }
        .ignoresSafeArea()
    }

    var timerCard: some View {
        VStack(spacing: 16) {
            progressRing
            statusLabel
        }
        .padding(.horizontal, 36)
        .padding(.vertical, 24)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .shadow(color: .black.opacity(0.18), radius: 24, x: 0, y: 8)
        .padding(.horizontal, 48)
    }

    var progressRing: some View {
        ZStack {
            Circle()
                .stroke(Color.white.opacity(0.25), lineWidth: 8)
                .frame(width: 90, height: 90)

            Circle()
                .trim(from: 0, to: viewModel.progress)
                .stroke(
                    Color.white,
                    style: StrokeStyle(lineWidth: 8, lineCap: .round)
                )
                .frame(width: 90, height: 90)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.7), value: viewModel.progress)

            if viewModel.isFinished {
                Image(systemName: "checkmark")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(.white)
                    .transition(.scale(scale: 0.4).combined(with: .opacity))
            } else {
                Text("\(viewModel.secondsLeft)")
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    .contentTransition(.numericText())
                    .animation(.easeInOut(duration: 0.4), value: viewModel.secondsLeft)
            }
        }
    }

    var statusLabel: some View {
        Text(viewModel.isFinished ? "✨ All Clean!" : "Washing \(viewModel.cat?.name ?? "")…")
            .font(AppFont.Body.mediumSemiBold, color: .white)
            .animation(.easeInOut, value: viewModel.isFinished)
    }

}

// MARK: - BubbleParticle model
extension CatWashScreen {

    struct BubbleParticle: Identifiable {
        let id = UUID()
        let emoji: String
        let size: CGFloat
        let xRatio: CGFloat
        let duration: Double
        let delay: Double
        let swayAmount: CGFloat
    }

}

#Preview {
    CatWashScreen(catId: UUID())
}
