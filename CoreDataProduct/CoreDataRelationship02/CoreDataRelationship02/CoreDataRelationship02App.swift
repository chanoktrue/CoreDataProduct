//
//  CoreDataRelationship02App.swift
//  CoreDataRelationship02
//
//  Created by Thongchai Subsaidee on 15/7/2564 BE.
//

import SwiftUI

@main
struct CoreDataRelationship02App: App {
    
    let persistentController = PersistentController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
//            BrandDetailView()
                .environment(\.managedObjectContext, persistentController.viewContext)
        }
    }
}
