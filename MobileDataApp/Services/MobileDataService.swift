//
//  MobileDataServiceProtocol.swift
//  MobileDataApp
//
//  Created by Le Anh Vu on 16/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol MobileDataServiceProtocol: class {
    func fetchMobileData(resourceId: String) -> Observable<DataStoreSearchResponse>
}
