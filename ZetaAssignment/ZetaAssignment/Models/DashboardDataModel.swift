//
//  DashboardDataModel.swift
//  ZetaAssignment
//
//  Created by Himanshu Rajput on 23/01/21.
//

import Foundation


struct DashboardDataModel: Codable {
    var kind: String?
    var urlModel: URLModel
    var queriesModel: QueriesModel
    var searchInformationModel: SearchInformationModel
    var items: [ItemModel]
    
    private enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case urlModel = "url"
        case queriesModel = "queries"
        case searchInformationModel = "searchInformation"
        case items = "items"
    }
    
    static func createModel(from jsonDict: [String: Any]) -> DashboardDataModel? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonDict)
            let decodedModel = try JSONDecoder().decode(DashboardDataModel.self, from: jsonData)
            return decodedModel
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
}

struct URLModel: Codable {
    var type: String?
    var template: String?
}

struct QueriesModel: Codable {
    var request: [QueryModel]
    var nextPage: [QueryModel]?
    var previousPage: [QueryModel]?
}

struct QueryModel: Codable {
    var count: Int?
    var searchTerms: String?
    var startIndex: Int?
    var totalResults: String?
}

struct SearchInformationModel: Codable {
    var formattedSearchTime: String?
    var formattedTotalResults: String?
    var totalResults: String?
}

struct ItemModel: Codable {
    var title: String?
    var snippet: String?
    var pageMapModel: PageMapModel
    
    private enum CodingKeys: String, CodingKey {
        case pageMapModel = "pagemap"
        case title = "title"
        case snippet = "snippet"
    }
}

struct PageMapModel: Codable {
    var cseImageModel: [CseImageModel]?
    private enum CodingKeys: String, CodingKey {
        case cseImageModel = "cse_image"
    }
}

struct CseImageModel: Codable {
    var src: String?
}
