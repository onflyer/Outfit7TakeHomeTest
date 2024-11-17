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
    
    func testAddEmployeeProcess() throws {
        
        let app = XCUIApplication()
        app.navigationBars["Employees"]/*@START_MENU_TOKEN@*/.buttons["Add"]/*[[".otherElements[\"Stats\"].buttons[\"Add\"]",".buttons[\"Add\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.navigationBars.buttons["Add"].exists)
        
        let collectionViewsQuery = app.collectionViews
        let enterEmployeeSNameTextField = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Enter employee's name"]/*[[".cells.textFields[\"Enter employee's name\"]",".textFields[\"Enter employee's name\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(enterEmployeeSNameTextField.exists)
        enterEmployeeSNameTextField.tap()
        enterEmployeeSNameTextField.typeText("Test")
        
        let enterEmployeeSLastNameTextField = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Enter employee's last name"]/*[[".cells.textFields[\"Enter employee's last name\"]",".textFields[\"Enter employee's last name\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(enterEmployeeSLastNameTextField.exists)
        enterEmployeeSLastNameTextField.tap()
        enterEmployeeSLastNameTextField.tap()
        enterEmployeeSLastNameTextField.typeText("Test")
        XCTAssertTrue(app.buttons["Done"].exists)
        app.navigationBars["Add employee"]/*@START_MENU_TOKEN@*/.buttons["Done"]/*[[".otherElements[\"Done\"].buttons[\"Done\"]",".buttons[\"Done\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
}
