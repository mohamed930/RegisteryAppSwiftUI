//
//  SixthStepView.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 20/07/2025.
//

import SwiftUI

struct SixthStepView: View {
    var body: some View {
        
        CustomNavigation {
            
            VStack(spacing: 13) {
                
                StepView(stepNumber: "6",
                         totalSteps: "6",
                         message: String(localized: "Login Credentials"))
                
                WhiteBox {
                    VStack {
                        
                    }
                }
                
                Spacer()
                
            }
            .background(Color.F_4_F_4_F_4)
            
        }
        
        
    }
}

#Preview {
    SixthStepView()
}
