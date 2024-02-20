//
//  AvivUITestsUITests.swift
//  AvivUITestsUITests
//
//  Created by Anthony MERLE on 29/01/2024.
//

import XCTest
import UITestCases

final class DSTextFieldTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication(testCase: .formatedDSTextField)
        app.launch()

        
        let stringTextField = app.textFields["String Text field"]
        XCTAssertEqual(stringTextField.value as! String, "Some value")

        let decimalTextField = app.textFields["Decimal Text field"] 
        XCTAssertEqual(decimalTextField.value as! String, "100")
    }
}
