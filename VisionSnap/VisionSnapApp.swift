//
//  VisionSnapApp.swift
//  VisionSnap
//
//  Created by WONG YI HUNG on 2023/6/23.
//

import SwiftUI
import CoreData

@main
struct VisionSnapApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

class PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "VisionSnap")
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        let description = NSPersistentStoreDescription()
        description.shouldMigrateStoreAutomatically = true
        description.shouldInferMappingModelAutomatically = true
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
