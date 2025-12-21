final class AppContainer {

    let router: Router
    let storageManager: StorageManager
    let triggerManager: TriggerManager
    let cryptoManager: CryptoManager

    init() {
        self.router = Router()
        self.storageManager = StorageManager()
        self.triggerManager = TriggerManager(storage: storageManager)
        self.cryptoManager = CryptoManager(storage: storageManager)
    }
}
