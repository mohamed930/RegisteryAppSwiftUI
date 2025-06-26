//
//  SecondStepView.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 25/06/2025.
//

import SwiftUI

struct SecondStepView: View {
    @EnvironmentObject var navManager: NavigationManager
    
    var body: some View {
        
        CustomNavigation {
            VStack(spacing: 13) {
                StepView(stepNumber: "2", totalSteps: "6", message: String(localized: "Commercial Record Scan"))
                
                WhiteBox {
                    
                    VStack(spacing: 41) {
                        
                        ZStack {
                            Text("Scan CR Here")
                                .setFont(fontName: .regular, size: 17)
                                .foregroundStyle(Color.A_5_A_5_A_5)
                        }
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                        .background(.white)
                        .overlay {
                            RoundedRectangle(cornerRadius:12)
                                .stroke(.CCCCCC, lineWidth: 0.5)
                        }
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .frame(maxHeight: .infinity)
                        .overlay {
                            
                            let languageCode = Locale.current.language.languageCode
                            
                            if languageCode == "en" {
                                CornerDecoration(image: .corner, alignment: .topLeading, rotation: .degrees(0))
                                
                                CornerDecoration(alignment: .topTrailing, rotation: .degrees(0))
                                
                                CornerDecoration(alignment: .bottomLeading, rotation: .degrees(180))
                                
                                CornerDecoration(alignment: .bottomTrailing, rotation: .degrees(90))
                            }
                            else {
                                CornerDecoration(alignment: .topLeading, rotation: .degrees(0))
                                
                                CornerDecoration(image: .corner, alignment: .topTrailing, rotation: .degrees(0))
                                
                                CornerDecoration(alignment: .bottomTrailing, rotation: .degrees(180))
                                
                                CornerDecoration(alignment: .bottomLeading, rotation: .degrees(-90))
                            }
                        }
                        
                        MainButton(buttonTitle: String(localized: "PROCEED")) {
                            navManager.path.append(.thirdStep)
                        }
                        .padding(.bottom,23)
                        .padding(.horizontal,10)
                    }
                    .padding(.top,38)
                    .padding(.horizontal,10)
                }
                
                Spacer()
            }
            .background(Color.F_4_F_4_F_4)
        }
    }
}

#Preview {
    SecondStepView()
        .environmentObject(NavigationManager())
}
