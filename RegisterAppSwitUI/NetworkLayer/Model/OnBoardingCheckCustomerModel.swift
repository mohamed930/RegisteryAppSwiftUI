//
//  OnBoardingCheckCustomerModel.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 30/07/2025.
//

import Foundation

struct OnBoardingCheckCustomerModel: Codable {
    let isExistInCore: Bool
    let rimNo: String
    let isSubscripeInDigitalBanking: Bool
    let isInProgressRequest, blackListStatus, mobileNumber, email: String
    let isIDExpired, expiryDays: String

    enum CodingKeys: String, CodingKey {
        case isExistInCore, rimNo, isSubscripeInDigitalBanking, isInProgressRequest, blackListStatus, mobileNumber, email
        case isIDExpired = "isIdExpired"
        case expiryDays
    }
}
