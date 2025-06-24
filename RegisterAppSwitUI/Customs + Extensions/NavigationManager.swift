//
//  NavigationManager.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 24/06/2025.
//


import SwiftUI

class NavigationManager: ObservableObject {
    @Published var path: [Route] = []

    enum Route: Hashable {
        case firstStep
    }

    func push(_ route: Route) {
        path.append(route)
    }

    func pop() {
        _ = path.popLast()
    }

    func popToRoot() {
        path.removeAll()
    }
}
