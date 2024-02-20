//
//  FormValidationTextOnlyTests.swift
//  AvivUITestsUITests
//
//  Created by Anthony MERLE on 20/02/2024.
//

import XCTest
import UITestCases

final class FormValidationTextOnlyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFormWithTextOnly() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication(testCase: .formValidationTextOnly)
        app.launch()

        let firstNameField = app.textFields["FirstName"]
        let lastNameField = app.textFields["LastName"]
        let firstNameError = app.staticTexts["FirstName.error"]
        let lastNameError = app.staticTexts["LastName.error"]
        let submitButton = app.buttons["Submit"]

        XCTAssertTrue(firstNameField.exists)
        XCTAssertTrue(lastNameField.exists)
        XCTAssertFalse(firstNameError.exists)
        XCTAssertFalse(lastNameError.exists)

        submitButton.tap()

        XCTAssertTrue(firstNameError.exists)
        XCTAssertEqual(firstNameError.label, "First name should be at least 10 characters long")
        XCTAssertFalse(lastNameError.exists)
    }
}
