import SwiftUI

struct RouterView: View {

    @Bindable var router: Router

    var body: some View {
        NavigationStack(path: $router.path) {
            PortfolioScreen(router: router)
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .portfolio: PortfolioScreen(router: router)
                    case .settings: SettingsScreen(router: router)
                    case .triggers: TriggersListScreen(router: router)
                    case .createTrigger: CreateTriggerScreen(router: router)
                    }
                }
        }
    }
}

