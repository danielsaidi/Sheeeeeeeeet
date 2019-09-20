//
//  CollectionItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation
import CoreGraphics

/**
 Collection items can be used to present item collections of
 a certain item type, e.g. in a collection view.
 
 For now `CollectionItemType` has many presentation-specific
 properties, which is legacy reasons, where collection items
 were always collection view cells. This will be solved in a
 future version.
 
 `IMPORTANT` Note that action sheets that contain items that
 are based on `CollectionItem` must do some tweaks to listen
 for tap events within its `ActionSheetCollectionItem`. This
 is because a `CollectionItem` has no reference to the sheet.
 This means that its selection action can't modify the sheet.
 This problem doesn't exist when you create an `ActionSheet`
 with an `ActionSheetCollectionItem` directly, without using
 a `Menu` with a `CollectionItem`, since the action sheet is
 aware of itself and can setup the collection item correctly.
 
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
    public let itemSelectionAction: ItemAction
    public let itemSetupAction: ItemAction
    

    // MARK: - ActionSheetItemConvertible
    
    override func toActionSheetItem() -> ActionSheetItem {
        ActionSheetCollectionItem(
            itemCellType: itemType,
            itemCount: itemCount,
            setupAction: itemSetupAction,
            selectionAction: itemSelectionAction
        )
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
