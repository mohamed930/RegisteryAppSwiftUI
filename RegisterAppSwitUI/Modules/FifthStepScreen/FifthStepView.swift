//
//  FifthStepView.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 29/06/2025.
//

import SwiftUI

struct FifthStepView: View {
    
    @StateObject var viewmodel = FifthStepViewModel()
    @EnvironmentObject var naviManger: NavigationManager
    
    var body: some View {
        
        ZStack {
            CustomNavigation {
                
                VStack {
                    
                    StepView(stepNumber: "5", totalSteps: "6", message: String(localized: "User Information"))
                    
                    WhiteBox {
                        
                        ScrollView {
                            VStack(spacing: 30) {
                                
                                ForEach(Array(viewmodel.components.enumerated()), id: \.element.id) { index, model in
                                    
                                    TextComponents(title: model.name,
                                                   placeHolder: "",
                                                   txt: $viewmodel.components[index].value,
                                                   keyBoardType: model.keyBoardType,
                                                   maximumChar: model.minimumCharacter,
                                                   calenderType: model.calenderType,
                                                   masked: model.masked)
                                }
                                
                                MainButton(buttonTitle: String(localized: "PROCEED")) {
                                    // MARK: - HERE: - Action button here
                                    viewmodel.setupOTPBinding()
                                    viewmodel.isActive = true
                                }
                                .padding(.top,10)
                                
                            }
                        }
                        .padding()
                        .padding(.top,23)
                        
                    }
                    
                    Spacer()
                }
                .background(Color.F_4_F_4_F_4)
                
            }
            .onAppear {
                viewmodel.buildUI()
                viewmodel.setupOTPBinding()
            }
            
            if viewmodel.isActive {
                OTPView(viewmodel: viewmodel.otpViewModel)
            }
        }
        
    }
}

#Preview {
    FifthStepView()
        .environmentObject(NavigationManager())
}
