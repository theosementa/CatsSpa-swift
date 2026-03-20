//
//  AnalyticsScreen.swift
//  Features
//
//  Created by Theo Sementa on 20/03/2026.
//

import SwiftUI
import DesignSystem

public struct AnalyticsScreen: View {

    @State private var viewModel = ViewModel()

    public init() {}

    public var body: some View {
        Text("Analytics")
            .navigationTitle("Analytics")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                viewModel.load()
            }
    }

}

#Preview {
    NavigationStack {
        AnalyticsScreen()
    }
}
