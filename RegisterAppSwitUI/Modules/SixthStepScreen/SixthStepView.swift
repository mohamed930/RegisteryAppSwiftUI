//
//  SixthStepView.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 20/07/2025.
//

import SwiftUI

struct SixthStepView: View {
    
    @StateObject var viewmodel = SixthViewModel()
    @EnvironmentObject var navi: NavigationManager
    
    var body: some View {
        
        CustomNavigation {
            
            ZStack {
                
                VStack(spacing: 13) {
                    
                    StepView(stepNumber: "6",
                             totalSteps: "6",
                             message: String(localized: "Login Credentials"))
                    
                    WhiteBox {
                        VStack(spacing: 30) {
                            TextComponents(title: String(localized: "Username"),
                                           placeHolder: String(localized: "Please input your “Username”"),
                                           txt: $viewmodel.userName)
                            
                            TextComponents(title: String(localized: "Password"),
                                           placeHolder: String(localized: "Please input your “Password”"),
                                           txt: $viewmodel.password,
                                           password: true)
                            
                            TextComponents(title: String(localized: "Password Confirmation"),
                                           placeHolder: String(localized: "Please input your “Password Confirmation”"),
                                           txt: $viewmodel.confirmationPassword,
                                           password: true)
                            
                            Spacer()
                            
                            MainButton(buttonTitle: String(localized: "PROCEED")) {
                                // MARK: - TODO: - HERE: - confirmation button action.
                                viewmodel.isActive = true
                                navi.popToRoot()
                                
                            }
                        }
                        .padding(.vertical,16)
                        .padding()
                    }
                    
                    Spacer()
                    
                }
                .background(Color.F_4_F_4_F_4)
                
                if viewmodel.isActive {
                    CustomAlertComponets(img: .correct,
                                         title: String(localized: "Registration Completed Successfully\nPlease Login to your Account"),
                                         isActive: viewmodel.isActive) {
                        viewmodel.isActive = false
                    }
                }
            }
            
            
        }
        
        
    }
}

#Preview {
    SixthStepView()
}
