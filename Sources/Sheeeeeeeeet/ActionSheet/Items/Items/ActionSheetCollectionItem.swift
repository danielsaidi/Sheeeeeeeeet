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
 
 A cell must implement `ActionSheetCollectionItemContentCell`
 to be used with this item. The .xib must have the same name
 as the cell's class name.
 
 This class will dequeue a different cell type than standard
 action sheet items. If you look at `cell(for: ...)`, you'll
 see that it uses `ActionSheetCollectionItemCell` for its id.
 */
open class ActionSheetCollectionItem<T: ActionSheetCollectionItemContentCell>: ActionSheetItem, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
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
        super.init(title: "")
    }
    
    
    // MARK: - Typealiases
    
    public typealias CellAction = (_ cell: T, _ index: Int) -> ()
    
    
    // MARK: - Properties
    
    public override var height: CGFloat { return T.defaultSize.height }
    public let itemCellType: T.Type
    public let itemCount: Int
    public private(set) var selectionAction: CellAction
    public let setupAction: CellAction
    
    
    // MARK: - Functions
    
    open override func cell(for tableView: UITableView) -> ActionSheetItemCell {
        tableView.register(ActionSheetCollectionItemCell.self, forCellReuseIdentifier: className)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)
        guard let typedCell = cell as? ActionSheetCollectionItemCell else { fatalError("Invalid cell type created by superclass") }
        typedCell.setup(withNib: T.nib, owner: self)
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
        guard let cell = dequeued as? T else { return UICollectionViewCell() }
        setupAction(cell, indexPath.row)
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


// MARK: - Cell

/**
 This protocol must be implemented by any cell that is to be
 used together with an `ActionSheetCollectionItem`.
 */
public protocol ActionSheetCollectionItemContentCell where Self: UICollectionViewCell {
    
    static var nib: UINib { get }
    static var defaultSize: CGSize { get }
    static var leftInset: CGFloat { get }
    static var rightInset: CGFloat { get }
    static var topInset: CGFloat { get }
    static var bottomInset: CGFloat { get }
    static var itemSpacing: CGFloat { get }
}
