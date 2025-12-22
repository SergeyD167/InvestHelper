import SwiftUI

struct SettingsScreen: View {
    let router: Router
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Settings").font(.largeTitle)
            Button("Back") {
                router.pop()
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    SettingsScreen(router: Router())
}
