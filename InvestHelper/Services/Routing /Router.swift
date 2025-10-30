//
//  Router.swift
//  InvestHelper
//
//  Created by Сергей Дятлов on 30.10.2025.
//

import Foundation
import SwiftUI

@Observable
final class Router {
    var path: [AppRoute] = []

    func push(_ route: AppRoute) { path.append(route) }
    func pop() { _ = path.popLast() }
    func popToRoot() { path.removeAll() }
}
