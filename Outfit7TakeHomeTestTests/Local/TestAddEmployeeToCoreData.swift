//
//  Outfit7HomeTestUnitTests.swift
//  Outfit7TakeHomeTestTests
//
//  Created by Aleksandar Milidrag on 17. 11. 2024..
//

import XCTest
@testable import Outfit7TakeHomeTest

final class TestAddEmployeeToCoreData: XCTestCase {
    
    func test_addEmployeeToCoreData() async {
        let service = CoreDataMockService()
        let sut = LocalEmployeeDataSource(coreDataService: service)
        
        let fakeEmployee = EmployeeDomainModel(id: UUID(), name: "testName", lastName: "testLastName", age: 30, gender: .male)
        
        try? await sut.addEmployee(employee: fakeEmployee)
        
        do {
            let addedEmployee = try sut.getOneEmployee(id: fakeEmployee.id)
            XCTAssertEqual(fakeEmployee.id, addedEmployee?.id)
            
        } catch {
            XCTFail("Expected success, but got failure: \(error)")
        }
    }
}
