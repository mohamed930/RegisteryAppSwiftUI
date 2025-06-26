//
//  ThirdStepView.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 26/06/2025.
//

import SwiftUI

struct ThirdStepView: View {
    
    @StateObject var viewmodel = ThirdStepViewModel()
    
    var body: some View {
        
        CustomNavigation {
            VStack(spacing: 13) {
                
                StepView(stepNumber: "3", totalSteps: "6", message: String(localized: "Commercial Record Information"))
                
                WhiteBox {
                    ScrollView {
                        VStack(spacing: 30) {
                            TextComponents(title: String(localized: "Corporate Name"),
                                           placeHolder: String(localized: "Please input your corporate name"),
                                           txt: $viewmodel.corperateName)
                            
                            TextComponents(title: String(localized: "Corporate Establishment Datee"),
                                           placeHolder: String(localized: "Please input your corporate establishment date"),
                                           txt: $viewmodel.corperateEstablishDate)
                            
                            TextComponents(title: String(localized: "CR Expiry Date"),
                                           placeHolder: String(localized: "Please input CR expiry date"),
                                           txt: $viewmodel.corperateCREpiryDate)
                            
                            TextComponents(title: String(localized: "Corporate Main Activity"),
                                           placeHolder: String(localized: "Please input corporate main activity"),
                                           txt: $viewmodel.corperateMainActivity)
                            
                            TextComponents(title: String(localized: "Average of Credit Transaction Last 6 Months"),
                                           placeHolder: String(localized: "Please input average of credit transaction in last 6 months"),
                                           txt: $viewmodel.corperateAverageCredit,
                                           keyBoardType: .decimalPad)
                            
                            TextComponents(title: String(localized: "Average Sales Transactions"),
                                           placeHolder: String(localized: "Please input average sales transactions"),
                                           txt: $viewmodel.corperateAverageSales,
                                           keyBoardType: .decimalPad)
                            
                            TextComponents(title: String(localized: "Total Liabilities in Other Corporates"),
                                           placeHolder: String(localized: "Please input total liabilities in other corporates"),
                                           txt: $viewmodel.totalLiabilites,
                                           keyBoardType: .decimalPad)
                            
                            TextComponents(title: String(localized: "Total Annual Revenue"),
                                           placeHolder: String(localized: "Please input total annual revenue"),
                                           txt: $viewmodel.totalAnnualRevenue,
                                           keyBoardType: .decimalPad)
                            
                            TextComponents(title: String(localized: "Corporate Short Name"),
                                           placeHolder: String(localized: "Please input corporate short name"),
                                           txt: $viewmodel.corperateShortName)
                            .padding(.bottom,14)
                            
                            MainButton(buttonTitle: String(localized: "PROCEED")) {
                                // MARK: - HERE: - Button action.
                                
                            }
                        }
                        .padding(.vertical,23)
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
        }
        .background(Color.F_4_F_4_F_4)
        
    }
}

#Preview {
    ThirdStepView(viewmodel: ThirdStepViewModel())
}
