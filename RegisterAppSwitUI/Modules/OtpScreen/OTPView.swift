//
//  OTPView.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 07/07/2025.
//

import SwiftUI

struct OTPView: View {
    
    @ObservedObject var viewmodel: OTPViewModel
    
    let interval: TimeInterval = 20
    
    var body: some View {
        
        ZStack {
            Color.black.opacity(viewmodel.isActive ? 0.76 : 0.0)
                .ignoresSafeArea()
                .onTapGesture {
                    viewmodel.closeAlert()
                }
            
            WhiteBox {
                VStack(spacing: 20) {
                    Text("OTP")
                        .setFont(fontName: .bold, size: 24)
                    
                    Text("Pleaser enter the verification code\nsent to your mobile number")
                        .setFont(fontName: .regular, size: 18)
                        .multilineTextAlignment(.center)
                        .padding(.bottom,35)
                        .foregroundStyle(Color._4_F_4_F_4_F)
                    
                    TextField(String(localized: "Please input OTP received here"), text: $viewmodel.otp)
                        .setFont(fontName: .regular, size: 14)
                        .padding(.horizontal,12)
                        .frame(height: 45)
                        .overlay {
                            RoundedRectangle(cornerRadius:6)
                                .stroke(.CCCCCC, lineWidth: 0.5)
                        }
                        .padding(.horizontal,14)
                    
                    
                    HStack {
                        Spacer()
                        
                        Text("\(viewmodel.counter) seconds")
                            .setFont(fontName: .regular, size: 14)
                            .foregroundStyle(Color.A_5_A_5_A_5)
                            .padding(.top,-13)
                            .multilineTextAlignment(.trailing)
                    }
                    .padding(.horizontal,17)
                    .padding(.bottom,10)
                    
                    Button {
                        // MARK: - TODO: - HERE: - Resend button action.
                        
                    } label: {
                        Text("Resend new code")
                            .foregroundStyle(Color.A_5_A_5_A_5)
                            .setFont(fontName: .regular, size: 18)
                    }
                    .padding(.bottom,30)
                    
                    HStack(spacing: 6) {
                        
                        Button {
                            // Cancel action
                            viewmodel.closeAlert()
                            
                        } label: {
                            Text("CANCEL")
                                .foregroundStyle(Color.gray)
                                .setFont(fontName: .semiBold, size: 16)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(Color.white) // or your background color
                                        .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 2)
                                        .innerShadow(color: Color.black.opacity(0.14), radius: 7.0, x: 0, y: 3)
                                )
                        }
                        
                        Spacer()
                        
                        Button {
                            // MARK: - TODO: - HERE: - Cancel Button.
                            
                            
                        } label: {
                            Text("VERIFY")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundStyle(.white)
                                .setFont(fontName: .semiBold, size: 16)
                                .background(Color._00925_E)
                                .cornerRadius(6.0)
                        }

                        
                    }
                    .frame(height: 42)
                    .padding(.horizontal,16)
                    .padding(.bottom,10)
                }
                .padding(.vertical,25)
            }
            .frame(height: 426)
            .offset(x: 0,y: viewmodel.offset)
            
        }
        .onAppear {
            print("Called!!!")
            viewmodel.startTimer()
            withAnimation(.spring()) {
                viewmodel.offset = 0
            }
        }
    }
}

#Preview {
    OTPView(viewmodel: OTPViewModel())
}
