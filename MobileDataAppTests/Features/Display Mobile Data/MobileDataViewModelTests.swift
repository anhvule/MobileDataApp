//
//  MobileDataViewModelTests.swift
//  MobileDataAppTests
//
//  Created by Le Anh Vu on 16/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import XCTest
import Cuckoo
import RxSwift

@testable import MobileDataApp

class MobileDataViewModelTests: XCTestCase {

    var sut: MobileDataViewModelProtocol!
    var mobileDataService: MockMobileDataServiceProtocol!
    var response: DataStoreSearchResponse!
    let mockYearlyVolumes = ["0.001", "0.003", "0.007", "0.197", "1.544", "6.229", "11.453", "14.639", "21.528", "28.497", "33.595", "41.253", "47.361", "58.501", "75.360", "20.535"]

    override func setUp() {
        mobileDataService = MockMobileDataServiceProtocol()
        sut = MobileDataViewModel(mobileDataService: mobileDataService)
    }

    func testFetchMobileData() {
        // Given
        let fetchMobileDataExpectation = expectation(description: #function)
        setupMockMobileData()

        // When
        sut.reloadMobileData()

        // Then
        let disposable = sut.mobileData.subscribe(onNext: { yearlyMobileData in
            XCTAssertEqual(yearlyMobileData.count, 16)
            let year = 2004
            for (index, data) in yearlyMobileData.enumerated() {
                XCTAssertEqual(data.year, String(year + index))
                XCTAssertEqual(String(format: "%.3f", data.volumeOfMobileData), self.mockYearlyVolumes[index])
            }
            fetchMobileDataExpectation.fulfill()
        })

        verify(mobileDataService).fetchMobileData(resourceId: any())

        waitForExpectations(timeout: 0.1) { (_) in
            disposable.dispose()
        }
    }

    func testFetchEmptyMobileData() {
        // Given
        let fetchMobileDataExpectation = expectation(description: #function)
        let emptyResponse = DataStoreSearchResponse(help: "", success: true, result: Result(resourceID: "", fields: [], records: [], links: Links(start: "", next: ""), total: 1))

        Cuckoo.stub(mobileDataService) { (stub) in
            when(stub.fetchMobileData(resourceId: any())).then { _ in .just(emptyResponse) }
        }

        // When
        sut.reloadMobileData()

        // Then
        let disposable = sut.mobileData.subscribe(onNext: { tabbedMobileData in
            XCTAssertEqual(tabbedMobileData.count, 0)
            fetchMobileDataExpectation.fulfill()
        })

        verify(mobileDataService).fetchMobileData(resourceId: any())

        waitForExpectations(timeout: 0.1) { (_) in
            disposable.dispose()
        }
    }

    func testFetchMobileDataFailed() {
        // Given
        let fetchMobileDataExpectation = expectation(description: #function)

        Cuckoo.stub(mobileDataService) { (stub) in
            when(stub.fetchMobileData(resourceId: any())).then { _ in .error(MobileDataError.apiError(errorData: ErrorData(message: "API Error"))) }
        }

        // When
        sut.reloadMobileData()

        // Then
        let disposable = sut.error.subscribe(onNext: { error in
            if let error = error as? MobileDataError, case .apiError(let errorData) = error {
                XCTAssertEqual(errorData.message, "API Error")
                fetchMobileDataExpectation.fulfill()
            }
        })

        verify(mobileDataService).fetchMobileData(resourceId: any())

        waitForExpectations(timeout: 0.1) { (_) in
            disposable.dispose()
        }
    }

    private func setupMockMobileData() {
        response = try? TestHelper.initByCoder(fromResource: "data-store-search")

        Cuckoo.stub(mobileDataService) { (stub) in
            when(stub.fetchMobileData(resourceId: any())).then { _ in .just(self.response) }
        }
    }
}
