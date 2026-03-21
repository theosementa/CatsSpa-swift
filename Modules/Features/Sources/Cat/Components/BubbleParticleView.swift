//
//  BubbleParticleView.swift
//  Features
//
//  Created by Theo Sementa on 21/03/2026.
//

import SwiftUI

struct BubbleParticleView: View {

    let emoji: String
    let size: CGFloat
    let startX: CGFloat
    let containerHeight: CGFloat
    let duration: Double
    let delay: Double
    let swayAmount: CGFloat

    @State private var yPos: CGFloat
    @State private var xPos: CGFloat
    @State private var opacity: Double = 0
    @State private var scale: CGFloat = 0.3

    init(
        emoji: String,
        size: CGFloat,
        startX: CGFloat,
        containerHeight: CGFloat,
        duration: Double,
        delay: Double,
        swayAmount: CGFloat
    ) {
        self.emoji = emoji
        self.size = size
        self.startX = startX
        self.containerHeight = containerHeight
        self.duration = duration
        self.delay = delay
        self.swayAmount = swayAmount
        self._yPos = State(initialValue: containerHeight + 60)
        self._xPos = State(initialValue: startX - swayAmount)
    }

    var body: some View {
        Text(emoji)
            .font(.system(size: size))
            .position(x: xPos, y: yPos)
            .opacity(opacity)
            .scaleEffect(scale)
            .onAppear {
                withAnimation(.easeIn(duration: 0.6).delay(delay)) {
                    opacity = Double.random(in: 0.75...1.0)
                    scale = 1.0
                }
                withAnimation(.linear(duration: duration).delay(delay).repeatForever(autoreverses: false)) {
                    yPos = -60
                }
                withAnimation(.easeInOut(duration: duration * 0.38).delay(delay).repeatForever(autoreverses: true)) {
                    xPos = startX + swayAmount
                }
            }
    }

}
