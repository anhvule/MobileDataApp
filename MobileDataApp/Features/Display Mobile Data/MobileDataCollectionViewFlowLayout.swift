//
//  MobileDataCollectionViewFlowLayout.swift
//  MobileDataApp
//
//  Created by Le Anh Vu on 17/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import Foundation
import UIKit

final class MobileDataCollectionViewFlowLayout: UICollectionViewFlowLayout {
    private let definedCellSize = CGSize(width: 150, height: 100)
    private let definedSectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 24, right: 8)
    private let definedMinimumInteritemSpacing: CGFloat = 16
    private let definedMinimumLineSpacing: CGFloat = 16

    // MARK: - Initialization

    override init() {
        super.init()

        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init()
    }

    override func prepare() {
        super.prepare()
        adjustLayout()
    }

    // MARK: - Private

    private func setupLayout() {
        self.sectionInset = definedSectionInset
        self.itemSize = definedCellSize
        self.minimumInteritemSpacing = definedMinimumInteritemSpacing
        self.minimumLineSpacing = definedMinimumLineSpacing
    }

    private func adjustLayout() {
        let newWidth = minimumItemWidthToMakeEvenlySpaced(withWidth: collectionView!.bounds.size.width,
                                                          withMininumItemWidth: definedCellSize.width)
        itemSize = CGSize(width: newWidth, height: itemSize.height)
    }

    private func minimumItemWidthToMakeEvenlySpaced(withWidth containerWidth: CGFloat,
                                                withMininumItemWidth mininumItemWidth: CGFloat?) -> CGFloat {
        let itemWidth = mininumItemWidth ?? itemSize.width
        let itemSpacing = minimumInteritemSpacing
        let sectionLeftInset = sectionInset.left
        let sectionRightInset = sectionInset.right
        let sectionWidth = containerWidth - sectionLeftInset - sectionRightInset

        var n = floor( (sectionWidth + itemSpacing) / (itemWidth + itemSpacing) )
        n = max(1, n)

        let newMininumItemWidth = (sectionWidth - (n - 1) * itemSpacing) / n
        return newMininumItemWidth
    }
}
