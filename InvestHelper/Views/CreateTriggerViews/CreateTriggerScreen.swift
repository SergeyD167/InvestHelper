//
//  TriggersView.swift
//  InvestHelper
//
//  Created by Сергей Дятлов on 30.10.2025.
//

import SwiftUI

struct CreateTriggerScreen: View {
    @Environment(Router.self) private var router

    var body: some View {
        VStack {
            Text("Later")
            Button("Back") {
                router.pop()
            }
        }
        .navigationBarHidden(true)
    }
    
}

#Preview {
    ContentView()
}
