//
//  InvestHelperApp.swift
//  InvestHelper
//
//  Created by Сергей Дятлов on 30.10.2025.
//

import SwiftUI

@main
struct InvestHelperApp: App {
    
    let container = AppContainer()
    
    var body: some Scene {
        WindowGroup {
            RouterView(router: container.router)
        }
    }
}
