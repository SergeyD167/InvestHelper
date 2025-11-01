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
            PortfolioScreen()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .portfolio:
                        PortfolioScreen()
                    case .settings:
                        SettingsScreen()
                    case .triggers:
                        TriggersScreen()
                    case .triggersAdd:
                        TriggersListScreen()
                    }
                    
                }
        }
        .environment(router)
    }
}
