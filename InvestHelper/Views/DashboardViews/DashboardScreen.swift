import SwiftUI

struct DashboardScreen: View {

    let router: Router
    @Bindable var viewModel: DashboardViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    
                    header
                    
                    VStack(spacing: 12) {
                        metricCard(title: "Brent", value: viewModel.snapshot?.brent)
                        metricCard(title: "USD/RUB", value: viewModel.snapshot?.usdRub)
                        metricCard(title: "MOEX", value: viewModel.snapshot?.moex)
                        metricCard(title: "Key Rate", value: viewModel.snapshot?.keyRate)
                    }
                }
                .padding()
                .refreshable {
                    await viewModel.refresh()
                }
            }
            .navigationTitle("Dashboard")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        router.push(.settings)
                    } label: {
                        Image(systemName: "gearshape")
                    }
                }
            }
            .task {
                await viewModel.refresh()
            }
        }
    }
    
    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Market Overview")
                    .font(.title2)
                    .bold()
                
                Text("Live data snapshot")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
    }

    private func metricCard(title: String, value: Double?) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text(title)
                .font(.headline)
            
            Text(value.map { String(format: "%.2f", $0) } ?? "—")
                .font(.title3)
                .bold()
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    DashboardScreen(router: Router(), viewModel: DashboardViewModel(api: APIService()))
}
