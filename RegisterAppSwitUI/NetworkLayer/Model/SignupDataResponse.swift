//
//  SignupDataResponse.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 29/07/2025.
//

import Foundation

struct SignupDataResponse: Codable {
    let qidAttributes: [QidAttribute]
    let expiredQidIsAllowed, qidGracePeriod, passwordPolicyText: String
    let nationality: [Nationality]
    let applyFaceRecognition, faceMatchingPercentage, termsAndConditions, allowOTP: String
    let otpValidityTime, enableThridPartyScan, enableCrThirdPartyScan: String
}

// MARK: - Nationality
struct Nationality: Codable {
    let nationalityID, nationalityDesc, countryCode: String

    enum CodingKeys: String, CodingKey {
        case nationalityID = "nationalityId"
        case nationalityDesc, countryCode
    }
}

// MARK: - QidAttribute
struct QidAttribute: Codable {
    let isMandatory, fieldName: String
    let fieldType: FieldType
    let fieldLength: String
}

enum FieldType: String, Codable {
    case date = "DATE"
    case number = "NUMBER"
    case text = "TEXT"
}
