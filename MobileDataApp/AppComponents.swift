//
//  AppComponents.swift
//  MobileDataApp
//
//  Created by Le Anh Vu on 17/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import Foundation

final class AppComponents {

    static var mobileDataService: MobileDataServiceProtocol = {
        return MobileDataService(apiClient: apiClient)
    }()

    static var mobileDataLocalDataManager: MobileDataLocalDataManagerProtocol = {
        return MobileDataLocalDataManager()
    }()

    static var mobileDataRepository: MobileDataRepositoryProtocol = {
        return MobileDataRepository(apiService: mobileDataService, dataManager: mobileDataLocalDataManager)
    }()

    static var apiClient: APIClientProtocol = {
        return APIClient()
    }()
}
