//
//  CatDetailsScreen.swift
//  Features
//
//  Created by Theo Sementa on 21/03/2026.
//

import SwiftUI
import Models
import DesignSystem

public struct CatDetailsScreen: View {

    @State private var viewModel: ViewModel

    public init(catId: UUID) {
        self._viewModel = State(initialValue: ViewModel(catId: catId))
    }

    public var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                heroSection
                if let cat = viewModel.cat {
                    detailsSection(cat: cat)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.load()
        }
    }

}

// MARK: - Subviews
private extension CatDetailsScreen {

    @ViewBuilder
    var heroSection: some View {
        Group {
            if let cat = viewModel.cat, let uiImage = UIImage(asset: cat.images.cover) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
            } else {
                LinearGradient(
                    colors: [Color.Primary.p500.opacity(0.6), Color.Primary.p500],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .overlay {
                    Image(systemName: "pawprint.fill")
                        .font(.system(size: 72, weight: .medium))
                        .foregroundStyle(.white.opacity(0.8))
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 320)
        .clipped()
    }

    @ViewBuilder
    func detailsSection(cat: CatDomain) -> some View {
        VStack(alignment: .leading, spacing: 24) {
            headerRow(cat: cat)
            Divider()
            infoGrid(cat: cat)
        }
        .padding(24)
        .background(Color.Background.bg100)
    }

    func headerRow(cat: CatDomain) -> some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text(cat.name)
                    .font(AppFont.Display.mediumBold, color: .Text.primary)
                Text(cat.ageDescription)
                    .font(AppFont.Body.smallRegular, color: .Text.secondary)
            }
            Spacer()
            sexBadge(cat.sex)
        }
    }

    func sexBadge(_ sex: CatSexType) -> some View {
        let isFemale = sex == .female
        let tint: Color = isFemale ? .Error.e500 : .Primary.p500
        return HStack(spacing: 4) {
            Text(isFemale ? "♀" : "♂")
                .font(.system(size: 13, weight: .semibold))
            Text(isFemale ? "Female" : "Male")
                .font(AppFont.Label.largeMedium, color: tint)
        }
        .foregroundStyle(tint)
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(tint.opacity(0.12))
        .clipShape(Capsule())
    }

    func infoGrid(cat: CatDomain) -> some View {
        VStack(spacing: 16) {
            infoRow(
                icon: "birthday.cake",
                label: "Birthday",
                value: cat.birthday.formatted(date: .long, time: .omitted)
            )
            infoRow(
                icon: "calendar.badge.plus",
                label: "Member since",
                value: cat.enrollmentDate.formatted(date: .long, time: .omitted)
            )
            infoRow(
                icon: "pawprint",
                label: "Breed",
                value: cat.breed
            )
        }
    }

    func infoRow(icon: String, label: String, value: String) -> some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(Color.Primary.p500)
                .frame(width: 28)

            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .font(AppFont.Label.largeMedium, color: .Text.secondary)
                Text(value)
                    .font(AppFont.Body.mediumMedium, color: .Text.primary)
            }

            Spacer()
        }
    }

}

#Preview {
    NavigationStack {
        CatDetailsScreen(catId: UUID())
    }
}
