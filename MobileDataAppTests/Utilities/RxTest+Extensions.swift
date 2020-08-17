//
//  RxTest+Extensions.swift
//  MobileDataAppTests
//
//  Created by Le Anh Vu on 17/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import Foundation
import RxTest

extension TestableObserver {
    var values: [Element] {
        return events.compactMap { $0.value.element }
    }
}
