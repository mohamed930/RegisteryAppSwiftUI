//
//  CornerDecoration.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 26/06/2025.
//

import SwiftUI

struct CornerDecoration: View {
    
    var image: ImageResource
    var alignment: Alignment
    var rotation: Angle
    
    init(image: ImageResource = .corner2, alignment: Alignment, rotation: Angle) {
        self.image = image
        self.alignment = alignment
        self.rotation = rotation
    }
    
    var body: some View {
        Image(image)
            .rotationEffect(rotation)
            .padding(.horizontal, 10)
            .padding(.top, -10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }
}

#Preview {
    CornerDecoration(alignment: .topLeading, rotation: Angle(degrees: 180))
}
