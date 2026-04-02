import SwiftUI

struct RouterView: View {

    @Bindable var router: Router
    let triggerManager: TriggerManager
    let api: APIServiceProtocol

    var body: some View {
        NavigationStack(path: $router.path) {
            
            RootCarouselView(
                router: router,
                triggerManager: triggerManager,
                api: api
            )
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .portfolio:
                    PortfolioScreen(router: router)
                    
                case .settings:
                    SettingsScreen(router: router)
                    
                case .triggers:
                    TriggersListScreen(
                        router: router,
                        viewModel: TriggerListViewModel(triggerManager: triggerManager)
                    )
                    
                case .createTrigger:
                    CreateTriggerScreen(
                        router: router,
                        viewModel: CreateTriggerViewModel(triggerManager: triggerManager)
                    )
                    
                case .dashboard:
                    DashboardScreen(
                        router: router,
                        viewModel: DashboardViewModel(api: api))
                }
            }
        }
    }
}

