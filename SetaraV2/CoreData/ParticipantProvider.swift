//
//  ParticipantProvider.swift
//  SetaraV2
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 02/09/23.
//

import CoreData
import SwiftUI

class ParticipantProvider {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Participants")
        
        container.loadPersistentStores { _, error in
            guard error == nil else {
                fatalError("Unresolved error \(error!)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = false
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.shouldDeleteInaccessibleFaults = true
        container.viewContext.undoManager = nil
        
        return container
    }()
    
    private func newTaskContext() -> NSManagedObjectContext {
        let taskContext = persistentContainer.newBackgroundContext()
        taskContext.undoManager = nil
        
        taskContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return taskContext
    }
    
    func getAllParticipant(completion: @escaping(_ participants: [ParticipantModel]) -> Void) {
        let taskContext = newTaskContext()
        taskContext.perform {
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Participant")
            do {
                let results = try taskContext.fetch(fetchRequest)
                var participants: [ParticipantModel] = []
                for result in results {
                    let participant = ParticipantModel(name: result.value(forKeyPath: "name") as? String)
                    
                    participants.append(participant)
                }
                completion(participants)
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
    }
    
    func createParticipant(_ name: String, completion: @escaping() -> Void) {
        let taskContext = newTaskContext()
        taskContext.performAndWait {
            if let entity = NSEntityDescription.entity(forEntityName: "Participant", in: taskContext) {
                let participant = NSManagedObject(entity: entity, insertInto: taskContext)
                participant.setValue(name, forKeyPath: "name")
                do {
                    try taskContext.save()
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
            }
        }
    }
    
//    func updateParticipant(_ name: String, completion: @escaping() -> Void) {
//        let taskContext = newTaskContext()
//        taskContext.perform {
//            let fetchRequest
//        }
//    }
    
    func deleteAllParticipant(completion: @escaping() -> Void) {
        let taskContext = newTaskContext()
        taskContext.perform {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Participant")
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            batchDeleteRequest.resultType = .resultTypeCount
            if let batchDeleteResult = try? taskContext.execute(batchDeleteRequest) as? NSBatchDeleteResult {
                if batchDeleteResult.result != nil {
                    completion()
                }
            }
        }
    }
}
