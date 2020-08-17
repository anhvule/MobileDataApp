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
    var mobileDataRepository: MockMobileDataRepositoryProtocol!

    override func setUp() {
        mobileDataRepository = MockMobileDataRepositoryProtocol()
        sut = MobileDataViewModel(mobileDataRepository: mobileDataRepository)
    }

    func testFetchMobileDataSuccessfully() {
        // Given
        let fetchMobileDataExpectation = expectation(description: #function)
        let year1 = YearlyMobileData(volumeOfMobileData: 1, year: "1", hasDecreasedQuarterlyVolumes: true)
        let year2 = YearlyMobileData(volumeOfMobileData: 2, year: "2", hasDecreasedQuarterlyVolumes: false)
        Cuckoo.stub(mobileDataRepository) { (stub) in
            when(stub.fetchMobileData(resourceId: any())).then { _ in .just([year1, year2]) }
        }

        // When
        sut.reloadMobileData()

        // Then
        let disposable = sut.mobileData.subscribe(onNext: { yearlyMobileData in
            XCTAssertEqual(yearlyMobileData.count, 2)
            XCTAssertEqual(yearlyMobileData[0].year, "1")
            XCTAssertEqual(yearlyMobileData[0].volumeOfMobileData, 1)
            XCTAssertEqual(yearlyMobileData[0].hasDecreasedQuarterlyVolumes, true)
            XCTAssertEqual(yearlyMobileData[1].year, "2")
            XCTAssertEqual(yearlyMobileData[1].volumeOfMobileData, 2)
            XCTAssertEqual(yearlyMobileData[1].hasDecreasedQuarterlyVolumes, false)
            fetchMobileDataExpectation.fulfill()
        })

        verify(mobileDataRepository).fetchMobileData(resourceId: any())

        waitForExpectations(timeout: 0.1) { (_) in
            disposable.dispose()
        }
    }

    func testFetchMobileDataFailure() {
        // Given
        let fetchMobileDataExpectation = expectation(description: #function)
        Cuckoo.stub(mobileDataRepository) { (stub) in
            when(stub.fetchMobileData(resourceId: any())).then { _ in .error(MobileDataError.unexpected(message: "error")) }
        }

        // When
        sut.reloadMobileData()

        // Then
        let disposable = sut.error.subscribe(onNext: { error in
            if let error = error, case MobileDataError.unexpected(let message) = error {
                XCTAssertEqual(message, "error")
            } else {
                XCTFail()
            }
            fetchMobileDataExpectation.fulfill()
        })

        verify(mobileDataRepository).fetchMobileData(resourceId: any())

        waitForExpectations(timeout: 0.1) { (_) in
            disposable.dispose()
        }
    }
}
