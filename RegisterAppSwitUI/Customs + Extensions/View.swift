//
//  View.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 29/06/2025.
//

import SwiftUI
import RappleProgressHUD

extension View {
    
    @ViewBuilder
    func addOverlay() -> some View {
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
    
    func handleLoading(isLoading: Binding<Bool>) -> some View {
        self.onChange(of: isLoading.wrappedValue) { value in
            if value {
                RappleActivityIndicatorView.startAnimatingWithLabel(String(localized: "Please Wait"), attributes: RappleModernAttributes)
            } else {
                RappleActivityIndicatorView.stopAnimation()
            }
        }
    }
    
    // SwiftUI alert handler
    func showAlert(title: String, description: String, isPresented: Binding<Bool>, completion: @escaping () -> ()) -> some View {
        self.alert(isPresented: isPresented) {
            Alert(
                title: Text(title),
                message: Text(description),
                primaryButton: .cancel(Text("الغاء الامر")),
                secondaryButton: .default(Text("اعد المحاولة"), action: completion)
            )
        }
    }
}
