import Foundation

final class TriggerManager {
    
    private let storage: StorageManager
    
    private(set) var triggers: [Trigger] = []
    
    init(storage: StorageManager) {
        self.storage = storage
        self.triggers = storage.loadTriggers()
    }

    func addTrigger(_ trigger: Trigger) {
        triggers.append(trigger)
        storage.saveTriggers(triggers)
    }

    func removeTrigger(id: UUID) {
        triggers.removeAll { $0.id == id }
        storage.saveTriggers(triggers)
    }

    func checkTriggers(marketData: MarketSnapshot) -> [Trigger] {
        triggers.filter { trigger in
            TriggerEvaluator.evaluate(trigger, with: marketData)
        }
    }
}
