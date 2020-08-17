//
//  MobileDataServiceTests.swift
//  MobileDataAppTests
//
//  Created by Le Anh Vu on 16/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import XCTest
import Cuckoo
import RxSwift
import Alamofire

@testable import MobileDataApp

class MobileDataServiceTests: XCTestCase {

    var apiClient: MockAPIClientProtocol!
    var sut: MobileDataServiceProtocol!
    let resourceId = "resourceId"

    override func setUp() {
        super.setUp()
        apiClient = MockAPIClientProtocol()
        sut = MobileDataService(apiClient: apiClient)
    }

    func testFetchMobileDataSuccessfully() {
        // Given
        let fetchMobileDataExpectation = expectation(description: #function)

        var data: Data!
        XCTAssertNoThrow(data = try TestHelper.loadJsonData(forResource: "data-store-search"))

        Cuckoo.stub(apiClient, block: { (stub) in
            when(stub.requestData(any(), path: any(), payload: any(), headers: any())).then { _ in .just(data) }
        })

        sut = MobileDataService(apiClient: apiClient)

        // When
        let disposable = sut.fetchMobileData(resourceId: resourceId)
            .subscribe(onNext: { (mobileData) in
                XCTAssertEqual(mobileData.result.records.count, 59)
                fetchMobileDataExpectation.fulfill()
        })

        // Then
        let path = String(format: MobileDataService.Endpoint.fetchMobileData.rawValue, resourceId)
        verify(apiClient).requestData(ParameterMatcher<HTTPMethod> { $0 == .get },
                                      path: path,
                                      payload: isNil(),
                                      headers: isNil())
        waitForExpectations(timeout: 0.1) { _ in
            disposable.dispose()
        }
    }

    func testFetchMobileDataListFailure() {
        // Given
        let fetchMobileDataExpectation = expectation(description: #function)

        Cuckoo.stub(apiClient, block: { (stub) in
            when(stub.requestData(any(), path: any(), payload: any(), headers: any())).then { _ in .error(MobileDataError.apiError(errorData: ErrorData(message: "error"))) }
        })

        sut = MobileDataService(apiClient: apiClient)

        // When
        let disposable = sut.fetchMobileData(resourceId: "resourceId")
            .subscribe(onError: { (error) in
                if let MobileDataError = error as? MobileDataError, case .apiError(let errorData) = MobileDataError {
                    XCTAssertEqual(errorData.message, "error")
                    fetchMobileDataExpectation.fulfill()
                }
        })

        // Then
        let path = String(format: MobileDataService.Endpoint.fetchMobileData.rawValue, resourceId)
        verify(apiClient).requestData(ParameterMatcher<HTTPMethod> { $0 == .get },
                                      path: path,
                                      payload: isNil(),
                                      headers: isNil())
        waitForExpectations(timeout: 0.1) { _ in
            disposable.dispose()
        }
    }
}
