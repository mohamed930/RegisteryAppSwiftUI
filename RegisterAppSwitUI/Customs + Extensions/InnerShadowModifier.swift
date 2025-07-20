//
//  InnerShadowModifier.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 07/07/2025.
//

import SwiftUI

struct InnerShadowModifier: ViewModifier {
    var color: Color = .black.opacity(0.2)
    var radius: CGFloat = 4
    var offsetX: CGFloat = 2
    var offsetY: CGFloat = 2
    var cornerRadius: CGFloat = 12

    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(color, lineWidth: 4)
                    .blur(radius: radius)
                    .offset(x: offsetX, y: offsetY)
                    .mask(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(LinearGradient(
                                gradient: Gradient(colors: [.black, .clear]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                    )
            )
    }
}


extension View {
    func innerShadow(
        color: Color = .black.opacity(0.15),
        radius: CGFloat = 4,
        x: CGFloat = 2,
        y: CGFloat = 2
    ) -> some View {
        self.modifier(InnerShadowModifier(color: color, radius: radius, offsetX: x, offsetY: y))
    }
}
