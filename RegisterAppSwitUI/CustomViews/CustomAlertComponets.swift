//
//  CustomAlertComponets.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 29/07/2025.
//

import SwiftUI

struct CustomAlertComponets: View {
    
    @State var offset: CGFloat = 2000
    @State var isActive: Bool = true
    
    var img: ImageResource
    var title: String
    var Message: String?
    var action: () -> ()
    
    init(img: ImageResource, title: String, Message: String? = nil,isActive: Bool,action: @escaping () -> ()) {
        self.img = img
        self.title = title
        self.Message = Message
        self.isActive = isActive
        self.action = action
    }
    
    var body: some View {
        
        ZStack {
            Color.black.opacity(isActive ? 0.76 : 0.0)
                .ignoresSafeArea()
                .onTapGesture {
                    closeAlert()
                    action()
                }
            
            WhiteBox {
                VStack(spacing: 20) {
                    
                    Image(img)
                    
                    Text(title)
                        .setFont(fontName: .regular, size: 18)
                        .foregroundStyle(Color._4_F_4_F_4_F)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    MainButton(buttonTitle: String(localized: "Ok")) {
                        // MARK: - TODO: - HERE: - handle action.
                        closeAlert()
                        action()
                    }
                    
                }
                .padding()
                
            }
            .frame(maxHeight: 270)
            .offset(x: 0,y: offset)
        }
        .onAppear {
            print("Called!!!")
            withAnimation(.spring()) {
                isActive = true
                offset = 0
            }
        }
    }
    
    private func closeAlert() {
        withAnimation(.spring()) {
            offset = 1000
            isActive = false
        }
    }
}

#Preview {
//    @State var isActive: Bool = true
    CustomAlertComponets(img: .correct, title: "Registration Completed Successfully\nPlease Login to your Account", isActive: true) {}
}
