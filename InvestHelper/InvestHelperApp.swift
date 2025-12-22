import SwiftUI

@main
struct InvestHelperApp: App {
    
    let container = AppContainer()
    
    var body: some Scene {
        WindowGroup {
            RouterView(router: container.router, triggerManager: container.triggerManager)
        }
    }
}
