//
//  CustomFont.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 24/06/2025.
//

import SwiftUI

enum Fonts: String, CaseIterable {
    case black = "Roboto-Black"
    case blackItalic = "Roboto-BlackItalick"
    case bold = "Roboto-Bold"
    case boldItalic = "Roboto-BoldItalic"
    case extraBold = "Roboto-ExtraBold"
    case extraBoldItalic = "Roboto-ExtraBoldItalic"
    case extraLight = "Roboto-ExtraLight"
    case extraLightItalic = "Roboto-ExtraLightItalic"
    case italic = "Roboto-Italic"
    case light = "Roboto-Light"
    case lightItalic = "Roboto-LightItalic"
    case medium = "Roboto-Medium"
    case mediumItalic = "Roboto-MediumItalic"
    case regular = "Roboto-Regular"
    case semiBold = "Roboto-SemiBold"
    case semiBoldItalic = "Roboto-SemiBoldItalic"
    case thin = "Roboto-Thin"
    case thinItalic = "Roboto-ThinItalic"
}


struct CustomFontModifier: ViewModifier {
    var fontName: Fonts
    var size: CGFloat

    func body(content: Content) -> some View {
        content
            .font(.custom(fontName.rawValue, size: size))
    }
}

extension View {
    
    func setFont(fontName: Fonts, size: CGFloat) -> some View {
        self.modifier(CustomFontModifier(fontName: fontName, size: size))
    }
}

