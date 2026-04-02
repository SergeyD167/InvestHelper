import SwiftUI

struct RootCarouselView: View {
    
    let router: Router
    let triggerManager: TriggerManager
    let api: APIServiceProtocol
    
    @State private var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
            
            PortfolioScreen(router: router)
                .padding(.horizontal, 20)
                .tag(0)
            
            DashboardScreen(
                router: router,
                viewModel: DashboardViewModel(api: api)
            )
            .padding(.horizontal, 20)
            .tag(1)
            
            TriggersListScreen(
                router: router,
                viewModel: TriggerListViewModel(triggerManager: triggerManager)
            )
            .padding(.horizontal, 20)
            .tag(2)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}
