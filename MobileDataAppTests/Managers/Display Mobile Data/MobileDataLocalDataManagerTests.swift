//
//  MobileDataLocalDataManagerTests.swift
//  MobileDataAppTests
//
//  Created by Le Anh Vu on 17/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import XCTest
import RxSwift
import RxTest

@testable import MobileDataApp

class MobileDataLocalDataManagerTests: XCTestCase {

    var sut: MobileDataLocalDataManager!
    var testScheduler: TestScheduler!
    var disposeBag: DisposeBag!

    override func setUp() {
        testScheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
        sut = MobileDataLocalDataManager()
    }

    func testRemoveAllThenInsert() {
        let events = testScheduler.createObserver([YearlyMobileData]?.self)
        sut.records.bind(to: events).disposed(by: disposeBag)

        let items1 = [
            YearlyMobileData(volumeOfMobileData: 1, year: "1", hasDecreasedQuarterlyVolumes: false),
            YearlyMobileData(volumeOfMobileData: 2, year: "2", hasDecreasedQuarterlyVolumes: true)
        ]

        let items2 = [
            YearlyMobileData(volumeOfMobileData: 3, year: "3", hasDecreasedQuarterlyVolumes: false),
            YearlyMobileData(volumeOfMobileData: 4, year: "4", hasDecreasedQuarterlyVolumes: true)
        ]

        testScheduler.start()
        sut.removeAllThenInsert(records: items1)
        sut.removeAllThenInsert(records: items2)
        sut.removeAll()

        XCTAssertEqual(events.values.count, 4)
        XCTAssertEqual(events.values[0], [])
        XCTAssertEqual(events.values[1], items1)
        XCTAssertEqual(events.values[2], items2)
        XCTAssertEqual(events.values[3], [])
    }
}
