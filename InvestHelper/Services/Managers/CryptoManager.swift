import Foundation

final class CryptoManager: ObservableObject {
    @Published private(set) var tokens: [CryptoToken] = []

    func checkTokens(prices: [String: Double]) -> [CryptoToken] {
        tokens.filter { token in
            guard let price = prices[token.symbol] else { return false }

            if let tp = token.takeProfit, price >= tp {
                return true
            }

            if let sl = token.stopLoss, price <= sl {
                return true
            }

            return false
        }
    }
}
