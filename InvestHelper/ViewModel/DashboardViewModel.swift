import Foundation
import Observation

@Observable
class DashboardViewModel {
    private let api: APIServiceProtocol
    var snapshot: MarketSnapshot?

    init(api: APIServiceProtocol) {
        self.api = api
    }

    func refresh() async {
        let metrics = await api.fetchAllMetrics()
        snapshot = MarketSnapshot(
            brent: metrics[.brent],
            usdRub: metrics[.usdRub],
            moex: metrics[.imoex],
            keyRate: metrics[.keyRate],
            btc: metrics[.btc]
        )
    }
}
