//
//  NoTestCaseFoundView.swift
//  AvivUITests
//
//  Created by Anthony MERLE on 30/01/2024.
//

import SwiftUI

struct NoTestCaseFoundView: View {
    let launchArguments: [String]

    var body: some View {
        List {
            Text("No test case found")
            Section("Launch arguments") {
                ForEach(launchArguments, id: \.self) {
                    Text($0)
                }
            }
        }
    }
}

#Preview {
    NoTestCaseFoundView(
        launchArguments: (1..<10)
            .map({ "Argument\($0)" })
    )
}
