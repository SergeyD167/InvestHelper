final class CryptoManager {
    
    private let storage: StorageManager

    private(set) var tokens: [CryptoToken] = []

    init(storage: StorageManager) {
        self.storage = storage
        self.tokens = storage.loadCryptoTokens()
    }

    func checkTokens(prices: [String: Double]) -> [CryptoToken] {
        tokens.filter { token in
            guard let price = prices[token.symbol] else { return false }

            if let tp = token.takeProfit, price >= tp { return true }
            if let sl = token.stopLoss, price <= sl { return true }

            return false
        }
    }

    func addToken(_ token: CryptoToken) {
        tokens.append(token)
        storage.saveCryptoTokens(tokens)
    }

    func removeToken(symbol: String) {
        tokens.removeAll { $0.symbol == symbol }
        storage.saveCryptoTokens(tokens)
    }
    
    func synchronization() {
        
    }
}
