//
//  Outfit7HomeTestUnitTests.swift
//  Outfit7TakeHomeTestTests
//
//  Created by Aleksandar Milidrag on 17. 11. 2024..
//

import XCTest
@testable import Outfit7TakeHomeTest

final class TestEmployeeDomainModel: XCTestCase {

    func test_EmployeeDomainModel_canCreateAnInstance() {
        let instance = EmployeeDomainModel(id: UUID(), name: "testName", lastName: "testLastName", age: 30, gender: .male)
        
        XCTAssertNotNil(instance) 
    }
 
}
