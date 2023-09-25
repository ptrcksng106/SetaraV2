//
//  SetaraV2App.swift
//  SetaraV2
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 28/08/23.
//

import SwiftUI

@main
struct SetaraV2App: App {
    
    @State private var manager: DataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            AddNewBillView()
                .environmentObject(manager)
                .environment(\.managedObjectContext, manager.container.viewContext)
                .environment(\.colorScheme, .dark)
        }
    }
}
