import AvivComposableArchitecture
import AvivFormValidation
import SwiftUI

@Reducer
struct FormValidationTextOnlyTest {
    @ObservableState
    struct State: Equatable {
        var firstName = ""
        var lastName = ValidatableField("")

        var firstNameErrorText: String?
    }

    enum Action: Equatable, BindableAction {
        case submitButtonTap
        case formValidationSucceed
        case binding(BindingAction<State>)
    }

    var body: some ReducerOf<Self> {
        BindingReducer()

        FormValidationReducer(
            submitAction: .submitButtonTap,
            onFormValidatedAction: .formValidationSucceed,
            validations: [
                FieldValidation(
                    field: \.firstName,
                    errorState: \.firstNameErrorText,
                    rules: [
                        .minimumElementCount(
                            count: 10,
                            definition: "First name should be at least 10 characters long"
                        )
                    ]
                ),
                FieldValidation(
                    field: \.lastName,
                    rules: [
                        .maximumElementCount(
                            count: 20,
                            definition: "Last name cannot be more than 20 characters long"
                        )
                    ]
                )
            ]
        )
    }
}

struct FormValidationTextOnlyTestView: View {
    @Bindable var store: StoreOf<FormValidationTextOnlyTest>

    var body: some View {
        Form {
            VStack {
                TextField("First name", text: $store.firstName)
                    .accessibilityIdentifier("FirstName")
                if let errorText = store.firstNameErrorText {
                    Text(errorText)
                        .foregroundStyle(.red)
                        .accessibilityIdentifier("FirstName.error")
                }
            }

            VStack {
                TextField("Last name", text: $store.lastName.value)
                    .accessibilityIdentifier("LastName")
                if let errorText = store.lastName.errorText {
                    Text(errorText)
                        .foregroundStyle(.red)
                        .accessibilityIdentifier("LastName.error")
                }
            }

            Section {
                Button("Submit") {
                    store.send(.submitButtonTap)
                }
            }
        }
    }
}

#Preview {
    FormValidationTextOnlyTestView(
        store: Store(
            initialState: FormValidationTextOnlyTest.State(),
            reducer: FormValidationTextOnlyTest.init
        )
    )
}
