struct MarketSnapshot {
    let brent: Double?
    let usdRub: Double?
    let moex: Double?
    let keyRate: Double?
    let cryptoPrices: [String: Double]
    
    func value(for source: TriggerSource) -> Double? {
        switch source {
        case .brent: return brent
        case .usdRub: return usdRub
        case .moex: return moex
        case .keyRate: return keyRate
        case .crypto: return nil
        }
    }
}
