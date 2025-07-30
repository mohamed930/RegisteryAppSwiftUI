//
//  ParamsType.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 29/07/2025.
//

import Foundation

enum ParamsType {
    case query
    case body
    case multipart
    case formURLEncoded
}

enum RequestMethod: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}

enum NetworkError: Error {
    case httpError(statusCode: Int)
    case other(Error)
}

struct UploadFile {
    let fieldName: String
    let fileName: String
    let mimeType: String
    let fileData: Data
}

struct Params {
    let BaseURL: String = "http://10.24.24.190:7001/EthixNetMobileWS-1.0/api/main/"
    let token: String = "Bearer \(UserDefaults.standard.string(forKey: "authKey") ?? "")"
    let endpoint: String
    let methodType: RequestMethod
    let paramsType: ParamsType
    let params: [String: Any]
    let headers: [String: String]
    let file: UploadFile?
    
    init(endpoint: String, methodType: RequestMethod, paramsType: ParamsType, params: [String : Any], headers: [String : String], file: UploadFile? = nil) {
        self.endpoint = endpoint
        self.methodType = methodType
        self.paramsType = paramsType
        self.params = params
        self.headers = headers
        self.file = file
    }
}

class RestAPIFacade {
    
    func loadData<T: Codable>(params: Params) async throws -> T {
        // Build the final URL
        var finalURL = URL(string: params.BaseURL + params.endpoint)
        
        // Create custom session with redirect handler
        let redirectHandler = RedirectHandler(token: params.token)
        let session = URLSession(configuration: .default, delegate: redirectHandler, delegateQueue: nil)
        
        // Handle query parameters
        if params.paramsType == .query, !params.params.isEmpty {
            if var components = URLComponents(url: finalURL!, resolvingAgainstBaseURL: false) {
                components.queryItems = params.params.map {
                    URLQueryItem(name: $0.key, value: "\($0.value)")
                }
                finalURL = components.url
            }
        }

        guard let url = finalURL else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = params.methodType.rawValue

        // Set Authorization header
        if params.token != "Bearer " {
            request.setValue(params.token, forHTTPHeaderField: "Authorization")
        }
        
        request.setValue(UUID().uuidString, forHTTPHeaderField: "imei")
        request.setValue(Locale.current.language.languageCode?.identifier ?? "en", forHTTPHeaderField: "lang")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        

        // Add any other custom headers
        for (key, value) in params.headers {
            request.setValue(value, forHTTPHeaderField: key)
        }

        // Multipart body
        if let file = params.file {
            let boundary = UUID().uuidString
            let body = createMultipartFormData(params: params.params, file: file, boundary: boundary)
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            request.httpBody = body
        }

        // JSON body
        else if params.paramsType == .body, !params.params.isEmpty {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try JSONSerialization.data(withJSONObject: params.params)
        }
        
        // formURLEncoded
        else if params.paramsType == .formURLEncoded, !params.params.isEmpty {
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            let bodyString = params.params.map { "\($0.key)=\("\($0.value)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")" }
                                          .joined(separator: "&")
            request.httpBody = bodyString.data(using: .utf8)
        }

        // Perform request
        let (data, response) = try await session.data(for: request)

        // Log request & response
        let appBuildNumber = Bundle.main.object(forInfoDictionaryKey: "Debugging") as? Bool
        if appBuildNumber ?? false {
            self.debugLog(request: request, responseData: data)
        }

        // Validate response
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        if httpResponse.statusCode == 401 {
            throw NetworkError.httpError(statusCode: httpResponse.statusCode)
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            let serverMessage = String(data: data, encoding: .utf8) ?? "Unknown error"
            print("❌ HTTP \(httpResponse.statusCode): \(serverMessage)")
            throw NetworkError.httpError(statusCode: httpResponse.statusCode)
        }

        // Decode to model
        let decoded = try JSONDecoder().decode(T.self, from: data)
        return decoded
    }
    
    private func createMultipartFormData(params: [String: Any], file: UploadFile, boundary: String) -> Data {
        var body = Data()
        let boundaryPrefix = "--\(boundary)\r\n"

        // Append form fields
        for (key, value) in params {
            body.appendString(string: boundaryPrefix)
            body.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
            body.appendString(string: "\(value)\r\n")
        }

        // Append file field
        body.appendString(string: boundaryPrefix)
        body.appendString(string: "Content-Disposition: form-data; name=\"\(file.fieldName)\"; filename=\"\(file.fileName)\"\r\n")
        body.appendString(string: "Content-Type: \(file.mimeType)\r\n\r\n")
        body.append(file.fileData)
        body.appendString(string: "\r\n")

        // Close boundary
        body.appendString(string: "--\(boundary)--\r\n")

        return body
    }
    
    
    private func debugLog(request: URLRequest, responseData: Data?) {
        print("\n======= 🌐 DEBUG REQUEST LOG =======")

        // URL & Method
        print("➡️ URL: \(request.url?.absoluteString ?? "nil")")
        print("➡️ Method: \(request.httpMethod ?? "nil")")

        // Headers
        print("➡️ Headers:")
        request.allHTTPHeaderFields?.forEach { print("   \($0): \($1)") }

        // Body
        if let body = request.httpBody {
            if let contentType = request.value(forHTTPHeaderField: "Content-Type"),
               contentType.starts(with: "multipart/form-data") {

                print("➡️ Multipart Body (raw):")
                if let bodyString = String(data: body, encoding: .utf8) {
                    print(bodyString)
                } else {
                    print("   ⚠️ Multipart data could not be converted to string")
                }

            } else if let jsonObject = try? JSONSerialization.jsonObject(with: body),
                      let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
                      let jsonString = String(data: jsonData, encoding: .utf8) {
                print("➡️ Body JSON:")
                print(jsonString)
            } else if let stringBody = String(data: body, encoding: .utf8) {
                print("➡️ Body Raw:")
                print(stringBody)
            } else {
                print("➡️ Body: {}")
            }
        } else {
            print("➡️ Body: {}")
        }

        // Response
        if let responseData = responseData,
           let json = try? JSONSerialization.jsonObject(with: responseData, options: []),
           let responsePretty = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
           let responseString = String(data: responsePretty, encoding: .utf8) {
            print("📦 Response Body:\n\(responseString)")
        } else if let responseData = responseData,
                  let responseString = String(data: responseData, encoding: .utf8) {
            print("📦 Response Body:\n\(responseString)")
        } else {
            print("📦 Response Body: nil")
        }

        print("======= END DEBUG LOG =======\n")
    }

}


class RedirectHandler: NSObject, URLSessionDelegate, URLSessionTaskDelegate {
    let token: String

    init(token: String) {
        self.token = token
    }

    func urlSession(_ session: URLSession,
                    task: URLSessionTask,
                    willPerformHTTPRedirection response: HTTPURLResponse,
                    newRequest request: URLRequest,
                    completionHandler: @escaping (URLRequest?) -> Void) {
        var newRequest = request
        newRequest.setValue(token, forHTTPHeaderField: "Authorization")
        completionHandler(newRequest)
    }
}

extension Data {
    mutating func appendString(string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
