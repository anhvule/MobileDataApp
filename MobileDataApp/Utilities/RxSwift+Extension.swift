//
//  RxSwift+Extension.swift
//  MobileDataApp
//
//  Created by Le Anh Vu on 17/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol OptionalProtocol {
    associatedtype Wrapped
    var optionalValue: Wrapped? { get }
}

extension Optional: OptionalProtocol {
    var optionalValue: Wrapped? { return self }
}

extension ObservableType where Self.E: OptionalProtocol {
    func skipNil() -> Observable<Self.E.Wrapped> {
        return self.filter { $0.optionalValue != nil }.map { $0.optionalValue! }
    }
}
