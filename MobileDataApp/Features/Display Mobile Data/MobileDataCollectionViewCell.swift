//
//  MobileDataCollectionViewCell.swift
//  MobileDataApp
//
//  Created by Le Anh Vu on 17/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Cartography

class MobileDataCollectionViewCell: UICollectionViewCell {

    var imageClickedHandler: ((String)->())?

    // MARK: Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: MobileDataCollectionViewCell

    func loadMobileData(_ mobileData: YearlyMobileData) {
        self.mobileData = mobileData
        yearLabel.text = mobileData.year
        imageView.image = mobileData.hasDecreasedQuarterlyVolumes ? UIImage(named: "arrow-down") : UIImage(named: "arrow-up")

        dataVolumeLabel.attributedText = createAttributedText(mobileData.volumeOfMobileData)
    }

    // MARK: Private Variables

    private var mobileData: YearlyMobileData?

    private(set) lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [yearLabel, infoStackView])
        stackView.spacing = 16
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false

        containerView.addSubview(stackView)
        constrain(containerView, stackView) { containerView, stackView in
            stackView.edges == inset(containerView.edges, 16)
        }

        return stackView
    }()

    private(set) lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dataVolumeLabel, imageView])
        stackView.spacing = 16
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually

        return stackView
    }()

    private(set) lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.layer.cornerRadius = 6
        label.textAlignment = .center
        label.textColor = .redTint
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private(set) lazy var dataVolumeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.layer.cornerRadius = 6
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
        imageView.accessibilityIdentifier = "volumeTendency"
        imageView.setContentHuggingPriority(.required, for: .horizontal)

        return imageView
    }()

    private(set) lazy var tapGesture: UITapGestureRecognizer = {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(gesture:)))
        return tapGesture
    }()

    private(set) lazy var containerView: UIView = {
        let view = UIView()
        view.layer.shadowRadius = 8
        view.backgroundColor = .white
        view.layer.shadowOpacity = 0.08
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.translatesAutoresizingMaskIntoConstraints = false

        addSubview(view)
        constrain(self, view) { contentView, containerView in
            contentView.edges == containerView.edges
        }

        return view
    }()

    private func setupViews() {
        _ = containerView
        _ = mainStackView
    }

    private func createAttributedText(_ volumeOfMobileData: Double) -> NSMutableAttributedString {
        let attributedText = NSMutableAttributedString()
        let volumeAttributedText = NSAttributedString(string: String(format: "%.1f", volumeOfMobileData), attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 12, weight: .medium)
        ])
        attributedText.append(volumeAttributedText)

        let unitAttributedText = NSAttributedString(string: " Petabytes", attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 10, weight: .light)
        ])
        attributedText.append(unitAttributedText)

        return attributedText
    }

    // MARK: Actions

    @objc func imageTapped(gesture: UIGestureRecognizer) {
        guard let mobileData = mobileData else { return }

        let year = mobileData.year
        imageClickedHandler?(mobileData.hasDecreasedQuarterlyVolumes ?
            "There is a quarter in \(year) demonstrates a decrease in volume data." :
            "There is no quarter in \(year) demonstrates a decrease in volume data.")
    }
}
