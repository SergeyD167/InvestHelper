//
//  DashboardSettingsView.swift
//  InvestHelper
//
//  Created by Сергей Дятлов on 02.04.2026.
//

import SwiftUI

struct DashboardSettingsView: View {
    @State private var showTriggers: Bool = true
    @State private var showCrypto: Bool = true
    @State private var showIndices: Bool = true
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Отображение")) {
                    Toggle("Показывать триггеры", isOn: $showTriggers)
                    
                    Toggle("Криптовалюта", isOn: $showCrypto)
                    Toggle("Индексы", isOn: $showIndices)
                }
                
                Section(header: Text("Вид")) {
                    NavigationLink {
                        DashboardStyleView()
                    } label: {
                        Text("Стиль отображения")
                    }
                }
                
                Section(header: Text("Данные")) {
                    Toggle("Автообновление", isOn: .constant(true))
                }
            }
            .navigationTitle("Dashboard")
        }
    }
}

struct DashboardStyleView: View {
    var body: some View {
        Text("Выбор стиля (compact / expanded / cards)")
            .navigationTitle("Стиль")
    }
}

#Preview {
    DashboardSettingsView()
}
