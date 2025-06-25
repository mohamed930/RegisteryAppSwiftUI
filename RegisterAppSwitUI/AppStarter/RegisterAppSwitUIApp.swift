//
//  RegisterAppSwitUIApp.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 24/06/2025.
//

import SwiftUI
import IQKeyboardManagerSwift
import IQKeyboardToolbarManager

@main
struct RegisterAppSwitUIApp: App {
    
    @StateObject private var navManager = NavigationManager()
    
    init() {
        setupKeyBoard()
    }
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(navManager)
        }
    }
    
    private func setupKeyBoard() {
        IQKeyboardManager.shared.isEnabled = true
        IQKeyboardManager.shared.layoutIfNeededOnUpdate = true
        IQKeyboardManager.shared.resignOnTouchOutside = true
        IQKeyboardToolbarManager.shared.isEnabled = true
    }
}
