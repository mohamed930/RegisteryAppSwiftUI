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
    var calenderType: Bool
    var masked: Bool
    var password: Bool
    @FocusState private var isTextFieldFocused: Bool
    
    init(title: String, placeHolder: String, txt: Binding<String>, keyBoardType: UIKeyboardType = .default,maximumChar: Int = 200,calenderType: Bool = false,masked: Bool = false,password: Bool = false) {
        self.title = title
        self.placeHolder = placeHolder
        self._txt = txt
        self.keyBoardType = keyBoardType
        self.maximumChar = maximumChar
        self.calenderType = calenderType
        self.masked = masked
        self.password = password
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .setFont(fontName: .semiBold, size: 16)
                .foregroundStyle(.black.opacity(0.6))
            
            
                HStack {
                    
                    if calenderType {
                        DatePickerTextFieldComponents(txt: $txt, placeHolder: placeHolder)
                            .frame(maxWidth: .infinity)
                            .padding(.leading,52)
                        
                        Spacer()
                        
                        Image(.calender)
//                            .padding(.trailing, 10)
                    }
                    
                    else {
                        
                        if password {
                            SecureField(placeHolder, text: $txt)
                                .setFont(fontName: .semiBold, size: 16)
                        }
                        else {
                            TextField(placeHolder, text: $txt)
                                .setFont(fontName: .semiBold, size: 16)
                                .keyboardType(keyBoardType)
                                .onChange(of: txt) { newValue in
                                    
                                    if keyBoardType == .decimalPad || keyBoardType == .phonePad {
                                        txt = newValue.filter({$0.isASCII && ($0.isNumber || $0 == "." || $0 == "*")})
                                        
                                    }
                                    
                                    if keyBoardType != .decimalPad && keyBoardType != .phonePad {
                                        txt = String(newValue.prefix(maximumChar))
                                    }
                                }
                                .focused($isTextFieldFocused)
                                .onChange(of: isTextFieldFocused) { isFocused in
                                    print("Focus changed: \(isFocused)")
                                    if !isFocused && masked {
                                        // end editing...
                                        txt = keyBoardType == .phonePad ? txt.mobileMasked : txt.emailMasked
                                    }
                                }
                        }
                        
                        
                    }
                    
                }
            
            Divider()
        }
    }
}

#Preview {
    @State var text = ""
    TextComponents(title: "Qatar ID Number", placeHolder: "Please input your Qatar ID Number", txt: $text,calenderType: false,masked: true)
}
