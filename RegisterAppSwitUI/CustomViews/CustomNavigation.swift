//
//  CustomNavigation.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 24/06/2025.
//

import SwiftUI

struct CustomNavigation<Content: View>: View {
    
    @EnvironmentObject var navManager: NavigationManager
    @State var BackButtonHidded: Bool
    let content: () -> Content
    
    init(BackButtonHidded: Bool = false,@ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.BackButtonHidded = BackButtonHidded
    }
    
    var body: some View {
        ZStack {
            content()
        }
        .padding()
        .toolbarBackground(Color._00925_E, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .navigationTitle(Text("Registration"))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // MARK: - HERE: -
                    
                } label: {
                    Image(.info)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                }

            }
            
            if !BackButtonHidded {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        navManager.pop()
                    }) {
                        Image(systemName: "chevron.backward") // or your custom back icon
                    }
                }
            }
        }
    }
}
