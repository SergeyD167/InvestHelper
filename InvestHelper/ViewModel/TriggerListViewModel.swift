import Foundation

final class TriggerListViewModel: ObservableObject {
    @Published var triggers: [Trigger] = []

    private let triggerManager: TriggerManager

    init(triggerManager: TriggerManager) {
        self.triggerManager = triggerManager
        self.triggers = triggerManager.triggers
    }
}
