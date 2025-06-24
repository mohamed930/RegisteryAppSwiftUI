//
//  MainButton.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 24/06/2025.
//

import SwiftUI

struct MainButton: View {
    
    let buttonTitle: String
    let action: () -> ()
    
    var body: some View {
        
        Button {
            action()
        } label: {
            
            ZStack {
                
                Color._00925_E
                    .ignoresSafeArea()
                
                Text(buttonTitle)
                    .padding()
                    .foregroundStyle(.white)
                    .setFont(fontName: .semiBold, size: 16)
            }
            
            
        }
        .frame(height: 55)
        .cornerRadius(6.0)
        .shadow(color: .black.opacity(0.2), radius: 6.0, x: 0, y: 3)

        
    }
}

#Preview {
    MainButton(buttonTitle: "Processed", action: {})
}
