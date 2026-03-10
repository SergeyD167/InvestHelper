import SwiftUI

struct DashboardScreen: View {

    let router: Router
    @Bindable var viewModel: DashboardViewModel
    
    var body: some View {
        Text("Dashboard")
        Button("Go to Settings") {
            router.push(.settings)
        }
        Button("Go to Triggers") {
            router.push(.triggers)
        }
        Button("Go to Portfolio") {
            router.push(.portfolio)
        }
        
        VStack {
            Text("Brent: \(viewModel.snapshot?.brent ?? 0)")
            Text("USD/RUB: \(viewModel.snapshot?.usdRub ?? 0)")
            Text("MOEX: \(viewModel.snapshot?.moex ?? 0)")
            Text("Key Rate: \(viewModel.snapshot?.keyRate ?? 0)")
        }
        .task {
            await viewModel.refresh()
        }
    }
}

#Preview {
    DashboardScreen(router: Router(), viewModel: DashboardViewModel(api: APIService()))
}
