//
//  RegisterAppSwitUIApp.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 24/06/2025.
//

import SwiftUI

@main
struct RegisterAppSwitUIApp: App {
    
    @StateObject private var navManager = NavigationManager()
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(navManager)
        }
    }
}
