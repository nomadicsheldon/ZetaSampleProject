//
//  DashboardApiHandler.swift
//  ZetaAssignment
//
//  Created by Himanshu Rajput on 23/01/21.
//

import Foundation
import Alamofire

struct DashboardApiHandler {
    public typealias CallCompletion = (String?, [String: Any]?) -> Void
    
    static public func fetchSearchData(seachKey: String, callback: @escaping CallCompletion) {
        let fetchSearchDataUrl = String(format: "%@?q=%@&cx=%@&key=%@", ZetaUrl.searchUrl.request, seachKey, AppKeysConstant.CX, AppKeysConstant.KEY)
        print(fetchSearchDataUrl)
        NetworkManager.sharedManager.jsonGetTask(requestURL: fetchSearchDataUrl, dataParams: nil) { result in
            switch result {
            case .success(let jsonDict):
                callback(nil, jsonDict as? [String: Any])
            case .error(let error):
                callback(error.localizedDescription, nil)
            }
        }
    }
    
    static public func fetchSearchDataWithIdx(seachKey: String, startIndex:Int, callback: @escaping CallCompletion) {
        let startIndexString = String(startIndex)
        let fetchSearchDataUrl = String(format: "%@?q=%@&cx=%@&key=%@&start=%@", ZetaUrl.searchUrl.request, seachKey, AppKeysConstant.CX, AppKeysConstant.KEY,startIndexString)
        print(fetchSearchDataUrl)
        NetworkManager.sharedManager.jsonGetTask(requestURL: fetchSearchDataUrl, dataParams: nil) { result in
            switch result {
            case .success(let jsonDict):
                callback(nil, jsonDict as? [String: Any])
            case .error(let error):
                callback(error.localizedDescription, nil)
            }
        }
    }
}
