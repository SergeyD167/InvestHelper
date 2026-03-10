final class AppContainer {

    let router: Router
    let storageManager: StorageManager
    let triggerManager: TriggerManager
    let cryptoManager: CryptoManager
    let apiservice: APIServiceProtocol

    init() {
        self.router = Router()
        self.storageManager = StorageManager()
        self.triggerManager = TriggerManager(storage: storageManager)
        self.cryptoManager = CryptoManager(storage: storageManager)
        self.apiservice = APIService()
    }
}
