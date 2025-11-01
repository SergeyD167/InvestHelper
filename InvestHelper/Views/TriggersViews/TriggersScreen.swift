//
//  TriggersView.swift
//  InvestHelper
//
//  Created by Сергей Дятлов on 30.10.2025.
//

import SwiftUI

struct TriggersScreen: View {
    @Environment(Router.self) private var router

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                HStack {
                    Button("Back") {
                        router.popToRoot()
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button("Add") {
                        router.push(.triggersAdd)
                    }
                    .padding()
                }
                Spacer()
            }
            VStack {
                Text("Triggers").font(.largeTitle)
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ContentView()
}
