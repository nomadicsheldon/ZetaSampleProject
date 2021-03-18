//
//  Result.swift
//  ZetaAssignment
//
//  Created by Himanshu Rajput on 23/01/21.
//

import Foundation

enum Result <T> {
    case success(T)
    case error(ZetaApiError)
}

enum ZetaApiError: Error {
    case apiError
    case headerWrong
    case noInternet
    case invalidData
    case serverError(String)
}

extension ZetaApiError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .apiError:
            return "Error! Please try again."
        case .headerWrong:
            return "header wrong."
        case .noInternet:
            return "Please check internet connection."
        case .invalidData:
            return "Invalid Data."
        case .serverError(let errorMsg):
            return errorMsg
        }
    }
}
