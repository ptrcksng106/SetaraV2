//
//  RouterViewModel.swift
//  SetaraV2
//
//  Created by bernardus kanayari on 01/09/23.
//

import Foundation
import SwiftUI

enum Destination {
    case detailSpendingView
    case resultSpendingView
}

class Router: ObservableObject {
    @Published var path: [Destination] = []

    func popToRoot() {
        path.removeLast(path.count)
    }

    func popToSomeView(view: Destination) {
        if let pageIndex = path.firstIndex(of: view) {
            path.removeLast(path.count - (pageIndex + 1))
        } else {
            print("Index not found")
        }
    }
}

class ViewFactory {
    @ViewBuilder
    static func viewForDestination(_ destination: Destination) -> some View {
        switch destination {
        case .detailSpendingView:
            DetailSpendingView()
        case .resultSpendingView:
            ResultSpendingView()
        }
    }
}
