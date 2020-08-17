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

    init(mobileDataRepository: MobileDataRepositoryProtocol = AppComponents.mobileDataRepository) {
        self.mobileDataRepository = mobileDataRepository
    }

    // MARK: MobileDataViewModelProtocol

    func reloadMobileData() {
        isRefreshingRelay.accept(true)
        let fetchMobileData = mobileDataRepository.fetchMobileData(resourceId: resourceId)
            .observeOn(MainScheduler.instance)

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

    private let mobileDataRepository: MobileDataRepositoryProtocol
    private let resourceId = "a807b7ab-6cad-4aa6-87d0-e283a7353a0f"
    private let disposeBag = DisposeBag()

    private var mobileDataRelay = BehaviorRelay<[YearlyMobileData]>(value: [])
    private var errorRelay = BehaviorRelay<Error?>(value: nil)
    private var isRefreshingRelay = BehaviorRelay<Bool?>(value: false)
}
