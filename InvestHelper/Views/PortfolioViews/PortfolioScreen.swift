import SwiftUI

struct PortfolioScreen: View {
    let router: Router

    var body: some View {
        VStack(spacing: 20) {
            Text("Portfolio").font(.largeTitle)
            Button("Go to Settings") {
                router.push(.settings)
            }
            Button("Go to Triggers") {
                router.push(.triggers)
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    PortfolioScreen(router: Router())
}
