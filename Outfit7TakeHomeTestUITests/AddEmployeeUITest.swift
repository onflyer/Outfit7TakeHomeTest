//
//  AddEmployeeUITest.swift
//  Outfit7TakeHomeTestUITests
//
//  Created by Aleksandar Milidrag on 17. 11. 2024..
//

import XCTest

final class AddEmployeeUITest: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app = nil
    }
    
    func testListNavigation() throws {
        
    }
}
