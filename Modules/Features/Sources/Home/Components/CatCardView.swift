//
//  CatCardView.swift
//  Features
//
//  Created by Theo Sementa on 20/03/2026.
//

import SwiftUI
import Models
import DesignSystem
import Navigation

public struct CatCardView: View {

    let cat: CatDomain

    public init(cat: CatDomain) {
        self.cat = cat
    }

    public var body: some View {
        NavigationButtonView(route: .push, destination: .cat(.details(id: cat.id))) {
            VStack(spacing: 0) {
                avatarSection
                infoSection
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .black.opacity(0.08), radius: 12, x: 0, y: 4)
        }
    }

}

// MARK: - Subviews
private extension CatCardView {

    @ViewBuilder
    var avatarSection: some View {
        Group {
            if let uiImage = UIImage(asset: cat.images.cover) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
            } else {
                ZStack {
                    LinearGradient(
                        colors: [Color.blue, Color.green],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    
                    VStack(spacing: 6) {
                        Image(systemName: "pawprint.fill")
                            .font(.system(size: 36, weight: .medium))
                            .foregroundStyle(.white.opacity(0.9))
                        
                        Text(cat.name.prefix(1))
                            .font(AppFont.Display.mediumBold)
                            .foregroundStyle(.white.opacity(0.3))
                    }
                }
            }
        }
        .frame(height: 130)
        .clipped()
    }

    var infoSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(cat.name)
                .font(AppFont.Body.mediumSemiBold, color: .Text.primary)

            Text(cat.ageDescription)
                .font(AppFont.Body.smallRegular, color: .Text.secondary)

            HStack(spacing: 4) {
                Text(cat.sex.symbol)
                    .font(.system(size: 11, weight: .semibold))
                Text(cat.sex.label)
                    .font(AppFont.Label.largeMedium, color: cat.sex.tint)
            }
            .foregroundStyle(cat.sex.tint)
        }
        .fullWidth(.leading)
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(Color.Background.bg100)
    }

}

// MARK: - CatSexType display
private extension CatSexType {

    var symbol: String {
        switch self {
        case .female: return "♀"
        case .male:   return "♂"
        }
    }

    var label: String {
        switch self {
        case .female: return "Female"
        case .male:   return "Male"
        }
    }

    var tint: Color {
        switch self {
        case .female: return .Error.e500
        case .male:   return .Primary.p500
        }
    }

}

#Preview {
    CatCardView(cat: .mocks[0])
        .frame(width: 180)
        .padding()
}
