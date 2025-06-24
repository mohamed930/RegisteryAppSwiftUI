//
//  FirstStepView.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 24/06/2025.
//

import SwiftUI

struct FirstStepView: View {
    @EnvironmentObject var navManager: NavigationManager
    
    var body: some View {
        
        CustomNavigation {
            VStack {
                Text("Second screen here.")
            }
        }
    }
}

#Preview {
    FirstStepView()
        .environmentObject(NavigationManager())
}
