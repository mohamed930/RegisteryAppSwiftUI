//
//  View.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 29/06/2025.
//

import SwiftUI

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
    
}
