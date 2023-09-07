//
//  RouterViewModel.swift
//  SetaraV2
//
//  Created by bernardus kanayari on 01/09/23.
//

import Foundation
import SwiftUI

enum Destination: Hashable{
    case addItemView
}

class Router: ObservableObject {
    @Published var path: [Destination] = []

    func popToRoot() {
        path.removeLast(path.count)
    }
}

class ViewFactory {
    @ViewBuilder
    static func viewForDestination(_ destination: Destination) -> some View {
        switch destination {
        case .addItemView:
            AddItemView()
        }
    }
}
