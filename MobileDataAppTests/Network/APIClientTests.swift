//
//  APIClientTests.swift
//  MobileDataAppTests
//
//  Created by Le Anh Vu on 16/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import XCTest
import Cuckoo
import Mockingjay
import RxBlocking

@testable import MobileDataApp

class APIClientTests: XCTestCase {

    var sut: APIClient!

    override func setUp() {
        super.setUp()
        sut = APIClient()
    }

    func testGetRequestDataWithURL() {
        // Given:
        let targetURL = URL(string: "https://data.gov.sg/api/action/datastore_search")!
        var createdRequest: URLRequest?
        stubRequestAndResponse(targetURL, { createdRequest = $0 })

        // When:
        let result = sut.requestData(.get,
                                        path: "/api/action/datastore_search",
                                        payload: nil,
                                        headers: nil).toBlocking(timeout: 1).materialize()

        // Then:
        XCTAssertEqual(createdRequest?.url, targetURL)
        XCTAssertEqual(createdRequest?.httpMethod, "GET")

        if case .completed(let body) = result {
            XCTAssertNotNil(body.count > 0)
        }
    }

    private func stubRequestAndResponse(_ targetURL: URL, _ requestHandler: @escaping (URLRequest) -> Void ) {
        let resBody = ["result": "OK"]
        self.stub({ req -> Bool in
            if req.url == targetURL {
                requestHandler(req)
                return true
            }
            return false
        }, Mockingjay.json(resBody))
    }

}
