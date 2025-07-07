//
//  FifthStepViewModel.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 29/06/2025.
//

import SwiftUI

class ComponentsModel: Identifiable {
    let id = UUID()
    let name: String
    @Published var value: String
    var keyBoardType: UIKeyboardType
    var minimumCharacter: Int
    var calenderType: Bool
    var masked: Bool
    
    init(name: String, value: String = "", keyBoardType: UIKeyboardType = .default, minimumCharacter: Int = 200, calenderType: Bool = false,masked: Bool = false) {
        self.name = name
        self.value = value
        self.keyBoardType = keyBoardType
        self.minimumCharacter = minimumCharacter
        self.calenderType = calenderType
        self.masked = masked
    }
    
}

class FifthStepViewModel: ObservableObject {
    @Published var qid: String = ""
    @Published var idExpiryDate: String = ""
    @Published var name: String = ""
    @Published var dateOfBirth: String = ""
    @Published var nationality: String = ""
    @Published var occupation: String = ""
    @Published var employer: String = ""
    
    @Published var components: [ComponentsModel] = Array<ComponentsModel>()
    
   
    func buildUI() {
        components = [
            ComponentsModel(name: String(localized: "Qatar ID Number"),keyBoardType: .asciiCapableNumberPad,minimumCharacter: 11),
            ComponentsModel(name: String(localized: "ID Expiry Date"),calenderType: true),
            ComponentsModel(name: String(localized: "Name")),
            ComponentsModel(name: String(localized: "Date of Birth"),calenderType: true),
            ComponentsModel(name: String(localized: "Nationality")),
            ComponentsModel(name: String(localized: "Occupation")),
            ComponentsModel(name: String(localized: "Employer")),
            ComponentsModel(name: String(localized: "Passport Number")),
            ComponentsModel(name: String(localized: "Passport Expiry Date"),calenderType: true),
            ComponentsModel(name: String(localized: "Address - Zone")),
            ComponentsModel(name: String(localized: "Address - Street")),
            ComponentsModel(name: String(localized: "Address - Building")),
            ComponentsModel(name: String(localized: "Mobile Number"),keyBoardType: .phonePad,masked: true),
            ComponentsModel(name: String(localized: "Email Address"),masked: true),
        ]
    }
}
