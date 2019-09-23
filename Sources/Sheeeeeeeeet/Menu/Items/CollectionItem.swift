//
//  CollectionItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

/**
 Collection items can be used to present item collections of
 a certain item type, e.g. in a collection view.
 
 `IMPORTANT` Note that action sheets that contain items that
 are based on `CollectionItem` must do some tweaks to listen
 for tap events within its `ActionSheetCollectionItem`. This
 is because a `CollectionItem` has no reference to the sheet.
 Have a look at the demo app for an example.
 */
open class CollectionItem<T: CollectionItemType>: MenuItem {
    
    
    // MARK: - Initialization
    
    public init(
        itemType: T.Type,
        itemCount: Int,
        itemSetupAction: @escaping ItemAction,
        itemSelectionAction: @escaping ItemAction) {
        self.itemType = itemType
        self.itemCount = itemCount
        self.itemSetupAction = itemSetupAction
        self.itemSelectionAction = itemSelectionAction
        super.init(title: "", tapBehavior: .none)
    }
    
    
    // MARK: - Typealiases
    
    public typealias ItemAction = (_ item: T, _ index: Int) -> Void
    
    
    // MARK: - Properties
    
    public let itemType: T.Type
    public let itemCount: Int
    public var itemSelectionAction: ItemAction
    public let itemSetupAction: ItemAction
    

    // MARK: - ActionSheet
    
    /**
     When getting an action sheet cell for a collection item,
     `T` must be a `UICollectionViewCell` and must implement
     `CollectionItemType`. It must also have a matching .xib
     file with the same name as the class in the same bundle.
     */
    open override func cell(for tableView: UITableView) -> ActionSheetItemCell {
        let className = String(describing: type(of: self))
        tableView.register(ActionSheetCollectionItemCell.self, forCellReuseIdentifier: className)
        let cell = tableView.dequeueReusableCell(withIdentifier: className)
        guard let typedCell = cell as? ActionSheetCollectionItemCell else { fatalError("Invalid cell type resolved for `ActionSheetCollectionItemCell`") }
        let nib = UINib(nibName: String(describing: T.self), bundle: nil)
        let handler = ActionSheetCollectionItemCellHandler(item: self)
        typedCell.setup(withNib: nib, handler: handler)
        return typedCell
    }
    
    open override var cellHeight: Double {
        Double(T.defaultSize.height)
    }
}


/**
 This protocol must be implemented by any item that is to be
 used together with an `CollectionItem` and presented in the
 collection, regardless of what that collection is.
 */
public protocol CollectionItemType {
    
    static var defaultSize: CGSize { get }
    static var leftInset: CGFloat { get }
    static var rightInset: CGFloat { get }
    static var topInset: CGFloat { get }
    static var bottomInset: CGFloat { get }
    static var itemSpacing: CGFloat { get }
}
