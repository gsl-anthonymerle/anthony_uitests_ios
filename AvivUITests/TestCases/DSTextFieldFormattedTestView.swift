import SwiftUI
import DSComponents
import Form

struct DSTextFieldFormattedTestView: View {
    @State private var decimalTextFieldValue: Decimal? = 100
    @State private var stringTextFieldValue: String? = "Some value"

    var body: some View {
        VStack {
            DSTextField(
                "String Text field",
                text: $stringTextFieldValue,
                label: "String field"
            )

            DSTextField(
                "Decimal Text field",
                value: $decimalTextFieldValue,
                format: TextFormat(formatStyle: Decimal.FormatStyle()),
                label: "Decimal field"
            )
        }
        .padding()
    }
}

#Preview {
    DSTextFieldFormattedTestView()
}
