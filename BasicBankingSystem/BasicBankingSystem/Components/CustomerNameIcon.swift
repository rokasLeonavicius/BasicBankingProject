
import SwiftUI

struct CustomerNameIcon: View {
    let customer: Customer

    var body: some View {
        Text(customer.nameIcon)
            .font(.title)
            .fontWeight(.bold)
            .frame(width: 60, height: 60, alignment: .center)
            .foregroundColor(.white)
            .background(LinearGradient(colors: customer.colors, startPoint: .bottom, endPoint: .top))
            .clipShape(Circle())
    }
}
