//
//  EmployeesLocalRepository.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 11. 11. 2024..
//

import Foundation

class EmployeesLocalRepository {
    
    let dataSource: LocalEmployeeDataSource
    
    init(dataSource: LocalEmployeeDataSource) {
        self.dataSource = dataSource
    }
    
    func getEmployees() async throws -> [EmployeeDomainModel] {
        let result = try await dataSource.getEmployees()
        return result
    }
    
    func getOneEmployee(employee: EmployeeDomainModel) -> EmployeeDomainModel? {
       try? dataSource.getOneEmployee(employee: employee)
    }
    
    func addEmployee(employee: EmployeeDomainModel) async throws {
        do {
            try await dataSource.addEmployee(employee: employee)
        } catch {
            print("Local DS: \(error.localizedDescription)")
        }
    }
    
    func removeEmployee(employee: EmployeeDomainModel) async {
        do {
            try await dataSource.removeEmployee(employee: employee)
        } catch {
            print("Local DS: \(error.localizedDescription)")
        }
    }
    
    func updateEmployee(employee: EmployeeDomainModel) throws {
        do {
            try dataSource.updateEmployee(employee: employee)
        } catch {
            print("Local DS: \(error.localizedDescription)")
        }
    }
}
