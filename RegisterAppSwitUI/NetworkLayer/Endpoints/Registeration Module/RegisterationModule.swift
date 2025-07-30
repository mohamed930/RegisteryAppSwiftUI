//
//  RegisterationModule.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 29/07/2025.
//

import Foundation

class RegisterationModule {
    
    private var api = RestAPIFacade()
    
    func getSignupConfig() async throws -> BaseModel<SignupDataResponse> {
        let requestParams = Params(
            endpoint: "getSignupConfig", // Update this with the actual endpoint
            methodType: .post,
            paramsType: .query,
            params: [:], // No parameters for this request
            headers: [:]
        )
        
        do {
            let result: BaseModel<SignupDataResponse> = try await api.loadData(params: requestParams)
            return result
        } catch {
            throw error
        }
    }
    
    func onBoardingCheckCustomer(idNumber: String) async throws -> BaseModel<OnBoardingCheckCustomerModel> {
        let requestParams = Params(
            endpoint: "onBoardingCheckCustomer", // Update this with the actual endpoint
            methodType: .post,
            paramsType: .formURLEncoded,
            params: ["idNumber":idNumber], // No parameters for this request
            headers: [:]
        )
        
        do {
            let result: BaseModel<OnBoardingCheckCustomerModel> = try await api.loadData(params: requestParams)
            return result
        } catch {
            throw error
        }
    }
    
    func validateCorporateRelation(idNumber: String,crNumber: String) async throws -> BaseModel<ValidateCorporateRelation> {
        let requestParams = Params(
            endpoint: "validateCorporateRelation", // Update this with the actual endpoint
            methodType: .post,
            paramsType: .formURLEncoded,
            params: ["civilId":idNumber,"crNumber": crNumber], // No parameters for this request
            headers: [:]
        )
        
        do {
            let result: BaseModel<ValidateCorporateRelation> = try await api.loadData(params: requestParams)
            return result
        } catch {
            throw error
        }
    }
}
