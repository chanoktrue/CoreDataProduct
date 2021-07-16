//
//  Persistent.swift
//  CoreDataRelationship02
//
//  Created by Thongchai Subsaidee on 15/7/2564 BE.
//

import CoreData

class PersistentController {
    
    static let shared = PersistentController()
    
    let container: NSPersistentContainer
    let viewContext: NSManagedObjectContext
    
    private init() {
        container = NSPersistentCloudKitContainer(name: "Database")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unable load databae with error: \(error.localizedDescription)")
            }
        }
        viewContext = container.viewContext
        
        viewContext.automaticallyMergesChangesFromParent = true
        viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
    
    func save(message: String) {
        do{
            try viewContext.save()
            print(message)
        }catch{
            print("Save error: \(error.localizedDescription)")
        }
    }
    
    func save2(complete: @escaping (Bool) -> ()) {
        do{
            try viewContext.save()
            complete(true)
        }catch{
            viewContext.rollback()
            complete(false)
        }
    }
    
}
