//
//  RouterView.swift
//  InvestHelper
//
//  Created by Сергей Дятлов on 30.10.2025.
//

import Foundation
import SwiftUI

struct RouterView: View {
    @State private var router = Router()

    var body: some View {
        NavigationStack(path: $router.path) {
            PortfolioView()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .portfolio:
                        PortfolioView()
                    case .settings:
                        SettingsView()
                    case .triggers:
                        TriggersView()
                    }
                }
        }
        .environment(router)
    }
}
