import SwiftUI

struct RouterView: View {

    @Bindable var router: Router

    var body: some View {
        NavigationStack(path: $router.path) {
            PortfolioScreen()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .portfolio: PortfolioScreen()
                    case .settings: SettingsScreen()
                    case .triggers: TriggersListScreen()
                    case .createTrigger: CreateTriggerScreen()
                    }
                }
        }
        .environment(router)
    }
}

