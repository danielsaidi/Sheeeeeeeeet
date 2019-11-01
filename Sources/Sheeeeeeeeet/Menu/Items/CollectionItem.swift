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
 A `CollectionItem` can be used to present a collection with
 a certain item type, e.g. in a collection view.
 
 `IMPORTANT` Action sheets with `CollectionItem` must modify
 the item's selection actions to be able to detect item taps
 in an `ActionSheetCollectionItem` since the collection item
 has no reference to the sheet. Check out the demo app for a
 way to do this.
 */
open class CollectionItem: MenuItem {
    
    public init(
        itemType: CollectionItemType.Type,
        itemCount: Int,
        itemSetupAction: @escaping ItemAction,
        itemSelectionAction: @escaping ItemAction) {
        self.itemType = itemType
        self.itemCount = itemCount
        self.itemSetupAction = itemSetupAction
        self.itemSelectionAction = itemSelectionAction
        super.init(title: "", tapBehavior: .none)
    }
    
    public typealias ItemAction = (_ item: CollectionItemType, _ index: Int) -> Void
    
    public let itemType: CollectionItemType.Type
    public let itemCount: Int
    public var itemSelectionAction: ItemAction
    public let itemSetupAction: ItemAction
    
    override var canBeUsedInAlertController: Bool { false }
    override var canBeUsedInContextMenu: Bool { false }
}


/**
 This protocol must be implemented by any item that is to be
 used together with an `CollectionItem` and presented in the
 collection, regardless of what that collection is.
 */
public protocol CollectionItemType {
    
    static var preferredSize: CGSize { get }
    static var leftInset: CGFloat { get }
    static var rightInset: CGFloat { get }
    static var topInset: CGFloat { get }
    static var bottomInset: CGFloat { get }
    static var itemSpacing: CGFloat { get }
}
