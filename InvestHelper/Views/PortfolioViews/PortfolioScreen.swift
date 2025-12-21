//
//  PortfolioView.swift
//  InvestHelper
//
//  Created by Сергей Дятлов on 30.10.2025.
//

import SwiftUI

struct PortfolioScreen: View {
    let router: Router

    var body: some View {
        VStack(spacing: 20) {
            Text("Portfolio").font(.largeTitle)
            Button("Go to Settings") {
                router.push(.settings)
            }
            Button("Go to Triggers") {
                router.push(.triggers)
            }
        }
    }
}

#Preview {
    PortfolioScreen(router: Router())
}
