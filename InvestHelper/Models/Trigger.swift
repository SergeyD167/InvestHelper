import Foundation

struct Trigger: Identifiable, Codable {
    let id: UUID
    let source: TriggerSource
    let condition: TriggerCondition
    let actionDescription: String
    let signalType: TriggerSignalType
    let isActive: Bool
    let createdAt: Date
}

struct TriggerCondition: Codable {
    let type: TriggerConditionType
    let value: Double
}


enum TriggerSource: String, Codable {
    case brent
    case usdRub
    case moex
    case keyRate
    case crypto
}

enum TriggerSignalType: String, Codable {
    case buy
    case sell
}

enum TriggerConditionType: String, Codable {
    case greaterThan
    case lessThan
}
