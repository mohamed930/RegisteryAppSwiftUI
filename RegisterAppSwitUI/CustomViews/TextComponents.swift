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
    var keyBoardType: UIKeyboardType = .default
    var maximumChar: Int
    
    init(title: String, placeHolder: String, txt: Binding<String>, keyBoardType: UIKeyboardType = .default,maximumChar: Int = 200) {
        self.title = title
        self.placeHolder = placeHolder
        self._txt = txt
        self.keyBoardType = keyBoardType
        self.maximumChar = maximumChar
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .setFont(fontName: .semiBold, size: 16)
                .foregroundStyle(.black.opacity(0.6))
            
            TextField(placeHolder, text: $txt)
                .setFont(fontName: .semiBold, size: 16)
                .keyboardType(keyBoardType)
                .onChange(of: txt) { newValue in
                    
                    if keyBoardType == .decimalPad {
                        txt = newValue.filter({$0.isASCII && ($0.isNumber || $0 == ".")})
                    }
                    
                    txt = String(newValue.prefix(maximumChar))
                }
            
            Divider()
        }
    }
}

#Preview {
    @State var text = ""
    TextComponents(title: "Qatar ID Number", placeHolder: "Please input your Qatar ID Number", txt: $text)
}
