//
//  FirstStepView.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 24/06/2025.
//

import SwiftUI

struct FirstStepView: View {
    @EnvironmentObject var navManager: NavigationManager
    
    @State var qid: String = ""
    @State var commercialRecord: String = ""
    
    var body: some View {
        
        CustomNavigation {
            
            VStack {
                StepView(stepNumber: "1", totalSteps: "6", message: "Initiation")
                    .padding(.bottom,10)
                
                ZStack {
                    Color.white
                    
                    VStack(spacing: 26) {
                        TextComponents(title: String(localized: "Qatar ID Number"), placeHolder: String(localized: "Please input your Qatar ID Number"), txt: $qid)
                        
                        TextComponents(title: String(localized: "Commercial Record Number"), placeHolder: String(localized: "Please input your commercial Record number"), txt: $commercialRecord)
                        
                        Spacer()
                        
                        MainButton(buttonTitle: String(localized: "PROCEED")) {
                            // MARK: - HERE: - do action.
                        }
                        .padding(.bottom,10)
                    }
                    .padding()
                    .padding(.top,20)
                    
                }
                .background(.white)
                .overlay {
                    RoundedRectangle(cornerRadius:12)
                        .stroke(.CCCCCC, lineWidth: 0.5)
                }
                .cornerRadius(12)
                .padding(.horizontal)
                .frame(maxHeight: .infinity)
                
                Spacer()
            }
            .background(Color.F_4_F_4_F_4)
        }
    }
}

#Preview {
    FirstStepView()
        .environmentObject(NavigationManager())
}
