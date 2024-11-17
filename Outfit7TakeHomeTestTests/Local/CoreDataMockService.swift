//
//  Outfit7TakeHomeTestTests.swift
//  Outfit7TakeHomeTestTests
//
//  Created by Aleksandar Milidrag on 17. 11. 2024..
//

import XCTest
import Foundation
import CoreData
@testable import Outfit7TakeHomeTest

class CoreDataMockService: CoreDataService {
    
    override init() {
        super.init()
        
        let container = NSPersistentContainer(name: CoreDataService.modelName,
                                              managedObjectModel: CoreDataService.model)
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        container.persistentStoreDescriptions = [description]
        
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        self.storeContainer = container
    }
}
