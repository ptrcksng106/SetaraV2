//
//  DataManager.swift
//  SetaraV2
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 02/09/23.
//

import CoreData

class DataManager: NSObject, ObservableObject {
    @Published var participants: [ParticipantModel] = [ParticipantModel]()
    
    let container: NSPersistentContainer = NSPersistentContainer(name: "Participants")
    
    override init() {
        super.init()
        container.loadPersistentStores{ _, _ in
            
        }
    }
}
