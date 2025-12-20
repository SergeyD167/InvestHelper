final class NotificationManager {
    static let shared = NotificationManager()

    func sendTriggerNotification(_ trigger: Trigger) {
        // UNUserNotificationCenter
    }

    func sendCryptoNotification(token: CryptoToken, price: Double) {
        // UNUserNotificationCenter
    }
}
