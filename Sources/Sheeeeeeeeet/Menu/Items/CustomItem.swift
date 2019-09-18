//
//  CustomItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 Custom items can be used to present any custom content in a
 menu. `itemType` can be the model itself, the cell type for
 `UIKit`-based collection views etc.
 
 TODO: Implement `ActionSheetItemConvertible`, by decoupling
 the item type from the cell concept.
 */
open class CustomItem<T>: MenuItem {
    
    
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
        assertionFailure("This is not yet supported.")
        return super.toActionSheetItem()
    }
}
