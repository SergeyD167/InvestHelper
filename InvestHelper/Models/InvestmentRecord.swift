import Foundation

struct InvestmentRecord: Identifiable, Codable {
    let id: UUID
    let date: Date
    let amount: Double
    let comment: String?
}
