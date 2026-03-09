import SwiftUI

struct CreateTriggerScreen: View {
    
    let router: Router
    @Bindable var viewModel: CreateTriggerViewModel

    var body: some View {
        Form {
            Picker("Источник", selection: $viewModel.source) {
                Text("Brent").tag(TriggerSource.brent)
                Text("USD/RUB").tag(TriggerSource.usdRub)
                Text("MOEX").tag(TriggerSource.moex)
                Text("Key Rate").tag(TriggerSource.keyRate)
            }

            Picker("Условие", selection: $viewModel.conditionType) {
                Text(">").tag(TriggerConditionType.greaterThan)
                Text("<").tag(TriggerConditionType.lessThan)
            }

            TextField("Значение", text: $viewModel.value)
                .keyboardType(.decimalPad)

            TextField("Действие", text: $viewModel.actionDescription)

            Button("Сохранить") {
                viewModel.save()
                router.pop()
            }
        }
        .navigationTitle("Create Trigger")
    }
    
}

#Preview {
    CreateTriggerScreen(router: Router(), viewModel: CreateTriggerViewModel(triggerManager: TriggerManager(storage: StorageManager())))
}
