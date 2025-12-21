import Observation

@Observable
final class Router {
    var path: [AppRoute] = []

    func push(_ route: AppRoute) { path.append(route) }
    func pop() { _ = path.popLast() }
    func popToRoot() { path.removeAll() }
}
