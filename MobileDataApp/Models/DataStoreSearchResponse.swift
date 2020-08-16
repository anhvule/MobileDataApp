//
//  DataStoreSearchResponse.swift
//  MobileDataApp
//
//  Created by Le Anh Vu on 16/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import Foundation

// MARK: - DataStoreSearchResponse
struct DataStoreSearchResponse: Codable {
    var help: String
    var success: Bool
    var result: Result
}

// MARK: - Result
struct Result: Codable {
    var resourceID: String
    var fields: [Field]
    var records: [QuarterlyMobileData]
    var links: Links
    var total: Int

    enum CodingKeys: String, CodingKey {
        case resourceID = "resource_id"
        case fields, records
        case links = "_links"
        case total
    }
}

// MARK: - Field
struct Field: Codable {
    var type: String
    var id: String
}

// MARK: - Links
struct Links: Codable {
    var start: String
    var next: String
}

// MARK: - QuarterlyMobileData
struct QuarterlyMobileData {
    var volumeOfMobileData: Double?
    var quarter: String
    var id: Int
}

extension QuarterlyMobileData: Codable {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        volumeOfMobileData = Double(try container.decode(String.self, forKey: .volumeOfMobileData))
        quarter = try container.decode(String.self, forKey: .quarter)
        id = try container.decode(Int.self, forKey: .id)
    }

    enum CodingKeys: String, CodingKey {
        case volumeOfMobileData = "volume_of_mobile_data"
        case quarter
        case id = "_id"
    }
}

struct YearlyMobileData {
    var volumeOfMobileData: Double
    var year: String
    var hasDecreasedQuarterlyVolumes: Bool
}
