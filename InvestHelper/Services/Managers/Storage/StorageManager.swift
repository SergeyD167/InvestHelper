final class StorageManager {
    static let shared = StorageManager()

    func saveTriggers(_ triggers: [Trigger]) {}
    func loadTriggers() -> [Trigger] { [] }

    func saveCryptoTokens(_ tokens: [CryptoToken]) {}
    func loadCryptoTokens() -> [CryptoToken] { [] }
}
