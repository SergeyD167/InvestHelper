import Foundation
import Observation

@Observable
final class TriggerListViewModel {
    
    private let triggerManager: TriggerManager
    
    var triggers: [Trigger] = []

    init(triggerManager: TriggerManager) {
        self.triggerManager = triggerManager
        self.triggers = triggerManager.triggers
    }
    
    func addTrigger(_ trigger: Trigger) {
        triggerManager.addTrigger(trigger)
        triggers = triggerManager.triggers
    }

    func removeTrigger(id: UUID) {
        triggerManager.removeTrigger(id: id)
        triggers = triggerManager.triggers
    }
}
