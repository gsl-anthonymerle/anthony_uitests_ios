//
//  AvivUITestsApp.swift
//  AvivUITests
//
//  Created by Anthony MERLE on 29/01/2024.
//

import SwiftUI
import UITestCases

@main
struct AvivUITestsApp: App {
    var appLaunchArguments: [String] {
        ProcessInfo.processInfo.arguments
    }

    var isUITestsActivated: Bool {
        appLaunchArguments.contains(UITestCases.appLaunchArgument)
    }

    var body: some Scene {
        WindowGroup {
            if isUITestsActivated {
                if let testCase = UITestCases
                    .allCases
                    .first(where: { appLaunchArguments.contains($0.rawValue) }) {
                    testCase.content
                } else {
                    NoTestCaseFoundView(launchArguments: appLaunchArguments)
                }
            } else {
                ContentView()
            }
        }
    }
}
