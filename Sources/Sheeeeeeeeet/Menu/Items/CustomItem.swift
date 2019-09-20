//
//  CustomItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation
import CoreGraphics

/**
 Custom items can be used to present "custom items" (duh) in
 a way that depends on how the item is used. For instance, a
 custom item that is mapped to an `ActionSheetCustomItem` is
 going to use `UIKit` and `nib` files, while a `SwiftUI` app
 may handle it completely different.
 
 `IMPORTANT` Note that action sheets that contain items that
 are based on `CustomItem` must do some tweaks to listen for
 taps within its `ActionSheetCustomItem`s. This is because a
 `CustomItem` has no reference to the sheet.
 
 This problem does not exist when you create an `ActionSheet`
 with an `ActionSheetCustomItem` directly, without using the
 `Menu` approach, since the action sheet can refer to itself.
 */
open class CustomItem<T: CustomItemType>: MenuItem {
    
    
    // MARK: - Initialization
    
    public init(itemType: T.Type, itemSetupAction: @escaping ItemAction) {
        self.itemType = itemType
        self.itemSetupAction = itemSetupAction
        super.init(title: "", tapBehavior: .none)
    }
    
    
    // MARK: - Typealiases
    
    public typealias ItemAction = (T) -> Void
    
    
    // MARK: - Properties
    
    public let itemType: T.Type
    public let itemSetupAction: ItemAction
    

    // MARK: - ActionSheetItemConvertible
    
    override func toActionSheetItem() -> ActionSheetItem {
        ActionSheetCustomItem(
            cellType: itemType,
            setupAction: itemSetupAction
        )
    }
}


/**
 This protocol must be implemented by any item that is to be
 used together with an `CustomItem`, regardless of what that
 item will later be used for.
 */
public protocol CustomItemType {
    
    static var defaultSize: CGSize { get }
}
