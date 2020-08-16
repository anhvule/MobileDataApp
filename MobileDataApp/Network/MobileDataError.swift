//
//  MobileDataError.swift
//  MobileDataApp
//
//  Created by Le Anh Vu on 16/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import Foundation

public enum MobileDataError: Error, CustomStringConvertible, LocalizedError {

    case network(error: Error)

    case unexpected(message: String)

    case apiError(errorData: ErrorData)

    case invalidURL

    public var description: String {
        switch self {

        case .network(let error):
            return error.localizedDescription

        case .apiError(let errorData):
            return "\(errorData.message)"

        case .unexpected(let message):
            return "Unexpected Error: \(message)"

        case .invalidURL:
            return "Invalid Url"
        }
    }
}

public struct ErrorData: Codable {
    public var code: Int?
    public var message: String
}

// MARK: - CustomDebugStringConvertible

extension ErrorData: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "code: \(String(describing: code)) \nmessage: \(message)"
    }
}
