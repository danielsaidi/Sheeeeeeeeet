//
//  ActionSheetCollectionItemCellHandler.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-30.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This class handles all data source and delegate logic for a
 collection item cell.
 */
open class ActionSheetCollectionItemCellHandler: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    // MARK: - Initialization
    
    public init(item: CollectionItem, tableView: UITableView) {
        self.item = item
        self.tableView = tableView
    }
    
    
    // MARK: - Properties
    
    public let item: CollectionItem
    public unowned var tableView: UITableView?
    
    
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
        tableView?.reloadData()
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
