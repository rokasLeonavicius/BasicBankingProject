

import SwiftUI

struct CustomerDetailsView: View {
    let customer: Customer

    @State private var showingTransferAmountView = false

    var body: some View {
        VStack {
            VStack {
                CustomerNameIcon(customer: customer)
                    .scaleEffect(1.6)

                VStack {
                    Text(customer.name)
                        .font(.title)
                        .fontWeight(.bold)

                    Text(customer.email)
                }
                .padding(.top)
            }

            Spacer()

            VStack {
                Text("Balance")
                    .font(.title3)
                    .fontWeight(.semibold)

                Text("\(customer.balance, specifier: "%.2f")")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
            }
            .padding(90)
            .background {
                Circle()
                    .stroke(lineWidth: 15)
                    .fill (
                        LinearGradient(colors: customer.colors, startPoint: .bottom, endPoint: .top)
                    )
            }

            Spacer()

            Button {
                showingTransferAmountView.toggle()
            } label: {
                Text("Transfer Money")
                    .font(.headline)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(.black)
            .cornerRadius(10)
            .padding(.horizontal)


            Spacer()
        }
        .sheet(isPresented: $showingTransferAmountView) {
            TransferAmountView(customer: customer)
        }
    }
}
