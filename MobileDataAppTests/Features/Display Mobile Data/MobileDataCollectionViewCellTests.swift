//
//  MobileDataCollectionViewCellTests.swift
//  MobileDataAppTests
//
//  Created by Le Anh Vu on 17/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import XCTest

@testable import MobileDataApp

class MobileDataCollectionViewCellTests: XCTestCase {

    var sut: MobileDataCollectionViewCell!
    var message: String!

    override func setUp() {
        super.setUp()
        sut = MobileDataCollectionViewCell()
        sut.imageClickedHandler = { [weak self] message in
            self?.message = message
        }
    }

    func testLoadMobileData() {

        // Given
        var mobileData = YearlyMobileData(volumeOfMobileData: 3, year: "2002", hasDecreasedQuarterlyVolumes: true)

        // When
        sut.loadMobileData(mobileData)
        sut.imageTapped(gesture: UIGestureRecognizer())

        // Then
        XCTAssertEqual(sut.yearLabel.text, mobileData.year)
        XCTAssertEqual(sut.dataVolumeLabel.attributedText?.string, "3.0 Petabytes")
        XCTAssertEqual(sut.imageView.image, UIImage(named: "arrow-down"))
        XCTAssertEqual(message, "There is a quarter in 2002 demonstrates a decrease in volume data.")

        // Given
        mobileData.hasDecreasedQuarterlyVolumes = false

        // When
        sut.loadMobileData(mobileData)
        sut.imageTapped(gesture: UIGestureRecognizer())

        // Then
        XCTAssertEqual(sut.imageView.image, UIImage(named: "arrow-up"))
        XCTAssertEqual(message, "There is no quarter in 2002 demonstrates a decrease in volume data.")
    }
}
