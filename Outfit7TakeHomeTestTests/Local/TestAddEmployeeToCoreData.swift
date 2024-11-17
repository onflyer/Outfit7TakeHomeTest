//
//  Outfit7HomeTestUnitTests.swift
//  Outfit7TakeHomeTestTests
//
//  Created by Aleksandar Milidrag on 17. 11. 2024..
//

import XCTest
@testable import Outfit7TakeHomeTest

final class TestAddEmployeeToCoreData: XCTestCase {

    func test_addEmployeeToCoreData() {
        let service = CoreDataMockService()
        let sut = LocalEmployeeDataSource(coreDataService: CoreDataMockService())
        
        let fakeEmployee = EmployeeDomainModel(id: UUID(), name: "testName", lastName: "testLastName", age: 30, gender: .male)
        
        let derivedContext = service.newBackgroundContext()
        
        _ = fakeEmployee.toCoreDataEntity(in: derivedContext)
        
        try? derivedContext.save()
        
        do {
            let addedEmployee = try sut.getOneEmployee(id: fakeEmployee.id)
            if let unwrapped = addedEmployee?.id {
                XCTAssertEqual(fakeEmployee.id, unwrapped)
            }
            
        } catch {
            XCTFail("Expected success, but got failure: \(error)")
        }
        
        
    }

}
