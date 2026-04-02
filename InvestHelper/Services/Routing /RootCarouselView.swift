import SwiftUI

struct RootCarouselView: View {
    
    let router: Router
    let triggerManager: TriggerManager
    let api: APIServiceProtocol
    
    @State private var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
            
            PortfolioScreen(router: router)
                .tag(0)
            
            DashboardScreen(
                router: router,
                viewModel: DashboardViewModel(api: api)
            )
            .tag(1)
            
            TriggersListScreen(
                router: router,
                viewModel: TriggerListViewModel(triggerManager: triggerManager)
            )
            .tag(2)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}
