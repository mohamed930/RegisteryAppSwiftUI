//
//  TextComponents.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 24/06/2025.
//

import SwiftUI

struct TextComponents: View {
    
    let title: String
    let placeHolder: String
    @Binding var txt: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .setFont(fontName: .regular, size: 16)
                .foregroundStyle(.black.opacity(60))
            
            TextField(placeHolder, text: $txt)
                .setFont(fontName: .regular, size: 16)
            
            Divider()
        }
    }
}

#Preview {
    @State var text = ""
    TextComponents(title: "Qatar ID Number", placeHolder: "Please input your Qatar ID Number", txt: $text)
}
