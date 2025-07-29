//
//  SixthViewModel.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 29/07/2025.
//

import Foundation

class SixthViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var confirmationPassword: String = ""
    @Published var isActive: Bool = false
}
