import Foundation

struct CryptoToken: Identifiable, Codable {
    let id: UUID
    let symbol: String
    let entryPrice: Double
    let takeProfit: Double?
    let stopLoss: Double?
    let isActive: Bool
}
