//
//  SettingsView.swift
//  InvestHelper
//
//  Created by Сергей Дятлов on 30.10.2025.
//

import SwiftUI

struct SettingsScreen: View {
    @Environment(Router.self) private var router
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Settings").font(.largeTitle)
            Button("Back") {
                router.pop()
            }
        }
    }
}

#Preview {
    ContentView()
}
