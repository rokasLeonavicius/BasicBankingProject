

import SwiftUI

struct TransferAmountView: View {
    @Environment(\.dismiss) var dismiss

    @EnvironmentObject var viewModel: ViewModel

    @State private var transferAmount: Double = 0.0

    let customer: Customer

    @FocusState private var transferAmountIsFocused: Bool

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Transfer Amount", value: $transferAmount, format: .number)
                        .focused($transferAmountIsFocused)
                        .keyboardType(.decimalPad)
                }

                Section {
                    Button {
                        viewModel.transfer(customer: customer, amount: transferAmount)

                        dismiss()
                    } label: {
                        Text("Transfer")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                    }
                }
                .listRowBackground(Color.black)

            }
            .navigationTitle("Add Transfer Amount")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .font(.headline)
                    }
                }

                ToolbarItem(placement: .keyboard) {
                    HStack {
                        Spacer()

                        Button {
                            transferAmountIsFocused = false
                        } label: {
                            Image(systemName: "keyboard.chevron.compact.down")
                        }

                    }
                }
            }
        }
    }
}
