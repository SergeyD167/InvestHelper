protocol APIServiceProtocol {
    func fetchMetrics(_ metrics: [Metric]) async -> [Metric: Double]
    func fetchAllMetrics() async -> [Metric: Double]
}

