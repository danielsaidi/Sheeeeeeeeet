//
//  ActionSheetCollectionItemCell.swift
//  Sheeeeeeeeet
//
//  Created by Jonas Ullström (ullstrm) on 2018-03-01.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

import CoreGraphics
import UIKit

/**
 This class handles all data source and delegate logic for a
 collection item cell.
 */
open class ActionSheetCollectionItemCellHandler: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    // MARK: - Initialization
    
    public init(item: CollectionItem) {
        self.item = item
    }
    
    
    // MARK: - Properties
    
    public let item: CollectionItem
    
    
    // MARK: - UICollectionViewDataSource
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        item.itemCount
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let id = ActionSheetCollectionItemCell.itemCellIdentifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath)
        guard let item = cell as? CollectionItemType else { fatalError("ActionSheetCollectionItemCellHandler.collectionView(cellForItemAt) requires that the dequeued cell is a CollectionItemType.") }
        self.item.itemSetupAction(item, indexPath.row)
        return cell
    }
    
    
    // MARK: - UICollectionViewDelegate
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        guard let typedCell = cell as? CollectionItemType else { return }
        item.itemSelectionAction(typedCell, indexPath.row)
    }
    
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        item.itemType.preferredSize
    }
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(
            top: item.itemType.topInset,
            left: item.itemType.leftInset,
            bottom: item.itemType.bottomInset,
            right: item.itemType.rightInset
        )
    }
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        item.itemType.itemSpacing
    }
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}


// MARK: -

open class ActionSheetCollectionItemCell: ActionSheetItemCell {
    
    
    // MARK: - Properties
    
    private var handler: (UICollectionViewDataSource & UICollectionViewDelegate & UICollectionViewDelegateFlowLayout)?
    
    static let itemCellIdentifier = ActionSheetCollectionItemCell.className
    
    
    // MARK: - Outlets
    
    private lazy var collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: flow)
        view.backgroundColor = .clear
        contentView.addSubview(view, fill: true)
        return view
    }()
    
    
    // MARK: - Functions
    
    func setup(withNib nib: UINib, handler: ActionSheetCollectionItemCellHandler) {
        let id = ActionSheetCollectionItemCell.itemCellIdentifier
        collectionView.contentInset = .zero
        collectionView.register(nib, forCellWithReuseIdentifier: id)
        self.handler = handler
        collectionView.dataSource = handler
        collectionView.delegate = handler
        collectionView.reloadData()
    }
}
