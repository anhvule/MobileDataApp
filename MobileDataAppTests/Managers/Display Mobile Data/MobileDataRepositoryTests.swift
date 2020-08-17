//
//  MobileDataRepositoryTests.swift
//  MobileDataAppTests
//
//  Created by Le Anh Vu on 17/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
import Cuckoo

@testable import MobileDataApp

class MobileDataRepositoryTests: XCTestCase {

    var sut: MobileDataRepositoryProtocol!
    var apiService: MockMobileDataServiceProtocol!
    var dataManager: MockMobileDataLocalDataManagerProtocol!
    var response: DataStoreSearchResponse!

    var testScheduler: TestScheduler!
    var disposeBag: DisposeBag!
    var mockMobileDataRecords: BehaviorSubject<[YearlyMobileData]?>!

    let mobileData1 = YearlyMobileData(volumeOfMobileData: 1, year: "1", hasDecreasedQuarterlyVolumes: false)
    let mobileData2 = YearlyMobileData(volumeOfMobileData: 2, year: "2", hasDecreasedQuarterlyVolumes: true)
    let mockYearlyVolumes = ["1.544", "6.229", "11.453", "14.639", "21.528", "28.497", "33.595", "41.253", "47.361", "58.501", "75.360"]

    override func setUp() {
        apiService = MockMobileDataServiceProtocol()
        dataManager = MockMobileDataLocalDataManagerProtocol()

        testScheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
        mockMobileDataRecords = BehaviorSubject(value: [])

        Cuckoo.stub(dataManager) { (stub) in
            when(stub.records.get).thenReturn(mockMobileDataRecords.asObservable())
            when(stub.removeAll()).thenDoNothing()
            when(stub.removeAllThenInsert(records: any())).thenDoNothing()
        }

        sut = MobileDataRepository(apiService: apiService, dataManager: dataManager)
    }

    func testEmitRecordsFromDataManager() {
        // Given
        let events: [Recorded<Event<[YearlyMobileData]?>>] = [.next(100, [mobileData1]), .next(150, [mobileData1, mobileData2])]
        let mobileDataObservableEvents = testScheduler.createHotObservable(events)
        Cuckoo.stub(dataManager) { (stub) in
            when(stub.records.get).thenReturn(mobileDataObservableEvents.asObservable())
        }

        // When
        let mobileDataObserverEvents = testScheduler.createObserver([YearlyMobileData]?.self)
        sut.records.bind(to: mobileDataObserverEvents).disposed(by: disposeBag)

        testScheduler.start()

        // Then
        XCTAssertEqual(mobileDataObserverEvents.values, [[mobileData1], [mobileData1, mobileData2]])
    }

    func testFetchMobileDataSuccessfully() {
        // Given
        setupMockMobileData()

        // When
        var yearlyMobileData: [YearlyMobileData]!
        XCTAssertNoThrow(yearlyMobileData = try sut.fetchMobileData(resourceId: "1").toBlocking().single())

        // Then
        XCTAssertEqual(yearlyMobileData.count, 11)
        let year = 2008
        for (index, data) in yearlyMobileData.enumerated() {
            XCTAssertEqual(data.year, String(year + index))
            XCTAssertEqual(String(format: "%.3f", data.volumeOfMobileData), self.mockYearlyVolumes[index])
        }

        verify(dataManager, times(1)).removeAllThenInsert(records: Cuckoo.equal(to: yearlyMobileData))
    }

    func testFetchMobileDataFailure() {
        // Given
        Cuckoo.stub(apiService) { (stub) in
            when(stub.fetchMobileData(resourceId: any())).then { _ in .error(MobileDataError.unexpected(message: "error")) }
        }

        // When
        let result = sut.fetchMobileData(resourceId: "1").toBlocking().materialize()

        // Then
        if case let .failed(_, error) = result, case MobileDataError.unexpected(message: "error") = error {
            verify(dataManager, never()).removeAllThenInsert(records: any())
        } else {
            XCTFail()
        }
    }

    func testFetchMobileDataOffline() {
        // Given
        Cuckoo.stub(apiService) { (stub) in
            when(stub.fetchMobileData(resourceId: any())).then { _ in .error(MobileDataError.network(error: URLError(.networkConnectionLost))) }
        }

        Cuckoo.stub(dataManager) { (stub) in
            when(stub.records.get).then { _ in .just([self.mobileData1, self.mobileData2]) }
        }

        // When
        var result: [YearlyMobileData]!
        XCTAssertNoThrow(result = try sut.fetchMobileData(resourceId: "1").toBlocking().single())

        // Then
        verify(dataManager, never()).removeAllThenInsert(records: any())
        XCTAssertEqual(result, [self.mobileData1, self.mobileData2])
    }

    private func setupMockMobileData() {
        response = try? TestHelper.initByCoder(fromResource: "data-store-search")

        Cuckoo.stub(apiService) { (stub) in
            when(stub.fetchMobileData(resourceId: any())).then { _ in .just(self.response) }
        }
    }
}
