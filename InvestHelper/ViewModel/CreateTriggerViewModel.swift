import Foundation
import Observation

@Observable
final class CreateTriggerViewModel {
    
    private let triggerManager: TriggerManager
    
    var source: TriggerSource = .brent
    var conditionType: TriggerConditionType = .greaterThan
    var value: String = ""
    var actionDescription: String = ""
    var signalType: TriggerSignalType = .buy
    
    init(triggerManager: TriggerManager) {
        self.triggerManager = triggerManager
    }
    
    func save() {
        guard let value = Double(value) else { return }
        
        let trigger = Trigger(
            id: UUID(),
            source: source,
            condition: TriggerCondition(
                type: conditionType,
                value: value
            ),
            actionDescription: actionDescription,
            signalType: signalType,
            isActive: true,
            createdAt: Date()
            )
            
        triggerManager.addTrigger(trigger)
    }
}

