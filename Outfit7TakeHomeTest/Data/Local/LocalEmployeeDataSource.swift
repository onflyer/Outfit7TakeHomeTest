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
    
    func addEmployee(employee: EmployeeDomainModel) async throws {
       let result = employee.toCoreDataEntity(in: managedObjectContext)
        await managedObjectContext.perform {
            self.coreDataService.saveContext()
        }
    }
    
    func removeEmployee(employee: EmployeeDomainModel) async throws {
        let fetchRequest = EmployeeCoreDataEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id_ == %@", employee.id as CVarArg)
        let results = try managedObjectContext.fetch(fetchRequest)
        results.forEach { managedObjectContext.delete($0) }
        coreDataService.saveContext()
    }
    
    func updateEmployee(employee: EmployeeDomainModel) throws {
        let fetchRequest = EmployeeCoreDataEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id_ == %@", employee.id as CVarArg)
        let result = try managedObjectContext.fetch(fetchRequest)
        result.forEach { oldEmployee in
            oldEmployee.name = employee.name
            oldEmployee.lastName = employee.lastName
            oldEmployee.age = employee.age
            oldEmployee.gender = employee.gender.rawValue
            coreDataService.saveContext()
        }
        
    }
}
