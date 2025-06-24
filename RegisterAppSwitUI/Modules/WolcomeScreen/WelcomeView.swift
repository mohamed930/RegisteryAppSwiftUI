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
                    .padding(.horizontal,53)
                    .multilineTextAlignment(.center)
                    .setFont(fontName: .medium, size: 20)
                    .foregroundStyle(._95989_A)
                
                Spacer()
                
                
                
                MainButton(buttonTitle: "PROCEED") {
                    navManager.push(.firstStep)
                }
                .padding(.bottom,14)

                
            }
            .padding()
            .toolbarBackground(Color._00925_E, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .navigationTitle(Text("Registration"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // MARK: - HERE: -
                        
                    } label: {
                        Image(.info)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24)
                    }

                }
            }
        }
        .navigationDestination(for: NavigationManager.Route.self) { route in
            switch route {
                case .firstStep:
                    FirstStepView()
            }
        }
    }
}

#Preview {
    WelcomeView()
        .environmentObject(NavigationManager())

}
