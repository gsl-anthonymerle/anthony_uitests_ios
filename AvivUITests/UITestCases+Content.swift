import AvivComposableArchitecture
import SwiftUI
import UITestCases

extension UITestCases {
    @ViewBuilder
    var content: some View {
        switch self {
        case .formatedDSTextField:
            DSTextFieldFormattedTestView()
        case .formValidationTextOnly:
            FormValidationTextOnlyTestView(
                store: Store(
                    initialState: FormValidationTextOnlyTest.State(),
                    reducer: FormValidationTextOnlyTest.init
                )
            )
        }
    }
}
