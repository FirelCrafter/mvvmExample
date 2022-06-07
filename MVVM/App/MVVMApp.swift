//
//  MVVMApp.swift
//  MVVM
//
//  Created by Михаил Щербаков on 23.03.2022.
//

import SwiftUI

@main
struct MVVMApp: App {
    
    static let assembly = Assembly.shared
    
    @StateObject var usersVM = Self.assembly.usersViewModel
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(usersVM)
        }
    }
}
