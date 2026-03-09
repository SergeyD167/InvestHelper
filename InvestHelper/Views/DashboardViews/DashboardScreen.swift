//
//  DashboardScreen.swift
//  InvestHelper
//
//  Created by Сергей Дятлов on 09.03.2026.
//

import SwiftUI

struct DashboardScreen: View {

    let router: Router
    @Bindable var viewModel: DashboardViewModel
    
    var body: some View {
        Text("Dashboard")
        Button("Go to Settings") {
            router.push(.settings)
        }
        Button("Go to Triggers") {
            router.push(.triggers)
        }
        Button("Go to Portfolio") {
            router.push(.portfolio)
        }
    }
}

#Preview {
    DashboardScreen(router: Router(), viewModel: DashboardViewModel())
}
