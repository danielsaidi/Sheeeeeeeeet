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

 You can subclass any class in the `MenuItem` type hierarchy
 to create new menu item types. If you need the class to use
 a different cell type than its parent, you have to override
 `actionSheetCell(for:)` and `actionSheetCellType` to return
 the cell and cell type you need. It's important to override
 both properties, otherwise the item may get a wrong cell or
 cell height.
 
 `tapBehavior` is used to describe what should happen when a
 user taps a certain item. `.dismiss` means that the item is
 meant to dismiss the menu, while `.none` means that it must
 not have any effect. `.none` is not always applicable, e.g.
 in an iOS 13 context menu or a `UIAlertController`.

 Since `MenuItem` classes are just data classes, they do not
 care about how they are presented. You must therefore style
 components that are created from these items instead of the
 items themselves. For instance, `ActionSheetItemCell` cells
 use appearance proxies, while the `UIAlertController` items
 provide very limited options.
 */
open class MenuItem {
    
    
    // MARK: - Initialization
    
    public init(
        title: String,
        subtitle: String? = nil,
        value: Any? = nil,
        image: UIImage? = nil,
        tapBehavior: TapBehavior = .dismiss) {
        self.title = title
        self.subtitle = subtitle
        self.value = value
        self.image = image
        self.tapBehavior = tapBehavior
    }
    
    
    // MARK: - Types
    
    public enum TapBehavior {
        case dismiss, none
    }
    
    
    // MARK: - Properties
    
    public var image: UIImage?
    public var subtitle: String?
    public var tapBehavior: TapBehavior
    public var title: String
    public var value: Any?
    
    
    // MARK: - Functions
    
    open func handleSelection(in menu: Menu) {}
    
    
    // MARK: - ActionSheet
    
    open func actionSheetCell(for tableView: UITableView) -> ActionSheetItemCell {
        ActionSheetItemCell(style: .value1)
    }
    
    open var actionSheetCellHeight: Double {
        actionSheetCellType.appearance().height
    }
    
    open var actionSheetCellType: ActionSheetItemCell.Type {
        ActionSheetItemCell.self
    }
}
