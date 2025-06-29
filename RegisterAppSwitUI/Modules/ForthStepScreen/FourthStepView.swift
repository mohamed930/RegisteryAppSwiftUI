//
//  FourthStepView.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 28/06/2025.
//

import SwiftUI

struct FourthStepView: View {
    
    @EnvironmentObject var naviManeger: NavigationManager
    
    var body: some View {
        
        CustomNavigation {
            VStack(spacing: 13) {
                
                StepView(stepNumber: "4", totalSteps: "6", message: String(localized: "ID Scan"))
                
                WhiteBox {
                    
                    VStack {
                        
                        WhiteBox {
                            Text("Scan front side")
                                .setFont(fontName: .regular, size: 16)
                                .foregroundStyle(Color.A_5_A_5_A_5)
                        }
                        .frame(maxHeight: 340)
                        .overlay {
                            addOverlay()
                        }
                        .padding(.bottom,48)
                        
                        WhiteBox {
                            Text("Scan Back side")
                                .setFont(fontName: .regular, size: 16)
                                .foregroundStyle(Color.A_5_A_5_A_5)
                        }
                        .frame(maxHeight: 340)
                        .overlay {
                            addOverlay()
                        }
                        .padding(.bottom,48)
                        
                        Spacer()
                        
                        MainButton(buttonTitle: String(localized: "PROCEED")) {
                            naviManeger.push(.fifthStep)
                        }
                        .padding(.horizontal,23)
                        .padding(.bottom,20)
                        
                    }
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
