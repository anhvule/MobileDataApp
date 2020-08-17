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

final class MobileDataService: MobileDataServiceProtocol {

    enum Endpoint: String {
        case fetchMobileData = "api/action/datastore_search?resource_id=%@"
    }

    // MARK: Initialization
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }

    func fetchMobileData(resourceId: String) -> Observable<DataStoreSearchResponse> {
        let path = String(format: Endpoint.fetchMobileData.rawValue, resourceId)
        return apiClient.requestData(.get, path: path, payload: nil, headers: nil)
            .decode()
    }

    // MARK: Private

    private let apiClient: APIClientProtocol
}
