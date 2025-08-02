//
//  SecondStepView.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 25/06/2025.
//

import SwiftUI
import FittedSheetsSwiftUI
import FittedSheets

struct SecondStepView: View {
    @EnvironmentObject var navManager: NavigationManager
    @EnvironmentObject var userData: UserDataModel
    
    @StateObject var viewModel: SecondStepViewModel
    @StateObject private var sheetManager = CustomSheetManager()
    
    init(viewModel: SecondStepViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
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
                            addOverlay()
                        }
                        .onTapGesture {
                            sheetManager.present {
                                OptionSheetComponets(model: [
                                    MenuOption(id: 1,title: "From Camera", imge: "Camera"),
                                    MenuOption(id: 2,title: "From Gallery", imge: "Gallery"),
                                    MenuOption(id: 3, title: "From Files", imge: "Files")
                                ]) { option in
                                    switch option {
                                    case 1:
                                        break
                                    case 2:
                                        viewModel.openGallery()
                                    default: break
                                    }
                                }
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
            .fittedSheet(isPresented: $sheetManager.isPresented,
                         configuration: sheetManager.configuration,
                         sheetView: {sheetManager.content},
                         animated: false)
            .sheet(isPresented: $viewModel.isPickerPresented) {
                // Keep ImagePicker alive via binding
                ImagePicker(image: $viewModel.image)
            }
        }
    }
}

#Preview {
    SecondStepView(viewModel: SecondStepViewModel(data: UserDataModel()))
        .environmentObject(NavigationManager())
}
