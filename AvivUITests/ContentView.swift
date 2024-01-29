import SwiftUI
import DSComponents
import Form

struct ContentView: View {
    @State private var textFieldValue: Decimal? = 100

    var body: some View {
        VStack {
            DSTextField(
                "Some Text field",
                value: $textFieldValue,
                format: TextFormat(formatStyle: Decimal.FormatStyle()),
                label: "Some label"
            )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
