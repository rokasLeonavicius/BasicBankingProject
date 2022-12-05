

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    @Published var customers: [Customer] = []
    @Published var histories: [History] = []

    static private let customersData = ["Romas": 10.0, "Tadas": 20.0, "Gabriele": 30.0, "Rokas": 40.0, "Adolfas": 50.0, "Juozas": 60.0, ]

    static private let colors: [Color] = [.red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue, .indigo, .purple, .pink, .brown, .gray]

    init() {
        for data in Self.customersData {
            let color = Self.colors.randomElement()

            customers.append(Customer(
                name: data.key,
                email: data.key.filter({$0 != " "}).lowercased() + "@gmail.com ",
                colors: [color!, color!.opacity(0.5)],
                balance: data.value)
            )
        }
    }

    func transfer(customer: Customer, amount: Double) {
        if amount != 0 {
            if let index = customers.firstIndex(where: { $0.name == customer.name}) {
                customers[index].balance += amount
            }

            histories.insert(History(date: Date.now, description: "Trasfered eur \(amount) to \(customer.name)."), at: 0)
        }
    }
}
