//
//  String.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 29/06/2025.
//

import Foundation

extension String {
    var emailMasked: String {
        let components = self.split(separator: "@")
        
        guard components.count == 2,
              let firstPart = components.first,
              let domainPart = components.last,
              firstPart.count >= 2,
              domainPart.count >= 3 else {
            return ""
        }
        
        let prefix = firstPart.prefix(2)
        let masked = String(repeating: "*", count: max(0, firstPart.count - 2))
        return "\(prefix)\(masked)@\(domainPart)"
    }
    
    var mobileMasked: String {
        guard self.count >= 2 else {
            return ""
        }
        
        let visiblePart = self.suffix(2)
        let maskedPart = String(repeating: "*", count: self.count - 2)
        return maskedPart + visiblePart
    }
}

