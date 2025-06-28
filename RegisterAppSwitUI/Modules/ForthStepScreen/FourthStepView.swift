//
//  FourthStepView.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 28/06/2025.
//

import SwiftUI

struct FourthStepView: View {
    var body: some View {
        
        CustomNavigation {
            VStack(spacing: 13) {
                
                StepView(stepNumber: "4", totalSteps: "6", message: String(localized: "ID Scan"))
                
                WhiteBox {
                    
                    VStack(spacing: 35) {
                        
                        WhiteBox {
                            Text("Scan front side")
                                .setFont(fontName: .regular, size: 16)
                                .foregroundStyle(Color.A_5_A_5_A_5)
                        }
                        .frame(maxHeight: 340)
                        
                        WhiteBox {
                            Text("Scan Back side")
                                .setFont(fontName: .regular, size: 16)
                                .foregroundStyle(Color.A_5_A_5_A_5)
                        }
                        .frame(maxHeight: 340)
                        
                        Spacer()
                        
                        MainButton(buttonTitle: String(localized: "PROCEED")) {
                            // MARK: - HERE: - Handle action here.
                        }
                        
                    }
                    .padding(.horizontal,23)
                    .padding(.top,57)
                    
                    
                }
                
                Spacer()
                
            }
            .background(Color.F_4_F_4_F_4)
        }
    }
}

#Preview {
    FourthStepView()
}
