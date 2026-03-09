import SwiftUI

struct PortfolioScreen: View {
    let router: Router

    var body: some View {
        VStack(spacing: 20) {
            Text("Portfolio").font(.largeTitle)
            Button("Back") {
                router.pop()
            }

        }
        .navigationBarHidden(true)
    }
}

#Preview {
    PortfolioScreen(router: Router())
}
