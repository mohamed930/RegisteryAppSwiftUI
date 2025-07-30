//
//  BaseModel.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 29/07/2025.
//

import Foundation

struct BaseModel<T: Codable>: Codable {
    let originalStatusCode: Int
    let responseData: T
    let statusCode: String
    let statusMessage: String
}
