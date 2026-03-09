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
    }
}

#Preview {
    DashboardScreen(router: Router(), viewModel: DashboardViewModel())
}
