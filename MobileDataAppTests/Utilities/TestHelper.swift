//
//  TestHelper.swift
//  MobileDataAppTests
//
//  Created by Le Anh Vu on 16/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import Foundation

final class TestHelper: NSObject {
    static func loadJsonData(forResource resource: String) throws -> Data {
        guard let fileUrl = Bundle(for: TestHelper.classForCoder())
            .url(forResource: resource, withExtension: ".json") else {
                throw NSError(domain: "Test", code: 0, userInfo: [NSLocalizedDescriptionKey: "Resource Not Found"])
        }

        return try Data(contentsOf: fileUrl)
    }

    static func initByCoder<T: Decodable>(fromResource resource: String) throws -> T {
        let data = try loadJsonData(forResource: resource)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
