//
//  ActionSheetCollectionItem.swift
//  Sheeeeeeeeet
//
//  Created by Jonas Ullström (ullstrm) on 2018-03-01.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

/*
 
 Collection items can be used to present item collections in
 a collection view, using custom cells that you keep in your
 own project. Note that you must use cells that do implement
 `ActionSheetCollectionItemContentCell`.
 
 */

import Foundation

open class ActionSheetCollectionItem<T>: ActionSheetItem, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout where T: ActionSheetCollectionItemContentCell {
    
    
    // MARK: - Configuration
    
    public typealias CollectionItemCellAction = (_ cell: T, _ index: Int) -> ()
    
    
    // MARK: - Initialization
    
    public init(cellType: T.Type, itemCount: Int, setupAction: @escaping CollectionItemCellAction, selectionAction: @escaping CollectionItemCellAction) {
        self.cellType = cellType
        self.itemCount = itemCount
        self.setupAction = setupAction
        self.selectionAction = selectionAction
        super.init(title: "")
    }
    
    
    // MARK: - Properties
    
    public let cellType: T.Type
    public let itemCount: Int
    public let selectionAction: CollectionItemCellAction
    public let setupAction: CollectionItemCellAction
    
    
    // MARK: - Functions
    
    open override func applyAppearance(_ appearance: ActionSheetAppearance) {
        self.appearance = ActionSheetCollectionItemAppearance(copy: appearance.collectionItem)
        self.appearance.height = T.defaultSize.height + T.topInset + T.bottomInset + 0.5
    }
    
    open override func applyAppearance(to cell: UITableViewCell) {
        super.applyAppearance(to: cell)
        guard let itemCell = cell as? ActionSheetCollectionItemCell else { return }
        itemCell.setup(withNib: T.nib, owner: self)
    }
    
    open override func cell(for tableView: UITableView) -> UITableViewCell {
        let id = type(of: self).className
        tableView.register(ActionSheetCollectionItemCell.nib, forCellReuseIdentifier: id)
        let dequeued = tableView.dequeueReusableCell(withIdentifier: id)
        guard let cell = dequeued else { return UITableViewCell() }
        applyAppearance(to: cell)
        return cell
    }
    
    
    // MARK: - Collection View Delegate+Datasource
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let id = ActionSheetCollectionItemCell.itemCellIdentifier
        let dequeued = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath)
        guard let cell = dequeued as? T else { return UICollectionViewCell() }
        setupAction(cell, indexPath.row)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? T else { return }
        selectionAction(cell, indexPath.row)
    }
    
    
    // MARK: - FlowLayout delegate
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return T.defaultSize
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: T.topInset, left: T.leftInset, bottom: T.bottomInset, right: T.rightInset)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return T.itemSpacing
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
