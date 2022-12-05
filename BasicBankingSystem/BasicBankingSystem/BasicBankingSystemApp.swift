//
//  BasicBankingSystemApp.swift
//  BasicBankingSystem
//

import SwiftUI

@main
struct BasicBankingSystemApp: App {
    @StateObject private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
