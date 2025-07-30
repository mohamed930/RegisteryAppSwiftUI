//
//  FirstStepViewModel.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 29/07/2025.
//

import Foundation

class FirstStepViewModel: ObservableObject {
    
    @Published var isloading: Bool = false
    @Published var qid: String = ""
    @Published var commercialRecord: String = ""
    @Published var qidError: Bool = false
    @Published var commercialError: Bool = false
    @Published var showAlert: Bool = false
    @Published var alertMess: String = ""
    
    private let endpoint = RegisterationModule()
    
    var data: UserDataModel
    
    @MainActor
    init(data: UserDataModel) {
        self.data = data
        
        Task {
            await self.loadSignupConfig()
        }
    }
    
    func loadSignupConfig() async {
        await startLoader()
        
        do {
            let response = try await endpoint.getSignupConfig()
            
            await stopLoader()
            
            if response.statusCode == "1" {
                print("Success modulation.")
            }
            else {
                print(response.originalStatusCode)
            }
            
        } catch NetworkError.httpError(let code) {
            await stopLoader()
            print("🚫 HTTP Error Code: \(code)")
        } catch {
            await stopLoader()
            print("🔥 Unexpected error: \(error.localizedDescription)")
        }
        
    }
    
    @MainActor
    func startLoader() {
        isloading = true
    }
    
    @MainActor
    func stopLoader() {
        isloading = false
    }
    
    @MainActor
    func showQidError() {
        qidError = true
    }
    
    @MainActor
    func showAlertAction(str: String = "") {
        alertMess = str
        showAlert = true
    }
    
    @MainActor
    func handleValidation() async -> Bool {
        
        if (!qid.isEmpty && qid.count == 11) && !commercialRecord.isEmpty {
            qidError = false
            commercialError = false
            return await callProcessedEndPointOperation()
        }
        else {
            if qid.isEmpty || qid.count != 11 {
                qidError = true
            }
            
            if commercialRecord.isEmpty {
                commercialError = true
            }
            
            return false
        }

    }
    
    func callProcessedEndPointOperation() async -> Bool {
        await startLoader()
        
        do {
            
            let response = try await endpoint.validateCorporateRelation(idNumber: qid, crNumber: commercialRecord)
            
            await stopLoader()
            
            if response.statusCode == "1" {
                if !response.responseData.corporateRim.isEmpty && response.responseData.relationID.isEmpty{
                    await showAlertAction(str: String(localized: "The User has no relation with the corporate"))
                }
                else if response.responseData.isCRExpired == "1" {
                    await showAlertAction(str: String(localized: "The Commercial Registration number is Expire"))
                }
                else {
                    /*
                     OnBoardingData.shared.corrperateRim = model._serverResponse.corporateRim
                    
                    OnBoardingData.shared.relationId = model._serverResponse.relationId
                    OnBoardingData.shared.relationDescription = model._serverResponse.relationDescription
                    
                    OnBoardingData.shared.qauterID = QuaterId
                    OnBoardingData.shared.commercialId = commercialNo
                     */
                    
                    data.setDataForForm1(qid: qid,
                                         commercailRecord: commercialRecord,
                                         rimNo: "",
                                         corrperateRim: response.responseData.corporateRim,
                                         relationId: response.responseData.relationID,
                                         relationDescription: response.responseData.relationDescription)
                    
                    return true
                }
            }
            else {
                print(response.originalStatusCode)
            }
            
            
        } catch NetworkError.httpError(let code) {
            await stopLoader()
            print("🚫 HTTP Error Code: \(code)")
        } catch {
            await stopLoader()
            print("🔥 Unexpected error: \(error.localizedDescription)")
        }
        
        return false
    }
    
    func loadQidCheck() async {
        await startLoader()
        
        if qid.count == 11 {
            
            do {
                let response = try await endpoint.onBoardingCheckCustomer(idNumber: qid)
                
                await stopLoader()
                
                if response.statusCode == "1" {
                    
                    if response.responseData.isSubscripeInDigitalBanking {
                        await showAlertAction()
                    }
                    
                }
                else {
                    print(response.originalStatusCode)
                }
                
            } catch NetworkError.httpError(let code) {
                await stopLoader()
                print("🚫 HTTP Error Code: \(code)")
            } catch {
                await stopLoader()
                print("🔥 Unexpected error: \(error.localizedDescription)")
            }
            
        }
        else {
            await stopLoader()
            await showQidError()
        }
    }
    
    
}
