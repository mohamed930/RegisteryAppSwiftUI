//
//  SecondStepViewModel.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 30/07/2025.
//

import Foundation
import SwiftUI

class SecondStepViewModel: ObservableObject {
    
    @Published var selectedImage: UIImage?
    @Published var isPickerPresented: Bool = false
    
    private var data: UserDataModel

    init(data: UserDataModel) {
        self.data = data
    }
    
    func printData() {
        print(data)
    }
    
    func openGallery() {
        isPickerPresented = true
    }

    func setImage(_ image: UIImage?) {
        selectedImage = image
    }
}
