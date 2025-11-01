//
//  TriggersListScreen.swift
//  InvestHelper
//
//  Created by Сергей Дятлов on 01.11.2025.
//

import SwiftUI

struct TriggersListScreen: View {
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
