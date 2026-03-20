//
//  ContentView.swift
//  CatsSpa
//
//  Created by Theo Sementa on 19/03/2026.
//

import SwiftUI
import Home

struct ContentView: View {

    @State private var isLoading = true

    var body: some View {
        ZStack {
            if isLoading {
                LoadingScreen {
                    withAnimation(.easeInOut(duration: 0.6)) {
                        isLoading = false
                    }
                }
                .transition(.opacity)
            } else {
                HomeScreen()
                    .transition(.opacity)
            }
        }
    }

}

#Preview {
    ContentView()
}
