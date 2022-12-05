

import Foundation
import SwiftUI

struct Customer: Hashable {
    let name: String
    let email: String
    let colors: [Color]

    var balance: Double

    var nameIcon: String {
        name.components(separatedBy: " ").reduce("") { ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)" }
    }
}
