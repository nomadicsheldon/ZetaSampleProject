//
//  DashboardViewModel.swift
//  ZetaAssignment
//
//  Created by Himanshu Rajput on 23/01/21.
//

import Foundation

class DashboardViewModel {
    public typealias CallCompletion = (String?, Bool?) -> Void
    
    private var dashboardDataModel: DashboardDataModel?
    
    // MARK:- Data accessing
    public func numberOfRows() -> Int {
        return self.dashboardDataModel?.items.count ?? 0
    }
    
    public func queryModel() -> QueriesModel? {
        return dashboardDataModel?.queriesModel
    }
    
    public func itemAtIndex(at index: Int) -> ItemModel? {
        return dashboardDataModel?.items[index]
    }
    
    // MARK:- API Handling
    public func getSearchData(searchKey: String, callback: @escaping CallCompletion) {
        DashboardApiHandler.fetchSearchData(seachKey: searchKey) { (errorMsg, response) in
            if let error = errorMsg {
                callback(error, true)
                return
            }
            
            if let result = response, let dashboardDataModel = DashboardDataModel.createModel(from: result) {
                self.dashboardDataModel = dashboardDataModel
                callback(nil, true)
            }
        }
    }
    
    public func getSearchDataWithIdx(searchKey: String, startIndex: Int, callback: @escaping CallCompletion) {
        DashboardApiHandler.fetchSearchDataWithIdx(seachKey: searchKey, startIndex: startIndex) { (errorMsg, response) in
            if let error = errorMsg {
                callback(error, true)
                return
            }
            
            if let result = response, let dashboardDataModel = DashboardDataModel.createModel(from: result) {
                self.dashboardDataModel = dashboardDataModel
                callback(nil, true)
            }
        }
    }
}
