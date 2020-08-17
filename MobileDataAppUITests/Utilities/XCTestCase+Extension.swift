//
//  XCTestCase+Extension.swift
//  MobileDataAppUITests
//
//  Created by Le Anh Vu on 17/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import XCTest

let DefaultTimeout: TimeInterval = 10

extension XCTestCase {
    func expectForExistance(_ element: XCUIElement, _ message: @autoclosure () -> String = "", timeout: TimeInterval = DefaultTimeout, file: StaticString = #file, line: UInt = #line) {
        XCTAssert(element.waitForExistence(timeout: DefaultTimeout), message(), file: file, line: line)
    }
}
