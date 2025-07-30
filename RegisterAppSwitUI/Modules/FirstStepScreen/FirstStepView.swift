//
//  FirstStepView.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 24/06/2025.
//

import SwiftUI

struct FirstStepView: View {
    @EnvironmentObject var navManager: NavigationManager
    @EnvironmentObject var data: UserDataModel
    @StateObject var viewmodel: FirstStepViewModel
    
    init(userData: UserDataModel) {
        _viewmodel = StateObject(wrappedValue: FirstStepViewModel(data: userData))
    }
    
    var body: some View {
        
        CustomNavigation {
            
            ZStack {
                VStack {
                    StepView(stepNumber: "1", totalSteps: "6", message: String(localized: "Initiation"))
                        .padding(.bottom,10)
                    
                    WhiteBox {
                        VStack(spacing: 26) {
                            TextComponents(title: String(localized: "Qatar ID Number"),
                                           placeHolder: "",
                                           txt: $viewmodel.qid,
                                           keyBoardType: .asciiCapableNumberPad,
                                           maximumChar: 11,
                                           errorLabel: String(localized: "Please Enter Quater id"),
                                           errorFlag: $viewmodel.qidError) {
                                Task {
                                    await viewmodel.loadQidCheck()
                                }
                            }
                            
                            TextComponents(title: String(localized: "Commercial Record Number"),
                                           placeHolder: "",
                                           txt: $viewmodel.commercialRecord,
                                           keyBoardType: .numbersAndPunctuation,
                                           errorLabel: String(localized: "Please Enter Commercial record"),
                                           errorFlag: $viewmodel.commercialError)
                            
                            Spacer()
                            
                            MainButton(buttonTitle: String(localized: "PROCEED")) {
                                // MARK: - HERE: - do action.
                                Task {
                                    if await viewmodel.handleValidation() {
                                        DispatchQueue.main.async {
                                            navManager.push(.secondStep)
                                        }
                                       
                                    }
                                }
                            }
                            .padding(.bottom,10)
                        }
                        .padding()
                        .padding(.top,20)
                    }
                    
                    Spacer()
                }
                .background(Color.F_4_F_4_F_4)
                .handleLoading(isLoading: $viewmodel.isloading)
                
                
                if viewmodel.showAlert {
                    CustomAlertComponets(img: .errorOutlineOutlined,
                                         title: viewmodel.alertMess.isEmpty ? String(localized: "User already created") : viewmodel.alertMess,
                                         isActive: viewmodel.showAlert) {
                        viewmodel.showAlert = false
                    }
                }
            }
        }
    }
}

#Preview {
    FirstStepView(userData: UserDataModel())
        .environmentObject(NavigationManager())
        .environmentObject(UserDataModel())
}
