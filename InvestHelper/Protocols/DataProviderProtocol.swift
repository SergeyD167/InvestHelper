protocol DataProviderProtocol {
    func fetchMarketSnapshot() async throws -> MarketSnapshot
    func fetchCryptoPrice(symbol: String) async throws -> Double
}
