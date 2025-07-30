//
//  UserDataModel.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 30/07/2025.
//

import Foundation

class UserDataModel: ObservableObject {
    var qid: String = ""
    var commercailRecord: String = ""
    var rimNo: String = ""
    var corrperateRim: String = ""
    var relationId: String = ""
    var relationDescription: String = ""
    
    func setDataForForm1(qid: String, commercailRecord: String, rimNo: String, corrperateRim: String, relationId: String, relationDescription: String) {
        self.qid = qid
        self.commercailRecord = commercailRecord
        self.rimNo = rimNo
        self.corrperateRim = corrperateRim
        self.relationId = relationId
        self.relationDescription = relationDescription
    }
}
