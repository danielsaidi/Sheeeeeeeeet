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
open class ActionSheetCollectionItemCellHandler<T: CollectionItemType>: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    // MARK: - Initialization
    
    public init(item: CollectionItem<T>) {
        self.item = item
    }
    
    
    // MARK: - Properties
    
    public let item: CollectionItem<T>!
    
    
    // MARK: - UICollectionViewDataSource
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        item.itemCount
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let id = ActionSheetCollectionItemCell.itemCellIdentifier
        let dequeued = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath)
        guard let item = dequeued as? T else { fatalError("Invalid item resolved for CollectionItemType") }
        guard let cell = item as? UICollectionViewCell else { fatalError("ActionSheetCollectionItem only supports CollectionItemType's that inherit UICollectionViewCell") }
        self.item.itemSetupAction(item, indexPath.row)
        return cell
    }
    
    
    // MARK: - UICollectionViewDelegate
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? T else { return }
        item.itemSelectionAction(cell, indexPath.row)
    }
    
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        T.defaultSize
    }
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: T.topInset, left: T.leftInset, bottom: T.bottomInset, right: T.rightInset)
    }
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        T.itemSpacing
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
    
    func setup<T: CollectionItemType>(withNib nib: UINib, handler: ActionSheetCollectionItemCellHandler<T>) {
        let id = ActionSheetCollectionItemCell.itemCellIdentifier
        collectionView.contentInset = .zero
        collectionView.register(nib, forCellWithReuseIdentifier: id)
        self.handler = handler
        collectionView.dataSource = handler
        collectionView.delegate = handler
        collectionView.reloadData()
    }
}
