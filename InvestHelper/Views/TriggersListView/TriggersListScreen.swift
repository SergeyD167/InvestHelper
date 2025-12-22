import SwiftUI

struct TriggersListScreen: View {
    let router: Router
    @Bindable var viewModel: TriggerListViewModel

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
                        router.push(.createTrigger)
                    }
                    .padding()
                }
                Spacer()
            }
            VStack {
                Text("Triggers").font(.largeTitle)
                List(viewModel.triggers) { trigger in
                    Text(trigger.actionDescription)
                }
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    TriggersListScreen(router: Router(), viewModel: TriggerListViewModel(triggerManager: TriggerManager(storage: StorageManager())))
}
