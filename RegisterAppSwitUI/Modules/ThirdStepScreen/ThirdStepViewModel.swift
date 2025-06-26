//
//  ThirdStepViewModel.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 26/06/2025.
//

import SwiftUI

class ThirdStepViewModel: ObservableObject {
    @Published var corperateName: String = ""
    @Published var corperateEstablishDate: String = ""
    @Published var corperateCREpiryDate: String = ""
    @Published var corperateMainActivity: String = ""
    @Published var corperateAverageCredit: String = ""
    @Published var corperateAverageSales: String = ""
    @Published var totalLiabilites: String = ""
    @Published var totalAnnualRevenue: String = ""
    @Published var corperateShortName: String = ""
}
