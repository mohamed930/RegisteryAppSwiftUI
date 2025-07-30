//
//  ValidateCorporateRelation.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 30/07/2025.
//


import Foundation

struct ValidateCorporateRelation: Codable {
    let corporateRim, corporateName, relationID, relationDescription: String
    let isCRExpired, establishmentDate, crExpiryDate, mainActivity: String
    let averageSales, averageCredit, totalLiabilities, annualRevenue: String

    enum CodingKeys: String, CodingKey {
        case corporateRim, corporateName
        case relationID = "relationId"
        case relationDescription
        case isCRExpired = "isCrExpired"
        case establishmentDate, crExpiryDate, mainActivity, averageSales, averageCredit, totalLiabilities, annualRevenue
    }
}
