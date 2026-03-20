//
//  CatCardView.swift
//  Features
//
//  Created by Theo Sementa on 20/03/2026.
//

import SwiftUI
import Models
import DesignSystem

public struct CatCardView: View {

    let cat: CatDomain

    public init(cat: CatDomain) {
        self.cat = cat
    }

    public var body: some View {
        VStack(spacing: 0) {
            avatarSection
            infoSection
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.08), radius: 12, x: 0, y: 4)
    }

}

// MARK: - Subviews
private extension CatCardView {

    @ViewBuilder
    var avatarSection: some View {
//        ZStack {
//            LinearGradient(
//                colors: cat.image.cardGradient,
//                startPoint: .topLeading,
//                endPoint: .bottomTrailing
//            )
//
//            VStack(spacing: 6) {
//                Image(systemName: "pawprint.fill")
//                    .font(.system(size: 36, weight: .medium))
//                    .foregroundStyle(.white.opacity(0.9))
//
//                Text(cat.name.prefix(1))
//                    .appFont(AppFont.Display.mediumBold)
//                    .foregroundStyle(.white.opacity(0.3))
//            }
//        }
        if let uiImage = UIImage(asset: cat.image) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
                .frame(height: 130)
                .clipped()
        }
    }

    var infoSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(cat.name)
                .appFont(AppFont.Body.mediumSemiBold)
                .foregroundStyle(.primary)

            Text(cat.ageDescription)
                .appFont(AppFont.Body.smallRegular)
                .foregroundStyle(.secondary)

            HStack(spacing: 4) {
                Text(cat.sex.symbol)
                    .font(.system(size: 11, weight: .semibold))
                Text(cat.sex.label)
                    .appFont(AppFont.Label.largeMedium)
            }
            .foregroundStyle(cat.sex.tint)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(Color(.systemBackground))
    }

}

// MARK: - ImageType visual mapping
private extension ImageType {

    var cardGradient: [Color] {
        switch self {
        case .imageUna:
            return [Color(red: 0.62, green: 0.30, blue: 0.92), Color(red: 0.38, green: 0.14, blue: 0.80)]
        case .imageSalem:
            return [Color(red: 0.98, green: 0.56, blue: 0.22), Color(red: 0.88, green: 0.28, blue: 0.48)]
        }
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
        case .female: return Color(red: 0.92, green: 0.36, blue: 0.60)
        case .male:   return Color(red: 0.28, green: 0.52, blue: 0.92)
        }
    }

}

#Preview {
    CatCardView(cat: .mocks[0])
        .frame(width: 180)
        .padding()
}
