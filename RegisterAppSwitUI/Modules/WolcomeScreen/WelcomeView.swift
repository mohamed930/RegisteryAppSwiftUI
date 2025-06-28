//
//  WelcomeView.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 24/06/2025.
//

import SwiftUI

struct WelcomeView: View {
    
    @EnvironmentObject var navManager: NavigationManager
    
    var body: some View {
        NavigationStack(path: $navManager.path) {
            
            CustomNavigation(BackButtonHidded: true) {
                VStack {
                    
                    Image(.banner)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .padding(.top,150)
                    
                    
                    Text("Welcome!")
                        .setFont(fontName: .bold, size: 36)
                        .foregroundStyle(._464646)
                        .padding(.top,90)
                        .padding(.bottom,30)
                    
                    Text("You are few clicks away from being a member of First Finance family")
                        .setFont(fontName: .semiBold, size: 20)
                        .padding(.horizontal,43)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(._95989_A)
                    
                    Spacer()
                    
                    
                    
                    MainButton(buttonTitle: String(localized: "PROCEED")) {
                        navManager.push(.firstStep)
                    }
                    .padding(.bottom,14)

                    
                }
                .padding(.horizontal)
                .navigationDestination(for: NavigationManager.Route.self) { route in
                    switch route {
                        case .firstStep:
                            FirstStepView()
                        case .secondStep:
                            SecondStepView()
                        case .thirdStep:
                            ThirdStepView()
                        case .forthStep:
                            FourthStepView()
                    }
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
        .environmentObject(NavigationManager())

}
