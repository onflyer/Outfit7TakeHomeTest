//
//  LocalEmployeeDataSourceProtocol.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 11. 11. 2024.
//

import Foundation

protocol LocalEmployeeDataSourceProtocol {
    func getEmployees() async throws -> [EmployeeDomainModel]
    func getOneEmployee(id: UUID) throws -> EmployeeDomainModel? 
    func addEmployee(employee: EmployeeDomainModel) async throws 
    func removeEmployee(employee: EmployeeDomainModel) async throws 
    func updateEmployee(employee: EmployeeDomainModel) throws
}
