import SwiftUI

struct RouterView: View {

    @Bindable var router: Router
    let triggerManager: TriggerManager

    var body: some View {
        NavigationStack(path: $router.path) {
            PortfolioScreen(router: router)
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .portfolio: PortfolioScreen(router: router)
                    case .settings: SettingsScreen(router: router)
                    case .triggers: TriggersListScreen(router: router,
                                                       viewModel: TriggerListViewModel(triggerManager: triggerManager))
                    case .createTrigger: CreateTriggerScreen(router: router,
                                                             viewModel: CreateTriggerViewModel(triggerManager: triggerManager))
                    }
                }
        }
    }
}

