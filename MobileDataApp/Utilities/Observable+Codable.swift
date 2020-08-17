//
//  Observable+Codable.swift
//  MobileDataApp
//
//  Created by Le Anh Vu on 16/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import Foundation
import RxSwift

extension Observable where Element == Data {
    func decode<DecodeType: Codable>() -> Observable<DecodeType> {
        return flatMap { data -> Observable<DecodeType> in
            do {
                let decoder = JSONDecoder()
                let castedData = try decoder.decode(DecodeType.self, from: data)
                return .just(castedData)
            } catch {
                return .error(MobileDataError.unexpected(message: error.localizedDescription))
            }
        }
    }
}
