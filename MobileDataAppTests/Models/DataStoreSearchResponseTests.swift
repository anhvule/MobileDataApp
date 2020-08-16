//
//  DataStoreSearchResponseTests.swift
//  MobileDataAppTests
//
//  Created by Le Anh Vu on 16/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import XCTest

@testable import MobileDataApp

class DataStoreSearchResponseTests: XCTestCase {

    var sut: DataStoreSearchResponse!

    func testDecode() {
        //Given:
        var data: DataStoreSearchResponse!

        //When:
        XCTAssertNoThrow(data = try TestHelper.initByCoder(fromResource: "data-store-search"))

        //Then:
        assert(response: data)
    }
}

func assert(response: DataStoreSearchResponse?) {
    guard let response = response else {
        XCTFail()
        return
    }

    XCTAssertEqual(response.result.records.count, 59)
    XCTAssertEqual(response.result.records[0].id, 1)
    XCTAssertEqual(response.result.records[0].quarter, "2004-Q3")
    XCTAssertEqual(response.result.records[0].volumeOfMobileData, 0.000384)
}
