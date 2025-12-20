enum TriggerEvaluator {
    static func evaluate(_ trigger: Trigger, with data: MarketSnapshot) -> Bool {
        guard let value = data.value(for: trigger.source) else {
            return false
        }

        switch trigger.condition.type {
        case .greaterThan:
            return value > trigger.condition.value
        case .lessThan:
            return value < trigger.condition.value
        case .trendUpDays:
            return data.isUptrend(source: trigger.source,
                                   days: trigger.condition.days ?? 1)
        case .trendDownDays:
            return data.isDowntrend(source: trigger.source,
                                     days: trigger.condition.days ?? 1)
        }
    }
}
