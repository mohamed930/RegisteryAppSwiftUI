//
//  WhiteBox.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 25/06/2025.
//

import SwiftUI

struct WhiteBox<Content: View>: View {
    
    let content: () -> Content
    
    var body: some View {
        
        ZStack {
            Color.white
            
            content()
        }
        .background(.white)
        .overlay {
            RoundedRectangle(cornerRadius:12)
                .stroke(.CCCCCC, lineWidth: 0.5)
        }
        .cornerRadius(12)
        .padding(.horizontal)
        .frame(maxHeight: .infinity)
        
    }
}

//#Preview {
//    WhiteBox()
//}
