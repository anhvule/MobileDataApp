//
//  MobileDataRepository.swift
//  MobileDataApp
//
//  Created by Le Anh Vu on 17/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol MobileDataRepositoryProtocol: class {
    var records: Observable<[YearlyMobileData]?> { get }
    func fetchMobileData(resourceId: String) -> Observable<[YearlyMobileData]>
}

final class MobileDataRepository: MobileDataRepositoryProtocol {

    // MARK: Initialization
    init(apiService: MobileDataServiceProtocol,
         dataManager: MobileDataLocalDataManagerProtocol) {
        self.apiService = apiService
        self.dataManager = dataManager
    }

    var records: Observable<[YearlyMobileData]?> {
        return dataManager.records
    }

    func fetchMobileData(resourceId: String) -> Observable<[YearlyMobileData]> {
        let task: Observable<[YearlyMobileData]>
        task = apiService.fetchMobileData(resourceId: resourceId)
                    .observeOn(MainScheduler.instance)
                    .flatMap { [weak self] (response) -> Observable<[YearlyMobileData]> in
                        guard let strongSelf = self else { return .just([]) }
                        let dict = strongSelf.transform(records: response.result.records)
                        return .just(dict)
                    }
        return task
            .flatMap { [weak self] (result) -> Observable<[YearlyMobileData]> in
                guard let strongSelf = self else { return .just([]) }
                strongSelf.dataManager.removeAllThenInsert(records: result)

                return .just(result)
            }.catchError({ [weak self] (error) -> Observable<[YearlyMobileData]> in
                guard let strongSelf = self else { return .just([]) }
                if let networkError = (error as? MobileDataError),
                    case .network(_) = networkError {
                    return strongSelf.records.skipNil()
                }

                return .error(error)
            })
    }

    // MARK: Private
    private let apiService: MobileDataServiceProtocol
    private let dataManager: MobileDataLocalDataManagerProtocol
    private let minYear = Int(2008)
    private let maxYear = Int(2018)

    private func transform(records: [QuarterlyMobileData]) -> [YearlyMobileData] {
        var dict = [String: YearlyMobileData]()

        for (index, data) in records.enumerated() {
            let year = String(data.quarter.prefix(4))

            guard let yearInt = Int(year), minYear...maxYear ~= yearInt else { continue }

            var totalVolumeOfMobileData = data.volumeOfMobileData ?? 0
            var hasDecreasedQuarterlyVolumes = false

            if let item = dict[year] {
                totalVolumeOfMobileData += item.volumeOfMobileData
            }

            if index > 0,
                let previousQuarterData = records[index-1].volumeOfMobileData,
                let currentQuarterData = data.volumeOfMobileData,
                previousQuarterData > currentQuarterData {
                hasDecreasedQuarterlyVolumes = true
            }

            dict[year] = YearlyMobileData(volumeOfMobileData: totalVolumeOfMobileData, year: year, hasDecreasedQuarterlyVolumes: hasDecreasedQuarterlyVolumes)
        }

        return Array(dict.values).sorted { $0.year < $1.year }
    }
}
