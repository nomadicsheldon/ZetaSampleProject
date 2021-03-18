//
//  NetworkManager.swift
//  ZetaAssignment
//
//  Created by Himanshu Rajput on 23/01/21.
//

import Foundation
import Alamofire

final class NetworkManager: NSObject {
    
    static var sharedManager = NetworkManager()
    typealias JSONTaskCompletionHandler = (Result<Any>) -> Void
    
    
    func jsonGetTask(requestURL: String, dataParams:[String: Any]?, completionHandler completion: @escaping JSONTaskCompletionHandler) {
        if NetworkReachabilityManager()?.isReachable == false {
            completion(.error(.noInternet))
        }
        
        let httpHeaders: HTTPHeaders = [
            "Content-Type": "application/json",
            "cache-control": "no-cache"
        ]
        
        AF.request(requestURL, method: .get, parameters: dataParams, encoding: JSONEncoding.default, headers: httpHeaders).validate(statusCode: 200 ..< 300).responseJSON { responseObject in
            switch responseObject.result {
            case .success(let jsonData):
                if let dict = jsonData as? [String: Any] {
                    completion(.success(dict))
                } else {
                    completion(.error(.invalidData))
                }
            
            case .failure(let error):
                if let data = responseObject.data,
                   let errorObject = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments),
                   let errorDict = errorObject as? [String: Any],
                   let errorMessage = errorDict["message"] as? String {
                    debugPrint(errorObject)
                    completion(.error(.serverError(errorMessage)))
                } else {
                    debugPrint(error.localizedDescription)
                    completion(.error(.invalidData))
                }
            }
            
        }
        
    }
    
}
