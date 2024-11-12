//
//  CoreDataService.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 11. 11. 2024..
//

import Foundation
import CoreData

class CoreDataService {
    
    public static let modelName = "EmployeeCoreDataModel"
    public static let model: NSManagedObjectModel = {
        let modelURL = Bundle.main.url(forResource: modelName, withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    public init() {}
    
    public lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: CoreDataService.modelName, managedObjectModel: CoreDataService.model)
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    public lazy var mainContext: NSManagedObjectContext = {
        return self.storeContainer.viewContext
    }()
    
    public func newBackgroundContext() -> NSManagedObjectContext {
        let context = storeContainer.newBackgroundContext()
        return context
    }
    
    public func saveDerivedContext(_ context: NSManagedObjectContext) {
        context.perform { [weak self] in
            do {
                try context.save()
            } catch let error as NSError {
                assertionFailure("Unresolved error \(error), \(error.userInfo)")
            }
            guard let self else {
                return
            }
            self.saveContext(self.mainContext)
        }
    }
    
    public func saveContext(_ context: NSManagedObjectContext) {
        if context != mainContext {
            saveDerivedContext(context)
            return
        }
        
        context.perform {
            do {
                try context.save()
            } catch let error as NSError {
                assertionFailure("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    public func saveContext() {
        saveContext(mainContext)
    }
}
