final class MockDataProvider: DataProviderProtocol {
    func fetchMarketSnapshot() async throws -> MarketSnapshot {
        MarketSnapshot(
            brent: 76.4,
            usdRub: 92.1,
            moex: 3200,
            keyRate: 16.0,
            btc: 120000.0
        )
    }

    func fetchCryptoPrice(symbol: String) async throws -> Double {
        42000
    }
}
