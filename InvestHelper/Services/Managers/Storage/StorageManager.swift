final class StorageManager {
    
    func saveTriggers(_ triggers: [Trigger]) {}
    func loadTriggers() -> [Trigger] { [] }

    func saveCryptoTokens(_ tokens: [CryptoToken]) {}
    func loadCryptoTokens() -> [CryptoToken] { [] }
}
