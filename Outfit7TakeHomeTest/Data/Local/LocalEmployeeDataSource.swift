//
//  LocalEmployeeDataSource.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 11. 11. 2024..
//

import Foundation
import CoreData

class LocalEmployeeDataSource {
    
    private let coreDataService: CoreDataService
    
    init(coreDataService: CoreDataService) {
        self.coreDataService = coreDataService
    }
    
    private var managedObjectContext: NSManagedObjectContext {
        coreDataService.mainContext
    }
    
    func getEmployees() async throws -> [EmployeeDomainModel] {
        let result = try await managedObjectContext.perform {
            let fetchRequest = EmployeeCoreDataEntity.fetchRequest()
            let employees = try self.managedObjectContext.fetch(fetchRequest)
            return employees
        }
        return result.map { employees in
            employees.toDomain()
        }
    }
}
