
import SwiftUI

struct HistoriesView: View {
    @EnvironmentObject var viewModel: ViewModel

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.histories, id: \.self) { history in
                    GroupBox {
                        Text(history.description)
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    } label: {
                        Text(history.date.formatted())
                            .font(.caption)
                            .fontWeight(.bold)
                            .opacity(0.5)
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Transfers Table")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                            .font(.headline)
                    }

                }
            }
        }
    }
}

struct HistoriesView_Previews: PreviewProvider {
    static var previews: some View {
        HistoriesView()
            .environmentObject(ViewModel())
    }
}
