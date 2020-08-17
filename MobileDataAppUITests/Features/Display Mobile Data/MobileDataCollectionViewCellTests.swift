//
//  MobileDataCollectionViewCellTests.swift
//  MobileDataAppUITests
//
//  Created by Le Anh Vu on 17/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import XCTest

class MobileDataCollectionViewCellTests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testClickOnArrow() {

        let volumeTendencyImages = app.images.matching(identifier: "volumeTendency")
        expectForExistance(volumeTendencyImages.element)
        if volumeTendencyImages.count > 0 {
            let firstImage = volumeTendencyImages.element(boundBy: 0)
            firstImage.tap()
        }

        sleep(UInt32(1.0))

        let alertOKButton = app.buttons["OK"]
        expectForExistance(alertOKButton)
    }
}
