//
//  ActionSheetCollectionItem.swift
//  Sheeeeeeeeet
//
//  Created by Jonas Ullström (ullstrm) on 2018-03-01.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

import CoreGraphics
import UIKit

/**
 Collection items can be used to present item collections in
 a collection view.
 
 In this implementation, `T` must be a `UICollectionViewCell`
 and implement `CollectionItemType`. These cells must have a
 `.xib` file with the same name as the class within the same
 bundle as the class.
 
 `TODO` Unit test
 */
open class ActionSheetCollectionItem<T: CollectionItemType>: ActionSheetItem, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    // MARK: - Initialization
    
    public init(
        itemCellType: T.Type,
        itemCount: Int,
        setupAction: @escaping CellAction,
        selectionAction: @escaping CellAction) {
        self.itemCellType = itemCellType
        self.itemCount = itemCount
        self.setupAction = setupAction
        self.selectionAction = selectionAction
        super.init(title: "", tapBehavior: .none)
    }
    
    
    // MARK: - Typealiases
    
    public typealias CellAction = (_ cell: T, _ index: Int) -> ()
    
    
    // MARK: - Properties
    
    public override var height: CGFloat { return T.defaultSize.height }
    
    public let itemCellType: T.Type
    public let itemCount: Int
    public var selectionAction: CellAction
    public let setupAction: CellAction
    
    
    // MARK: - Functions
    
    open override func cell(for tableView: UITableView) -> ActionSheetItemCell {
        tableView.register(ActionSheetCollectionItemCell.self, forCellReuseIdentifier: className)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)
        guard let typedCell = cell as? ActionSheetCollectionItemCell else { fatalError("Invalid cell type resolved for `ActionSheetCollectionItemCell`") }
        let className = String(describing: T.self)
        let nib = UINib(nibName: className, bundle: nil)
        typedCell.setup(withNib: nib, owner: self)
        return typedCell
    }
    
    open func extendSelectionAction(toReload actionSheet: ActionSheet) {
        extendSelectionAction { _, _ in
            actionSheet.reloadData()
        }
    }
    
    open func extendSelectionAction(with action: @escaping CellAction) {
        let currentSelectionAction = selectionAction
        selectionAction = { cell, index in
            currentSelectionAction(cell, index)
            action(cell, index)
        }
    }
    
    
    // MARK: - UICollectionViewDataSource
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        itemCount
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let id = ActionSheetCollectionItemCell.itemCellIdentifier
        let dequeued = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath)
        guard let item = dequeued as? T else { fatalError("Invalid item resolved for CollectionItemType") }
        guard let cell = item as? UICollectionViewCell else { fatalError("ActionSheetCollectionItem only supports CollectionItemType's that inherit UICollectionViewCell") }
        setupAction(item, indexPath.row)
        return cell
    }
    
    
    // MARK: - UICollectionViewDelegate
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? T else { return }
        selectionAction(cell, indexPath.row)
    }
    
    
    // MARK: - FlowLayout delegate
    
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
    
    func setup(withNib nib: UINib, owner: UICollectionViewDataSource & UICollectionViewDelegate) {
        let id = ActionSheetCollectionItemCell.itemCellIdentifier
        collectionView.contentInset = .zero
        collectionView.register(nib, forCellWithReuseIdentifier: id)
        collectionView.dataSource = owner
        collectionView.delegate = owner
        collectionView.reloadData()
    }
}
