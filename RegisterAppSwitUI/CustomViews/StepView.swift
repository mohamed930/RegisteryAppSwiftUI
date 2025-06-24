//
//  StepView.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 24/06/2025.
//

import SwiftUI

struct StepView: View {
    
    let stepNumber: String
    let totalSteps: String
    let message: String
    
    var body: some View {
        
        VStack {
            ZStack {
                Color._00925_E
                    .clipShape(
                        .rect(
                            bottomLeadingRadius: 20,
                            bottomTrailingRadius: 20
                        )
                    )
                    .ignoresSafeArea()
            }
            .frame(height: 45)
            
            ZStack {
                Color.white
                
                HStack {
                    VStack(alignment: .leading,spacing: 3) {
                        Text("Step \(stepNumber) of \(totalSteps)")
                            .setFont(fontName: .bold, size: 20)
                            .foregroundStyle(._5_D_5_D_5_D)
                        
                        Text(message)
                            .setFont(fontName: .regular, size: 14)
                            .foregroundStyle(._5_D_5_D_5_D)
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .frame(height: 70)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius:12)
                    .stroke(.CCCCCC, lineWidth: 0.5)
            )
            .padding(.top,-40)
            .padding(.horizontal,12)
        }
        
       
    }
}

#Preview {
    StepView(stepNumber: "1", totalSteps: "6", message: "Initiation")
}
