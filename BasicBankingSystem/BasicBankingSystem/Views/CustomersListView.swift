

import SwiftUI

struct CustomersListView: View {

    @EnvironmentObject var viewModel: ViewModel

    @State private var showingHistoriesView = false

    var body: some View {
        List {
            ForEach(viewModel.customers, id: \.self) { customer in
                NavigationLink {
                    CustomerDetailsView(customer: customer)
                } label: {
                    HStack {
                        CustomerNameIcon(customer: customer)

                        VStack(alignment: .leading) {
                            HStack {
                                Text(customer.name)
                                    .font(.headline)
                                    .fontWeight(.bold)

                                Spacer()

                                Text("$\(customer.balance, specifier: "%.2f")")
                                    .font(.caption)
                                    .fontWeight(.bold)
                            }

                            Text(customer.email)
                                .font(.subheadline)
                        }
                    }
                }
            }
        }
        .navigationTitle("All Customers")
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingHistoriesView.toggle()
                } label: {
                    Image(systemName: "clock")
                        .font(.headline)
                }
            }
        }
        .sheet(isPresented: $showingHistoriesView) {
            HistoriesView()
        }
    }

    
}

struct CustomersListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomersListView()
                .environmentObject(ViewModel())
        }
    }
}
