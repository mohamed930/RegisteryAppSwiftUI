//
//  SecondStepViewModel.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 30/07/2025.
//

import Foundation

class SecondStepViewModel: ObservableObject {
    
    private var data: UserDataModel

    init(data: UserDataModel) {
        self.data = data
    }
    
    func printData() {
        print(data)
    }
}
