import Foundation

final class TriggerManager: ObservableObject {
    @Published private(set) var triggers: [Trigger] = []

    func addTrigger(_ trigger: Trigger) {
        triggers.append(trigger)
        StorageManager.shared.saveTriggers(triggers)
    }

    func removeTrigger(id: UUID) {
        triggers.removeAll { $0.id == id }
        StorageManager.shared.saveTriggers(triggers)
    }

    func checkTriggers(marketData: MarketSnapshot) -> [Trigger] {
        triggers.filter { trigger in
            TriggerEvaluator.evaluate(trigger, with: marketData)
        }
    }
}
