//
//  MobileDataViewModel.swift
//  MobileDataApp
//
//  Created by Le Anh Vu on 16/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol MobileDataViewModelProtocol: class {
    var mobileData: Observable<[YearlyMobileData]> { get }
    var isRefreshing: Observable<Bool?> { get }
    var error: Observable<Error?> { get }
    func reloadMobileData()
}

final class MobileDataViewModel: MobileDataViewModelProtocol {

    var mobileData: Observable<[YearlyMobileData]> { mobileDataRelay.asObservable() }

    var error: Observable<Error?> { errorRelay.asObservable() }

    var isRefreshing: Observable<Bool?> { isRefreshingRelay.asObservable() }

    // MARK: Initialization

    init(mobileDataService: MobileDataServiceProtocol) {
        self.mobileDataService = mobileDataService
    }

    // MARK: MobileDataViewModelProtocol

    func reloadMobileData() {
        isRefreshingRelay.accept(true)
        let fetchMobileData = mobileDataService.fetchMobileData(resourceId: resourceId)
            .observeOn(MainScheduler.instance)
            .flatMap { [weak self] (response) -> Observable<[YearlyMobileData]> in
                guard let strongSelf = self else { return .just([]) }
                let dict = strongSelf.transform(quarterlyMobileData: response.result.records)
                return .just(dict)
            }

        fetchMobileData.subscribe(onNext: { [weak self] MobileData in
                guard let strongSelf = self else { return }
                strongSelf.mobileDataRelay.accept(MobileData)
                strongSelf.isRefreshingRelay.accept(false)
            }, onError: { [weak self] error in
                guard let strongSelf = self else { return }
                strongSelf.errorRelay.accept(error)
                strongSelf.isRefreshingRelay.accept(false)
            }).disposed(by: disposeBag)
    }

    // MARK: Private Variables

    private let mobileDataService: MobileDataServiceProtocol
    private let resourceId = "a807b7ab-6cad-4aa6-87d0-e283a7353a0f"
    private let disposeBag = DisposeBag()

    private var mobileDataRelay = BehaviorRelay<[YearlyMobileData]>(value: [])
    private var errorRelay = BehaviorRelay<Error?>(value: nil)
    private var isRefreshingRelay = BehaviorRelay<Bool?>(value: false)

    private func transform(quarterlyMobileData: [QuarterlyMobileData]) -> [YearlyMobileData] {
        let records = quarterlyMobileData
        var dict = [String: YearlyMobileData]()

        for (index, data) in records.enumerated() {
            let year = String(data.quarter.prefix(4))
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
