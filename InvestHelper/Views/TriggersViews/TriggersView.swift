//
//  TriggersView.swift
//  InvestHelper
//
//  Created by Сергей Дятлов on 30.10.2025.
//

import SwiftUI

struct TriggersView: View {
    @Environment(Router.self) private var router

    var body: some View {
        VStack(spacing: 20) {
            Text("Triggers").font(.largeTitle)
            Button("Back to Root") {
                router.popToRoot()
            }
        }
    }
}

#Preview {
    ContentView()
}
