//
//  EmployeesLocalRepository.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 11. 11. 2024..
//

import Foundation

class EmployeesLocalRepository {
    
    let repository: LocalEmployeeDataSource
    
    init(repository: LocalEmployeeDataSource) {
        self.repository = repository
    }
    
    func getEmployees() async throws -> [EmployeeDomainModel] {
        let result = try await repository.getEmployees()
        return result
    }
    
    func addEmployee(employee: EmployeeDomainModel) async {
        do {
            try await repository.addEmployee(employee: employee)
        } catch {
            print("Local DS: \(error.localizedDescription)")
        }
    }
    
    func removeEmployee(employee: EmployeeDomainModel) async {
        do {
            try await repository.removeEmployee(employee: employee)
        } catch {
            print("Local DS: \(error.localizedDescription)")
        }
    }
    
    func updateEmployee(employee: EmployeeDomainModel) async {
        do {
            try repository.updateEmployee(employee: employee)
        } catch {
            print("Local DS: \(error.localizedDescription)")
        }
    }
}
