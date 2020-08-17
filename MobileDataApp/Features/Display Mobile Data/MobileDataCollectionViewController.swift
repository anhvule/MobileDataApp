//
//  MobileDataCollectionViewController.swift
//  MobileDataApp
//
//  Created by Le Anh Vu on 17/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import Foundation
import RxSwift
import Cartography

final class MobileDataCollectionViewController: UIViewController {

    lazy var viewModel: MobileDataViewModelProtocol = MobileDataViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupBindings()
        viewModel.reloadMobileData()
    }

    // MARK: Private

    private let disposeBag = DisposeBag()
    private let collectionViewMobileDataReuseIdentifier = "collectionViewMobileDataReuseIdentifier"

    private lazy var collectionView: UICollectionView = { [unowned self] in
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: MobileDataCollectionViewFlowLayout())
        collectionView.register(MobileDataCollectionViewCell.self, forCellWithReuseIdentifier: collectionViewMobileDataReuseIdentifier)
        collectionView.contentInset = .zero
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .lightGray
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(collectionView)

        constrain(view, collectionView) { view, collectionView in
            view.edges == collectionView.edges
        }

        return collectionView
    }()

    private lazy var refreshControl: UIRefreshControl = { [unowned self] in
        let view = UIRefreshControl()
        view.tintColor = UIColor.white
        collectionView.addSubview(view)
        return view
    }()

    private lazy var activityIndicatorView: UIActivityIndicatorView = { [unowned self] in
        let view = UIActivityIndicatorView(style: .medium)
        view.hidesWhenStopped = true
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)

        constrain(self.view, view) { view, indicatorView in
            view.centerX == indicatorView.centerX
            view.centerY == indicatorView.centerY
        }
        return view
    }()

    private func setupViews() {
        _ = collectionView
        _ = refreshControl
        _ = activityIndicatorView
    }

    private func setupBindings() {
        viewModel.error
            .subscribe (onNext: { [weak self] (error) in
                guard let strongSelf = self, let error = error as? MobileDataError else { return }
                strongSelf.displayMessage(message: error.description)
            }).disposed(by: disposeBag)

        viewModel.mobileData
            .skip(1)
            .bind(to: collectionView.rx
            .items(cellIdentifier: collectionViewMobileDataReuseIdentifier, cellType: MobileDataCollectionViewCell.self)) { [weak self] row, mobileData, cell in
                cell.loadMobileData(mobileData)
                cell.imageClickedHandler = { message in
                    self?.displayMessage(message: message)
                }
            }.disposed(by: disposeBag)

        self.refreshControl.rx
            .controlEvent(.valueChanged)
            .subscribe(onNext: { [weak self] (_) in
                guard let strongSelf = self else { return }
                strongSelf.viewModel.reloadMobileData()
            }).disposed(by: disposeBag)

        viewModel.isRefreshing
            .subscribe(onNext: { [weak self] (isRefreshing) in
                guard let strongSelf = self, let isRefreshing = isRefreshing else { return }
                if isRefreshing {
                    strongSelf.activityIndicatorView.startAnimating()
                } else {
                    strongSelf.activityIndicatorView.stopAnimating()
                    strongSelf.refreshControl.endRefreshing()
                }
            }).disposed(by: disposeBag)
    }

    private func displayMessage(message: String) {
        let alertController = UIAlertController(title: "Notification", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        present(alertController, animated: true, completion: nil)
    }
}

