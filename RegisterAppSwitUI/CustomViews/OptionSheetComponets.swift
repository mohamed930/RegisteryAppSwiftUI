//
//  OptionSheetComponets.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 31/07/2025.
//

import SwiftUI

struct MenuOption: Identifiable {
    var id: Int
    let title: String
    let imge: String?
}

struct OptionSheetComponets: View {
    
    let model: [MenuOption]
    var action: (Int) -> ()
    
    var body: some View {
        VStack {
            ForEach(model,id: \.id) { option in
                
                Button {
                    action(option.id)
                } label: {
                    HStack {
                        if let img = option.imge {
                            Image(img)
                        }
                        
                        Text(option.title)
                            .setFont(fontName: .regular, size: 16)
                        
                        Spacer()
                    }
                    .padding()
                }
                .foregroundStyle(Color.black)
                
                if option.id != model.count {
                    Divider()
                        .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    OptionSheetComponets(model: [
        MenuOption(id: 1,title: "From Camera", imge: "Camera"),
        MenuOption(id: 2,title: "From Gallery", imge: "Gallery")
    ]) { _ in }
}
