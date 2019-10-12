//
//  MenuItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This class is a base class for all menu items, like buttons,
 items, titles etc. It represents a standard menu item, like
 a `UIAlertController` action or an iOS 13 context menu item.

 `MenuItem`s are data classes that don't care about how they
 are to be presented. They can be used in action sheets, iOS
 13 context menus, as pure data objects etc. Therefore, they
 have no styling involved, since they do not care about that.
 Instead, style components that are created from these items,
 e.g. `ActionSheetItemCell` and `UIAlertController` items.
 
 `tapBehavior` is used to describe what should happen when a
 user taps a certain item. `.dismiss` means that the item is
 meant to dismiss the menu, while `.none` means that it must
 not have any effect. `.none` is not always applicable, e.g.
 in an iOS 13 context menu or a `UIAlertController`.
 
 You can subclass any `MenuItem` class to create custom item
 types. If you then want to use your type in an `ActionSheet`
 instance, you must also override `actionSheetCell(for)` and
 `actionSheetCellType`, to return the cell and cell type you
 need. It is important to override both, since the preferred
 cell height is derived from the cell type.
 */
open class MenuItem {
    
    
    // MARK: - Initialization
    
    public init(
        title: String,
        subtitle: String? = nil,
        value: Any? = nil,
        image: UIImage? = nil,
        isEnabled: Bool = true,
        tapBehavior: TapBehavior = .dismiss) {
        self.title = title
        self.subtitle = subtitle
        self.value = value
        self.image = image
        self.isEnabled = isEnabled
        self.tapBehavior = tapBehavior
    }
    
    
    // MARK: - Types
    
    public enum TapBehavior {
        case dismiss, none
    }
    
    
    // MARK: - Properties
    
    public var image: UIImage?
    public var isEnabled: Bool
    public var subtitle: String?
    public var tapBehavior: TapBehavior
    public var title: String
    public var value: Any?
    
    
    // MARK: - Usage properties
    
    var canBeUsedInAlertController: Bool { true }
    var canBeUsedInContextMenu: Bool { true }
    var shouldBeIgnoredByAlertController: Bool { return false }
    var shouldBeIgnoredByContextMenu: Bool { return false }
    
    
    // MARK: - Functions
    
    open func handleSelection(in menu: Menu) {}
}
