//
//  OTPViewModel.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 07/07/2025.
//


import Foundation
import Combine
import SwiftUI

class OTPViewModel: ObservableObject {
    @Published var isActive: Bool = false
    @Published var counter = 30
    @Published var otp: String = ""
    @Published var offset: CGFloat = 1000
    
    var timer: Timer?
    
//    init(isActive: Binding<Bool>) {
//        self._isActive = isActive
//    }

    func startTimer() {
        timer?.invalidate() // prevent multiple timers
        counter = 30

        timer = Timer(timeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            if self.counter > 0 {
                DispatchQueue.main.async {
                    self.counter -= 1
                }
            } else {
                self.timer?.invalidate()
            }
        }

        RunLoop.main.add(timer!, forMode: .common)
    }
    
    func closeAlert() {
        withAnimation(.spring()) {
            offset = 1000
            isActive = false
        }
    }

    deinit {
        timer?.invalidate()
    }
}
