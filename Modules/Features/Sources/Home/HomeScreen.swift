//
//  HomeScreen.swift
//  Features
//
//  Created by Theo Sementa on 19/03/2026.
//

import SwiftUI
import Models
import DesignSystem

public struct HomeScreen: View {

    @State private var viewModel = ViewModel()

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    public init() {}

    public var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.cats) { cat in
                        CatCardView(cat: cat)
                    }
                }
                .padding(16)
                .redacted(reason: viewModel.isSkeletonLoading ? .placeholder : [])
            }
            .navigationTitle("PURR-FECT SPA")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "pawprint.fill")
                        .foregroundStyle(Color.Primary.p500)
                }
            }
        }
        .onAppear {
            viewModel.load()
        }
        .task {
            await viewModel.startSkeletonLoading()
        }
    }

}

#Preview {
    HomeScreen()
}
