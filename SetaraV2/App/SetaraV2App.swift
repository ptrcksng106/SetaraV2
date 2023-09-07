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
<<<<<<< HEAD:SetaraV2/App/SetaraV2App.swift
            MainView()
                .environmentObject(manager)
                .environment(\.managedObjectContext, manager.container.viewContext)
=======
//            MainView()
            AddNewBillView()
>>>>>>> AddNewBill:SetaraV2/SetaraV2App.swift
        }
    }
}
