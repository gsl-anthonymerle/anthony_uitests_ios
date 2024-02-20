import XCTest
import UITestCases

extension XCUIApplication {
    convenience init(testCase: UITestCases) {
        self.init()

        launchArguments.append(UITestCases.appLaunchArgument)
        launchArguments.append(testCase.rawValue)
    }
}
